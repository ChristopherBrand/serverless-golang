FROM ubuntu:18.04

COPY bash_profile /root/.bashrc

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt install -y -q \
      nodejs \
      npm \
      golang \
      curl \
      awscli \
      git \
      wget && \
    npm install -g serverless && \
    export INSTALL_DIRECTORY=/usr/bin && \
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh && \
    mkdir -p /root/go/src

ENV GOPATH /root/go

#docker run -it -v " C:/Users/chris/Workspace/src/KeypartyServices:/root/go/src/Keyparty" serverless:latest