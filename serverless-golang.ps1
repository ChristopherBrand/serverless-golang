$cwd = (Get-Item -Path ".\").FullName


$image = "serverless-framework-golang:latest"
$dockerHubImage = "christopherbrand/serverless-framework-golang:latest"
$serverlessYML = "$($cwd)\serverless.yml"
$awsConfig = "$($home)\.aws"
$sshConfig = "$($home)\.ssh"
$projectDir = (Split-Path (Split-Path "$serverlessYML" -Parent) -Leaf)

# Verify that you are calling from a serverless framework project
if(![System.IO.File]::Exists($serverlessYML)){
  Write-Output "FATAL: this does not appear to be a serverless project. No yml found."
  exit
} else {
  Write-Output "INFO: This appears to be a serverless project"
}

# Verify that you have aws CLI configured
if(![System.IO.Directory]::Exists($awsConfig)){
  Write-Output "FATAL: you do not have a valid .aws config in your user directory."
  exit
} else {
  Write-Output "INFO: You have an AWS CLI config directory"
}

# Check if the image exists locally. If it doesn't download it and tag it
$imageTest = (docker images -q $image)
if(!$imageTest) {
  docker pull $dockerHubImage
  docker tag $dockerHubImage $image
}

$containerName = "serverless$($projectDir)"

$running = (docker inspect -f '{{.State.Running}}' $containerName)

if($running -eq "true") {
  Write-Output "INFO: Container running, entering bash shell"
  docker exec -it $containerName bash
} elseif($running -eq "false" -Or $? -eq "False") {
  if($running -eq "false") {
    docker rm -f $containerName
  }
  docker run -it -v "$($sshConfig):/root/.ssh" -v "$($awsConfig):/root/.aws" -v "$($cwd):/root/go/src/$($projectDir)" -w "/root/go/src/$($projectDir)" --name $containerName $image bash
}