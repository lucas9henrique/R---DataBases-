breaks = seq(1940, 2030, by = 10)
labels = seq(1940, 2030, by = 10)

breaks
labels


netflixData <- read.csv("https://www.dropbox.com/scl/fi/vjlgt50835d6snk03add2/netflix_titles.csv?rlkey=rzrveurxlom9cjp51nbv4w1gw&e=1&dl=1")

#Séries
serie = subset(netflixData, netflixData$type == "TV Show")
tipoAno2 <- table(serie$release_year)

df_Serie <- as.data.frame(tipoAno2)
colnames(df_Serie) <- c("Ano", "Frequencia")

df_Serie$Ano <- as.character(df_Serie$Ano)

df_Serie$Ano <- as.numeric(df_Serie$Ano)

# Criando uma nova coluna para agrupar os anos em intervalos de 10 anos
df_Serie$decada <- cut(df_Serie$Ano, breaks = seq(1920, 2030, by = 10), right = FALSE, labels = seq(1920, 2020, by = 10))

View(df_Serie)