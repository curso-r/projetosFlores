gera_previsao <- function(
    Sepal.Length,
    Sepal.Width,
    Petal.Length,
    Petal.Width
  ){

  predict(
    modelo_vigente,
    new_data = data.frame(
      Sepal.Length,
      Sepal.Width,
      Petal.Length,
      Petal.Width
    ))$.pred_class

}

gera_probabilidade <- function(
    Sepal.Length,
    Sepal.Width,
    Petal.Length,
    Petal.Width
){

  predict(
    modelo_vigente,
    new_data = data.frame(
      Sepal.Length,
      Sepal.Width,
      Petal.Length,
      Petal.Width
    ), type = "prob")

}
