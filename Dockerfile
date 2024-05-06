FROM rstudio/plumber

WORKDIR /tmp/api/

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  curl \
  libsodium-dev \
  libxml2-dev

EXPOSE 80

RUN git clone https://github.com/curso-r/projetosFlores /tmp/api/
RUN Rscript -e "install.packages('tidymodels')"
RUN Rscript -e "install.packages('devtools')"
RUN Rscript -e "install.packages('kknn');devtools::load_all();roda_api();"
