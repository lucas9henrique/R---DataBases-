library(plotly)
library(dplyr)
library(tidyr)


data <- read.csv("/Users/Lucas Henrique/Desktop/UFRPE/Comp. Analise de Dados/Dados_Estatisticos.csv",sep = ";", header=TRUE)

# Suponha que df seja o seu data frame
data_filt <- data %>% select(4,5,6,7,8,10,12,13,14,16,20,21)

data_filt <- data_filt %>% filter(
  !is.na(ANO) & ANO != "" &
    !is.na(MES) & MES != "" &
    !is.na(AEROPORTO_DE_ORIGEM_NOME) & AEROPORTO_DE_ORIGEM_NOME != "" &
    !is.na(AEROPORTO_DE_DESTINO_NOME) & AEROPORTO_DE_DESTINO_NOME != "" &
    !is.na(PASSAGEIROS_PAGOS) &
    !is.na(PASSAGEIROS_GRATIS)
)

data_filt$PASSAGEIROS_TOTAIS = data_filt$PASSAGEIROS_GRATIS + data_filt$PASSAGEIROS_PAGOS

View(data_filt)


df_ano <- data_filt %>%
  group_by(ANO) %>%
  summarise(soma_valores = sum(PASSAGEIROS_TOTAIS, na.rm = TRUE))

# Visualizar o resultado
View(df_ano)

fig <- plot_ly(x = ~df_ano$ANO, y = ~df_ano$soma_valores, type = 'scatter', mode = 'lines+markers')
  
fig <- fig %>%
  layout(title = 'Frequencia de voos durantes os anos 2000 - 2024',
         yaxis=list(title = 'Qnd de Voos'),
         xaxis=list(title = 'Anos'))

fig


#2019

data_2019 <- data_filt %>% filter(ANO == 2019)

View(data_2019)

df_2019 <- data_filt %>%
  group_by(MES) %>%
  summarise(soma_valores = sum(PASSAGEIROS_TOTAIS, na.rm = TRUE))

fig <- plot_ly(x = ~df_2019$MES, y = ~df_2019$soma_valores, type = 'scatter', mode = 'lines+markers')

fig <- fig %>%
  layout(title = 'Frequencia de voos durantes os meses de 2019',
         yaxis=list(title = 'Qnd de Voos'),
         xaxis=list(title = 'Meses'))

fig