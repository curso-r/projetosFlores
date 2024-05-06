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
RUN R -e "install.packages('tidymodels')"
RUN R -e "install.packages('devtools')"
RUN R -e "install.packages('kknn')"
RUN R -e "devtools::load_all();roda_api();"
