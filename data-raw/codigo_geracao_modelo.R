# pacotes -----------------------------------------------------------------

library(tidyverse)
library(tidymodels)
set.seed(20240410)

# receita -----------------------------------------------------------------

receita <- recipe(Species ~ ., data = treino) |>
  step_normalize(all_numeric_predictors())

# modelo ------------------------------------------------------------------

especificacao_modelo <- nearest_neighbor(neighbors = tune()) |>
  set_mode("classification") |>
  set_engine("kknn")

meu_workflow <- workflow(
  preprocessor = receita,
  spec = especificacao_modelo
)

# escolha de hiperparametro -----------------------------------------------

reamostras <- vfold_cv(treino, v = 15)

resultado_cv <- tune_grid(
  meu_workflow,
  reamostras, grid = 40
)

# ajuste do modelo --------------------------------------------------------

especificacao_final <- especificacao_modelo |>
  finalize_model(
    select_best(resultado_cv, "accuracy")
  )

modelo_vigente <- workflow(
  preprocessor = receita,
  spec = especificacao_final
) |>
  fit(iris)

usethis::use_data(modelo_vigente, overwrite = TRUE)
