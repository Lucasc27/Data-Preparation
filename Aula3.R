install.packages('titanic')
install.packages('ggplot2')
install.packages('ggrepel')
library(titanic)
library(dplyr)
library(ggplot2)
library(ggrepel)

data('titanic_train')
titanic_train <- as_tibble(titanic_train)
titanic_train
help(titanic_train)


# Desafio número 1
# Usando dplyr, plote um gráfico mostrando a proporção de passageiros para cada
# classe a bordo utilizando os nomes: 1 Classe, 2 Classe, 3 Classe.
# O gráfico deve conter, além de informação visual, o número do percentual de cada classe acompanhado
# do símbolo %


titanic_train %>%
  mutate(Classe = case_when(
    Pclass == 1 ~ "1 Classe",
    Pclass == 2 ~ "2 Classe",
    Pclass == 3 ~ "3 Classe"
  )) %>% 
  group_by(Classe) %>% 
  summarise(n = n()) %>% 
  mutate(perc = (n/sum(n))*100) %>% 
  ggplot(aes(x = Classe, y = perc)) +
  geom_col(fill = "purple") +
  geom_text(aes(label = paste0(round(perc, 2), "%")),
            vjust = -0.5)+
  ylim(0,60)+
  labs(x = "Classe", y = "Percentual", title = "Proporções de passageiros")

# Desafio número 2
# Exiba num gráfico a média de preço de ticket pago para cada classe com até duas casas decimais.


titanic_train %>% 
  mutate(Classe = case_when(
    Pclass == 1 ~ "1 Classe",
    Pclass == 2 ~ "2 Classe",
    Pclass == 3 ~ "3 Classe"
  )) %>% 
  group_by(Classe) %>% 
  summarise(media = mean(Fare)) %>% 
  ggplot(aes(x = Classe, y = media))+
  geom_point(size = 3)+
  geom_text(aes(label = round(media,2)),
            vjust = -0.8)+
  ylim(10,90)+
  labs(x = "Classe", y = "Preço", title = "Média do preço do Ticket")+
  theme_bw()+
  ggsave("Point_media.png", height = 4, width = 6, dpi = 100)

# Desafio número 3
# Exiba num gráfico a média da idade dos passageiros de cada classe por sexo e exiba os valores no gráfico.

titanic_train %>% 
  mutate(Classe = case_when(
    Pclass == 1 ~ "1 Classe",
    Pclass == 2 ~ "2 Classe",
    Pclass == 3 ~ "3 Classe"
  )) %>% 
  group_by(Classe,Sex) %>% 
  summarise(media_age = mean(Age, na.rm = T)) %>% 
  ggplot(aes(x = Classe, y = media_age, color = Sex))+
  geom_point()+
  geom_text_repel(aes(label = round(media_age,2)))
  
teste = data.frame(
  Col_1 = c(1:10),
  Col_2 = c(11:20),
  Col_2 = c(21:30),
  Col_2 = c(31:40)
  )
















