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