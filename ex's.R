getwd()

fileURL = "https://www.dropbox.com/s/w4xv9urbowbig3s/catsM.csv?dl=1"
destfile = "C:/Users/lucas.gonzaga/Documents/catsM.csv"

download.file( fileURL,destfile ,method = "auto")

list.files(getwd())

cats_data <- read.csv(destfile)

View(cats_data)


-----------------------------------------------------------------------
  
  
  # Criando um exemplo de data frame
  df <- data.frame(
    grupo = c("A", "A", "B", "B", "C", "C"),
    valores = c(10, 20, 30, 40, 50, 60)
  )

print(df)

# Usando aggregate para calcular a mC)dia dos valores por grupo
result <- aggregate(valores ~ grupo, data = df, FUN = mean)

# Visualizando o resultado
print(result)



----------------------------------------------------------------------

# Criando exemplos de data frames
df1 <- data.frame(
  id = c(1, 2, 3),
  nome = c("Alice", "Bob", "Charlie")
)

df2 <- data.frame(
  id = c(2, 3, 4),
  idade = c(25, 30, 35)
)

print(df1)
print(df2)

# Usando merge para combinar os data frames pela coluna 'id'
result <- merge(df1, df2, by = "id", all.x =TRUE)

# Visualizando o resultado
print(result)

  
----------------------------------------------------------------------
install.packages("dplyr")
library(dplyr)

# Criando um data frame de exemplo
df <- data.frame(
  id = 1:5,
  nome = c("Alice", "Bob", "Charlie", "David", "Eva"),
  idade = c(23, 25, 30, 22, 35),
  salario = c(50000, 55000, 60000, 52000, 58000)
)

# Visualizando o data frame
print(df)


# Selecionando as colunas 'nome' e 'idade'
df_selecionado <- df %>% select(nome, idade)
print(df_selecionado)

# Filtrando as linhas onde a idade C) maior que 25
df_filtrado <- df %>% filter(idade > 25)
print(df_filtrado)


# Reordenando as linhas pelo salC!rio em ordem crescente
df_ordenado <- df %>% arrange(salario)
print(df_ordenado)


# Reordenando as linhas pelo salC!rio em ordem decrescente
df_ordenado_desc <- df %>% arrange(desc(salario))
print(df_ordenado_desc)


# Adicionando uma nova coluna 'salario_anual' que C) o salC!rio multiplicado por 12
df_mutado <- df_ordenado_desc %>% mutate(salario_anual = salario * 12)
print(df_mutado)


# Calculando a mC)dia de idade e salC!rio
df_resumido <- df %>% summarise(media_idade = mean(idade), media_salario = mean(salario))
print(df_resumido)


# Agrupando por idade e calculando a mC)dia de salC!rio por idade
df_grouped <- df %>% group_by(idade) %>% summarise(media_salario = mean(salario))
print(df_grouped)


# Selecionando, filtrando e ordenando em um C:nico pipeline
df_pipeline <- df %>%
  select(nome, idade, salario) %>%
  filter(idade > 25) %>%
  arrange(desc(salario))

print(df_pipeline)


# Usando slice() para selecionar linhas especC-ficas
df_slice <- df %>% slice(1, 3, 5)

# Visualizando o resultado
print(df_slice)

# Selecionando as primeiras 3 linhas
df_slice_head <- df %>% slice_head(n = 3)

# Visualizando o resultado
print(df_slice_head)

# Selecionando as C:ltimas 3 linhas
df_slice_tail <- df %>% slice_tail(n = 3)

# Visualizando o resultado
print(df_slice_tail)






