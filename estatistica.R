a = data.frame(
  elementos = c("A","B","C","D","E"),
  X = c(5,7,12,15,10)
)

# Resumo estatístico do data frame
resumo <- summary(a)

resumo

#Tamanho da amostra
nrow(a)

#Média
mean(a$X)

#Variancia
var(a$X)

#Proporção pares
pares = a$X %% 2 == 0

sum(pares)/nrow(a)


# Função para calcular o tamanho da amostra ajustado
calcula_tamanho_amostra <- function(Z, sigma, E, N) {
  # Calcula o tamanho da amostra para população infinita
  n_infinito <- (Z * sigma / E)^2
  
  # Ajusta o tamanho da amostra para população finita
  n_ajustado <- n_infinito / (1 + (n_infinito / N))
  
  # Retorna o valor ajustado com duas casas decimais
  return(format(n_ajustado, digits = 9))
}


# Definindo os valores conhecidos
Z <- 2.00    # Valor crítico para 95,5% de confiança
sigma <- 5   # Desvio padrão da população
E <- 1.5     # Erro máximo permitido
N <- 1500    # Tamanho da população

# Calculando o tamanho da amostra para população finita
n <- (Z * sigma / E)^2
n_finite <- n / (1 + (n / N))

# Exibindo o resultado com duas casas decimais
tamanho_amostra <- format(n_finite, digits = 9)
tamanho_amostra



# Definindo os valores conhecidos
Z <- 2.33    # Valor crítico para 98% de confiança
sigma <- 5   # Desvio padrão estimado
E <- 1       # Erro máximo permitido

# Calculando o tamanho da amostra
n <- (Z * sigma / E)^2

# Exibindo o resultado com duas casas decimais
tamanho_amostra <- format(n, digits = 9)
tamanho_amostra

