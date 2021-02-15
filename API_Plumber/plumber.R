library("plumber")
library("jsonlite")
library("httr")
library("dplyr")
library("ggplot2")

###AQUI VOCE DEVE UTILIZAR O DIRETORIO QUE SUAS FUNCOES ESTAO
function_dir <- "C:/LivePlumber/api-plumber-example/functions/"

#* @apiTitle Criando API com Plumber
#* @apiDescription Esta Api e um exemplo desenvolvido para demonstrar alguns conceitos basicos sobre desenvolvimento utilizando o pacote Plumber do R.
#* @apiVersion 0.0.7
#* @apiTag CargaFrames description1
#*  
#* @apiTag Plottiong Plotando Graficos
#* @apiTag Interacting Interagindo com os dados


#* Carregar os dados utilizando biblioteca data.frame
#* @tag CargaFrames
#* @param url insira a url onde os dados estao available
#* @post /carga_datatable
function(url) {

 source(paste0(function_dir,"fn_create_frame_by_url.R"))
 
 df_memoria <<- fn_create_frame_by_url(url)
 
 resultat_final = list(Status      ="Succeed", 
                       qtdRegistro = nrow(df_memoria),
                       qtdColuna   = ncol(df_memoria),
                       Value       = head(df_memoria))

 return(resultat_final)
}

#* Listando todas as colunas do DataFrame
#* @tag Interacting
#* @get /colnames
function() {
  return(colnames(df_memoria))
}

#* Amostragem do campo selecionado
#* @tag Interacting
#* @param colname Nome da coluna desejada
#* @get /amostra
function(colname) {
#  colname <- "dsc_cidade"
  df_unique <<-  unique (df_memoria %>% select(colname))
  df_unique <<- data.frame(dados = df_unique)

  resultat_final = list(Status      ="Succeed", 
                        qtdRegistro = nrow(df_unique),
                        Value       = df_unique)
  
  return(resultat_final)
  
  }

#* Filtrando dados pelo campo selecionado
#* @tag Interacting
#* @param p_filter Nome da coluna que deseja utilizar de filtro desejada
#* @param r_filter Valor aplicar o filtro
#* @get /filter
function(p_filter , r_filter ) {
  df_filter <-  df_memoria %>% select_all() %>% filter(!!sym(p_filter) == r_filter )
  resultat_final = list(Status      ="Succeed", 
                        qtdRegistro = nrow(df_filter),
                        Value       = df_filter)
  return(resultat_final)
}



#* Plotando um grafico com a quantidade total
#* @serializer png
#* @tag Plottiong
#* @param p_filter
#* @get /plot2
function(p_filter) {
  df_calc <<- data.frame(df_memoria %>% group_by(!!sym(p_filter)) %>% summarise(qtd = n()))
  plot <- ggplot(df_calc, aes(x=!!sym(p_filter), y=qtd)) + geom_bar(stat = "identity")
  print(plot)

}
