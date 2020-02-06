FROM ubuntu:eoan-20200114

## Install pandoc and texlive, using noninteractive mode to get around tzdata
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y texlive pandoc
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget

## Install Eisvogel template
WORKDIR /tmp
RUN mkdir -p /root/.pandoc/templates
RUN wget https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v1.4.0/Eisvogel-1.4.0.tar.gz
RUN mkdir -p eisvogel && tar -xvzf Eisvogel-1.4.0.tar.gz -C eisvogel && cp eisvogel/eisvogel.tex /root/.pandoc/templates/eisvogel.latex

## Install extras to run Eisvogel
## SEE: https://github.com/Wandmalfarbe/pandoc-latex-template/issues/141#issuecomment-576005221 for details
RUN DEBIAN_FRONTEND=noninteractive apt install -y texlive-latex-extra xzdec
RUN tlmgr init-usertree && tlmgr install adjustbox babel-german background bidi collectbox csquotes everypage filehook footmisc footnotebackref framed fvextra letltxmacro ly1 mdframed mweights needspace pagecolor  titling ucharcat ulem unicode-math upquote xecjk xurl zref
RUN apt-get install -y texlive-fonts-recommended texlive-fonts-extra
## RUN tlmgr install sourcecodepro sourcesanspro
