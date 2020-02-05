FROM ubuntu:bionic-20191202

## Install pandoc and texlive, using noninteractive mode to get around tzdata
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y texlive pandoc
