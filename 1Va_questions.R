#Carregar o pacote ggplot2
library(ggplot2)

agosto_data <- airquality[airquality$Month == 8, c("Day", "Temp")]

agosto_data <- agosto_data[order(agosto_data$Day), ]

#Criar o gráfico de linha
ggplot(agosto_data, aes(x = Day, y = Temp)) +
  geom_line(color = "black") +
  labs(title = "Temperatura Diária - Agosto",
       x = "Dia do Mês",
       y = "Temperatura (°F)") +


library(ggplot2)
View(WorldPhones)

#Extrair os dados de telefones 
anos <- as.numeric(row.names(WorldPhones))
n_same <- WorldPhones[, "Europe"]

#Criar um data frame com os dados necessários
s_amer_data <- data.frame(
  Year = anos,
  Phones = n_same
)

#Criar o gráfico de linha
ggplot(s_amer_data, aes(x = Year, y = Phones)) +
  geom_line(color = "red") +
  labs(title = "Número de Telefones na Europa (1951-1961)",
       x = "Ano",
       y = "Número de Telefones (milhares)")






