FROM ubuntu:bionic-20191202

## Install pandoc and texlive, using noninteractive mode to get around tzdata
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y texlive pandoc
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget

## Install Eisvogel template
WORKDIR /tmp
RUN mkdir -p ~/.pandoc/templates
RUN wget https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v1.4.0/Eisvogel-1.4.0.tar.gz
RUN mkdir -p eisvogel && tar -xvzf Eisvogel-1.4.0.tar.gz -C eisvogel && cp eisvogel/eisvogel.tex ~/.pandoc/templates


