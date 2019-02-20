# Data Preparation
# Aula 1
# Prof. Neylson Crepalde
# Lucas Cesar Fernandes Ferreira
# ------------------------------- #

# Instalando os pacotes necessários
install.packages("dplyr")

# Carregar o pacote dplyr no ambiente
library(dplyr)

# Carregando banco de dados padrão do R
data("iris")

# Verificar os primeiras observações
head(iris)

# Verificar os nomes das variáveis
names(iris)

# Verificar estrutura do objeto
str(iris)

# Verificar o tamanho do banco de dados/data frame
dim(iris)  # Verifica linhas e colunas
nrow(iris) # Verifica número de linhas
ncol(iris) # Verifica número de colunas

# Acessando a documentação do banco iris
help(iris)
?iris

################################
# Manupular os dados com dplyr #
################################


# Select - Seleciona colunas
select(iris, Species, Petal.Length)

# Select - Selecionando pela posição
names(iris)
select(iris, 5, 3)
select(iris, 1:4)
select(iris, 4:2)

# Select - Retirando uma variável do banco
select(iris, -5)
select(iris, -Species)
select(iris, -Species, -Petal.Length)

# Filter - Filtrando linhas a partir de alguma condição
filter(iris, Sepal.Length > 5)
filter(iris, Sepal.Length <= 4)

# Olhar para a variável categórica Species
table(iris$Species)

# Filtrando a categória 'setosa' de Species
filter(iris, Species == 'setosa')

# Filtrando todas menos 'setosa'
filter(iris, Species != 'setosa')
