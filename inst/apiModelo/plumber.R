library(plumber)

#* @apiTitle API do modelo de classificação de plantas
#* @apiDescription Esta API recebe dados morfológicos das plantas e devolve previsões de classificação e probabilidades de cada classe.

#* Produz previsões das plantinhas
#* @param Sepal.Length:dbl Comprimento da sépala
#* @param Sepal.Width:dbl Largura da sépala
#* @param Petal.Length:dbl Comprimento da pétala
#* @param Petal.Width:dbl Largura da pétala
#* @post /gera_previsao
function(Sepal.Length,
         Sepal.Width,
         Petal.Length,
         Petal.Width) {

  lista_resposta <- data.frame(
    Sepal.Length = as.numeric(Sepal.Length),
    Sepal.Width = as.numeric(Sepal.Width),
    Petal.Length = as.numeric(Petal.Length),
    Petal.Width = as.numeric(Petal.Width)
  )

lista_resposta$especie_mais_provavel = gera_previsao(
    as.numeric(Sepal.Length),
    as.numeric(Sepal.Width),
    as.numeric(Petal.Length),
    as.numeric(Petal.Width))

lista_resposta$probabilidades = gera_probabilidade(
  as.numeric(Sepal.Length),
  as.numeric(Sepal.Width),
  as.numeric(Petal.Length),
  as.numeric(Petal.Width))

return(lista_resposta)
}
