FROM rocker/tidyverse

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  curl \
  libsodium-dev \
  libxml2-dev

COPY ./ /tmp/api/
WORKDIR /tmp/api/
RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('tidymodels')"
RUN R -e "install.packages('devtools')"

EXPOSE 80

CMD ["Rscript", "-e", "devtools::load_all();roda_api();"]
