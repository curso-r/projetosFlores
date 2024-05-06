FROM rstudio/plumber

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  curl \
  libsodium-dev \
  libxml2-dev

RUN git clone https://github.com/curso-r/projetosFlores /tmp/api/
WORKDIR /tmp/api/
RUN R -e "install.packages('tidymodels')"
RUN R -e "install.packages('devtools')"

EXPOSE 80

CMD ["Rscript", "-e", "devtools::load_all();roda_api();"]
