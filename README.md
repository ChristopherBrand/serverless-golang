# Serverless Golang

Serverless Golang leverages Docker to provide a command line environment that will allow you to use Golang and the Serverless Framework on a Windows workstation.

## Prerequisites

### Docker

Docker CE can be downloaded and installed from https://www.docker.com/community-edition

### AWS CLI

You must have the AWS CLI downloaded and configured on your workstation.

### Powershell configuration

It is recommended to set your execution policy to remotesigned. This will allow you to place the script in your ~\Documents\WindowsPowershell directory and run it globally.

```set-executionpolicy -Scope CurrentUser remotesigned```

## Installation

The easiest way to use this script is to place it in your ~\Docuements\WindowsPowershell directory.

```
git clone https://github.com/ChristopherBrand/serverless-golang.git
cd serverless-golang
cp serverless-golang.ps1 ~\Documents\WindowsPowershell
```

## Usage

To use serverless-golang simply navigate to your project directory in Powershell and run the command `serverless-golang.ps1`

You will then have a linux bash shell in Windows that will respond to all the serverless commands and allow you to properly build and deploy Golang serverless projects.

## Working With The Docker Image

We maintain a prebuilt docker image in docker hub that the script will automatically pull. Should you have custom requirements you can make changes to the `Dockerfile` in the docker directory and run `build.ps1` to build the image to a standard name and tag that the serverless-golang script will automatically pick up.