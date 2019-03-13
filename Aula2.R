# Data Preparation
# Aula 2
# Prof. Neylson Crepalde
# Lucas Cesar Fernandes Ferreira
# ------------------------------- #

install.packages('dplyr')
library(dplyr)

data('starwars')
?starwars
starwars

# Usando o estilo tidy, selecione as variáveis nome, altura, peso e espécie,
# e filtre apenas os casos em que a altura for maior que a média
# mostre quem são os maiores personagens

summary(starwars$height)

starwars %>%
  select(name, height, mass, species, height) %>%
  filter(height > mean(height, na.rm = T)) %>%
  arrange(desc(height))

# Selecionar as variáveis nome, peso, massa, cor dos olhos, mundo,
# filtrar os casos em que o peso for menor do que a mediana,
# mostre quem são os personagens mais leves

starwars %>%
  select(name, mass, height, eye_color, homeworld) %>%
  filter(mass < median(mass, na.rm = T)) %>%
  arrange(mass)

# Selecione as variáveis nome, mundo e ano de nascimento,
# filtre apenas quem nasceu em Naboo
# e identificar as pessoas mais velhas

starwars %>%
  select(name, homeworld, birth_year) %>%
  filter(homeworld == 'Naboo') %>%
  arrange(birth_year)

#----------------------------------------------------------------

starwars %>%
  group_by(homeworld) %>%
  summarise(med = mean(height, na.rm = T),
            mediana = median(height, na.rm = T),
            desvio_padrao = sd(height, na.rm = T))

# A partir do banco de dados starwars,
# apresente a média e o desvio padrão do peso dos personagens
# para cada espécie e apresente do mais pesado para o mais leve

starwars %>%
  group_by(species) %>%
  summarise(media = mean(mass, na.rm = T),
            desvio_pd = sd(mass, na.rm = T)) %>%
  arrange(desc(media))

# Criar duas variáveis pesado e alto
# Pesado vai "Pesado" quando mass maior que a media e leve quando for menor ou igual
# Alto vai "Alto" quando height maior que a media e "Baixo" quando for menor ou igual
# Me mostrar quantos personagens são pesados e altos, pesados e baixos,
# leves e altos, leves e baixos

starwars %>%
  mutate(Pesado = if_else(mass > mean(mass, na.rm = T), "Pesado", "Leve"),
         Alto = if_else(height > mean(height, na.rm = T), "Alto", "Baixo")) %>%
  group_by(Pesado, Alto) %>%
  summarise(frequencia = n())









