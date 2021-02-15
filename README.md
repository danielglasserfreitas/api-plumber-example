# Como criar APIs utilizando o pacote Plumber do R | Creating APIs using Plumber

Desenvolvi este projeto para demonstrar alguns conceitos basicos no desenvolvimento de APIs utilizando o pacote Plumber do R. Aqui aproveito tambem para demonstrar alguns conceitos como utilizar suas funcoes R e disponibiliza-las rapidamente como APIs e demonstrar um pouco do poder e aplicabilidade do que gosto de chamar de "APIs on memory".

Vamos disponibilizar qualquer arquivo de [dados do governo brasileiro](https://dados.gov.br/dataset/) em formato csv como uma API.

Vamos utilizar como exemplo inicial os dados de endereco e qualificacao das Unidades Basicas de Saude (UBS) disponivel neste [link](http://repositorio.dados.gov.br/saude/unidades-saude/unidade-basica-saude/ubs.csv).

I developed this project to demonstrate some basic concepts of APIs development using the R package called Plumber. Here I also take the opportunity to demonstrate some concepts of how to use R functions and make them available as APIs and demonstrate a little of the power and applicability of what I like to call "APIs on memory".

We will make available any [Brazilian government data](https://dados.gov.br/dataset/) file in csv format as an API.

Let's use as an initial example the address and qualification data of the Basic Health Units (UBS) available in this [link](http://repositorio.dados.gov.br/saude/unidades-saude/unidade-basica-saude/ubs .csv).

## Plumber 

O Plumber eh um pacote open-source do R, utilizado para criar APIs de forma rapida e facil, proporcionando a possibilidade de reaproveitar suas funcoes transformando elas em endpoints. Funciona pelo conceito de "anotattions" possuindo um swagger embutido por default retirando a complexidade para documentar o desenvolvimento de sua API.

Permite a implementação do conceito de pipe-lines dinamicos com pré-rotas (preempt), filtros (filters) e rotas (endpoint) e com ele podemos inclusive integrar e transformar em API codigos de outras linguagens como Java, Python, Batch e etc..

Plumber is an open-source package from R, used to create APIs quickly and easily, providing the possibility to reuse your functions and turning them into endpoints. It works with the concept of "annotations" having a swagger built in by default removing the complexity to document the development of your API.

It allows the implementation the concept of dynamic pipe-lines with pre-routes (preempt), filters and routes (endpoint) and with it we can even integrate and transform codes from other languages such as Java, Python, Batch and etc. into APIs. 

## APIs on Memory

Quando sua aplicacao necessita realizar filtros, calculos, transformacoes ou gerar graficos com alta velocidade permitindo que diversos usuarios estejam conectados ao mesmo tempo sem agredir o sistema core com consultas utilizamos o conceito de "API on Memory".

Criamos um endpoint responsavel por realizar a carga dos dados para a memoria da API como um data frame permitindo assim que os demais endpoints realizem as interacoes sem necessariamente agredir os sistemas core com cada requisicao dos usuarios, com o apoio de pacotes auxiliares como o dplyr temos a possibilidade de realizar diversas operacoes com alta performance.

Aliado ao conceito de pipelines temos uma grande e poderosa ferramenta permitindo realizar filtros para cada secao que efetuou a requisicao trazendo apenas os dados relevantes a requisicao. Uma grande utilidade é possibilitar a distribuição de gráficos para múltiplos clients, sem a necessidade de acesso a fonte de dados permitindo assim uma grande velocidade na hora de "renderizar" as imagens.

When your application needs to perform filters, calculations, transformations or generate graphics with high speed allowing several users to be connected at the same time without attacking the core system with queries we use the concept of "API on Memory".

We created an endpoint responsible for loading the data into the memory of the API as a data frame, thus allowing the other endpoints to perform interactions without necessarily attacking the core systems with each user request, with the support of auxiliary packages such as dplyr we have. the possibility of carrying out several operations with high performance.

Allied to the concept of pipelines we have a great and powerful tool allowing to make filters for each section that made the request bringing only the relevant data to the request. A great utility is to enable the distribution of graphics to multiple clients, without the need to access the data source, thus allowing a great speed when "rendering" the images.


![Image](https://drive.google.com/file/d/1j6KNtQeK7gE6iqhndsWD6buI0cpA-XCB/view?usp=sharing)

[Apresentacao](https://docs.google.com/presentation/d/1TGYnrwaXUET69iAyNnC6CZDiY5yUv4p_FQZLa7aPnqk/edit?usp=sharing)
*Presentation is in portugueses only

[Dashboard Utilizando os conceitos](https://danielfreitas.shinyapps.io/ubs_brasil/)
