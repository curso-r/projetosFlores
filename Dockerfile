FROM rocker-tidymodels

WORKDIR /tmp/api/

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  curl \
  libsodium-dev \
  libxml2-dev

EXPOSE 80

RUN git clone https://github.com/curso-r/projetosFlores /tmp/api/
RUN Rscript -e ".libPaths('/tmp/api/pkgs/');install.packages('devtools')"
RUN Rscript -e ".libPaths('/tmp/api/pkgs/');install.packages('kknn');library(kknn);"
