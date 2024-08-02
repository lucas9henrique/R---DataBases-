# Atribuindo valores às variáveis X e Y
X = 133
Y = 36

# Adicionando a soma de X e Y a Z
Z = X + Y

# Calculando o logaritmo natural da raiz quadrada de Z
ln_sqrt_Z = log(sqrt(Z))

# Arredondando o resultado para zero dígitos
result = round(ln_sqrt_Z, 0)

print("oi")
print(result)


x= 1:4
y= 2:3

print(x)
print(y)
print(x*y)

----------------------------------------
  
maria = c(42,102,38,2149,97)
joana = c(38,173,71,1554,70)

----------------------------------------
#media
mean(vetor01, na.rm=TRUE)
#mediana
median(vetor01, na.rm=TRUE)
#desvio padrão
sd(vetor01, na.rm=TRUE)
#contagem de NA
sum(is.na(vetor01))
#percentual de NA
(sum(is.na(vetor01))/length(vetor01))*100
#notas
sum(vetor01>7 & vetor01<8, na.rm = TRUE)
sum(vetor01>9 | vetor01<1, na.rm = TRUE)

----------------------------------------
fator = gl(n=2,k=100,labels=c("F","M"))
print(fator)


drinks <- factor(c("beer","beer","wine","water"))
print(drinks)

proporcao=mean(drinks=="beer")

# Exibe a proporção
print(proporcao_beer)


levels(drinks)[1] <- "water"
print(drinks)

--------------
  
nomes = c("João", "Paula", "Maria", "Ingrid", "José", "Marcos")
pesos = c(80, 65, 70, 58, 78, 70)
alturas = c(1.70, 1.66, 1.65, 1.60, 1.76, 1.70)

lista_pessoas = list(nomes=nomes, pesos=pesos, alturas=alturas)
print(lista_pessoas)

IMC <- pesos / (alturas^2)

lista_pessoas$IMC <- IMC

print(lista_pessoas)

#acessar lista
lista_pessoas$nomes[1]
lista_pessoas[[1]][1]

#classe dos valores nas listas
classes_dos_objetos <- lapply(lista_pessoas, class)

lista_pessoas[[4]][3]

-------------
  
print(chuvas)

mean(chuvas, na.rm=TRUE)

somas_chuvas <- rowSums(chuvas)
maior_valor_chuva <- max(somas_chuvas)
municipio_maior_chuva <- names(somas_chuvas)[which.max(somas_chuvas)]

print(municipio_maior_chuva)


soma_dias <- colSums(chuvas)
valor_maior_dia <- max(soma_dias)
maior_dia <- names(soma_dias)[which.min(soma_dias)]

print(maior_dia)
---
aux <- chuvas["mun_81", ]; aux <- sum(aux[1:10]); print(aux)
aux <- chuvas[81, ]; aux <- sum(aux[1:10]); print(aux)
aux <- chuvas[81, ]; aux <- sum(aux[seq(1,10,1)]); print(aux)
aux <- chuvas["mun_81" ]; aux <- sum(aux[1:10]); print(aux)
aux <- chuvas["mun_81", ]; aux <- sum(aux[c(1:10)]); print(aux)


-------------
  
# O dataset airquality já está disponível no R, então você só precisa chamá-lo diretamente
data("airquality")

lista <- lapply(airquality, function(x) { mean(x, na.rm = TRUE) })

print(lista$Temp)

View(airquality)

-----------
airM=subset(x=airquality,
         subset=Month==5)

min(airM$Ozone, na.rm=TRUE)
-----------
OzTemp=subset(x=airquality,
              subset= Ozone>25 &
                      Temp<90)
View(OzTemp)

mean(OzTemp$Solar.R, na.rm=TRUE)

x = airquality[complete.cases(airquality),]
dim(x)
----------------------------------------
  
mouse.color = c("purple","red","yellow","brown")
mouse.weight = c(23,21,18,26)


mouse.info = data.frame("colour"=mouse.color, "weight"=mouse.weight)


str(mouse.info)
View(mouse.info)
mouse.info[3,]
mouse.info[,1]
mouse.info[4,1]


-----------------------------
genomas<- as.data.frame(read.csv("C:/Users/Lucas Henrique/Desktop/UFRPE/Comp. Analise de Dados/genomes.csv"))
View(genomas)
str(genomas)
genomas40=subset(x=genomas,
                 subset=Chromosomes>39)
genomasA=subset(x=genomas,
                 subset=Chromosomes>1 & Plasmids>1)
View(genomasA)

groups = genomas$Groups



# Separar os grupos em cada elemento do vetor
splitted_groups <- strsplit(groups, ";")


all_groups <- unlist(splitted_groups)


number_of_unique_groups <- length(unique_groups)
unique_groups_df <- data.frame(Group = unique_groups)

View(unique_groups_df)
print(paste("Total de grupos únicos:", number_of_unique_groups))
--------------
cancer_stats <- as.data.frame(read.csv("C:/Users/Lucas Henrique/Desktop/UFRPE/Comp. Analise de Dados/cancer_stats.csv"))
View(cancer_stats)

cancerDigestive=subset(x=cancer_stats,
            subset=Class=="Digestive System" & Male.Cases < Female.Cases)

View(cancerDigestive)


#Calculando Taxa de Mortalidade
cancer_stats$taxaM = cancer_stats$Male.Deaths / cancer_stats$Male.Cases
cancer_stats$taxaF = cancer_stats$Female.Deaths / cancer_stats$Female.Cases

#Removendo NA's dos casos masculinos
cancerMan=subset(x=cancer_stats,
                       subset=!is.na(Male.Cases))

#Pegando toda linha referente ao valor minimo da taxa calculada
min_row <- cancerMan[which.min(cancerMan$taxaM), ]

print(min_row)

#Removendo NA's dos casos femininos
cancerWom=subset(x=cancer_stats,
                 subset=!is.na(Female.Cases))

#Pegando toda linha referente ao valor maximo da taxa calculada
max_row <- cancerWom[which.max(cancerWom$taxaF), ]

print(max_row)


-------------------------------------

#mapply(fun=(){},dataset)
  
mapply(fun =(for(i in 5:1){
  A = 2*I
  
  for (s in 1:(A)) {
  lista[[X]] <- i^2
  print(lista)}
  
  for (f in 1:(A-1)) {
    lista[[Y]] <- i^2 
    print(lista)}
  
  }){x,y},{"Rural","Amo"})
  

for(i in 1:length(1:3)){
  for (j in 1:10) {
    print(j + (i-1))
  }
}

mapply(function(x, y) rep(x, y), c('Rural', 'Amo'),10:1)

-----------

student.df = data.frame (nome= c ("Sue", "Eva", "Henry", "Jan"), sexo= c ("f", "f", "m", "m"), anos= c (21,15,17,19))

student.df$menor <- ifelse(student.df$sexo == "m" & student.df$anos < 18, "V","F")

--------------

  
View(USArrests)

lapply(X=USArrests, FUN = sum)

x = 0

while (x < 100) {
  x = x + 2
}

print(x)


------------------

y=5

mult= function(x){
  return(x*y)
}
mult(10)



----
  
prisoes <- function(estados, tiposPrisoes){
  
  if(all(estados %in% rownames(USArrests))){
    
    if(all(tiposPrisoes %in% colnames(USArrests))){
      
      sum(USArrests[estados, tiposPrisoes])
      
    }
    else{print("Tipo de Prisão Inválida")}
    
  }
  else{print("Estado Inválido")}
  

}

prisoes(estados="Tennessee", tiposPrisoes=c("Rape","Murder"))

prisoes(estados=c("California ","Miami", "Arizona"), tiposPrisoes=("Assault"))

prisoes(estados=c("Pennsylvania","Mississippi", "Nebraska"), tiposPrisoes=c("Rape","UrbanPop","Assault"))

prisoes(estados=c("Vermont","Wisconsin", "Texas"), tiposPrisoes=c("Rape","Assalto"))


-----------------
#1 para retornar a média da 1 VA, 2 para retornar a média da 2 VA,
#3 para retornar a média da 3 VA e 4 para retornar a Média Final,
#incluindo a 3 VA.
  
if(VA3>VA1 & VA3<=VA2 & VA1>VA2){
    media=(VA3+VA2)/2
}

else if(VA3<=VA1 & VA3>VA2){
  media=(VA3+VA1)/2
}
else{
  media=(VA1+VA2)/2
}


  
minhasNotas_1 <- function(Exe_1=0, VA_1=0, Exe_2=0, Proj=0, VA_2=0, VA_3=0, Opt=1, threshold=7){
  
  Exe_1[is.na(Exe_1)] <- 0
  Exe_2[is.na(Exe_2)] <- 0
  
    if (length(VA_1) != 1) {
      return("Quantidade de Notas Inválidas para a VA_1")
    }
    if (length(Proj) != 1) {
      return("Quantidade de Notas Inválidas para a  2 VA")
    }
    if (length(VA_2) != 1) {
      return("Quantidade de Notas Inválidas para a 2 VA")
    }
    if (length(VA_3) != 1) {
      return("Quantidade de Notas Inválidas para a VA_3")
    }
  
  if (any(Exe_1 < 0 | Exe_1 > 10 | VA_1 < 0 | VA_1 > 10)) {
    return("Notas inválidas para a 1ª VA")
  }
  
  # Verificando os valores em Exe_2
  if (any(Exe_2 < 0 | Exe_2 > 10 | Proj < 0 | Proj > 10 | VA_2 < 0 | VA_2 > 10)) {
    return("Notas inválidas para a 2ª VA")
  }
  
  if (VA_3 < 0 | VA_3 > 10) {
    return("Notas inválidas para a 3ª VA")
  }
  
  Exe_1=mean(Exe_1)
  Exe_2=mean(Exe_2)

  VA1 = (((Exe_1) + (VA_1))/2)
  VA2 = (  (   (Exe_2*2) + (VA_2*3) + (Proj*5)   )  /10)
  VA3 = VA_3
  media=0
  
  medias <- c(VA1,VA2,VA3)
  dois_maiores <- sort(medias, decreasing = TRUE)[1:2]
  
  media=mean(dois_maiores)
  
  resultado = ifelse(media>threshold,"Aprovado","Na Final")
  
  switch (Opt,
          "1" = ifelse(VA1 == 0,
                       return("Aluno não possui nota para a 1 VA"),
                       return(paste(VA1, ifelse(VA1 > threshold, "e Acima da média", "e Abaixo da média")))),
          "2" = ifelse(VA2 == 0,
                       return("Aluno não possui nota para a 2 VA"),
                       return(paste(VA2, ifelse(VA2 > threshold, "e Acima da média", "e Abaixo da média")))),
          "3" = ifelse(VA3 == 0,
                       return("Aluno não possui nota para a 3 VA"),
                       return(paste(VA3, ifelse(VA3 > threshold, "e Acima da média", "e Abaixo da média")))),
          "4" = ifelse(media == 0,
                       return("Aluno não possui nota para a Media"),
                       return(paste(media, resultado)))
  )
}


minhasNotas_1(Exe_1=c(10,9,7,5,10,4,NA,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), Proj=c(7,5), VA_2=7, VA_3=9, Opt=1, threshold=8)
  

minhasNotas_1(Exe_1=c(10,9,7,5,NA,4,5,6,7,8,NA), VA_1=2, Exe_2=c(10,5.7,7.8,NA), Proj=4, VA_2=7, VA_3=9, Opt=2, threshold=5)


minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), Proj=c(4,5), VA_2=7, VA_3=9, Opt=2, threshold=8)


minhasNotas_1(Exe_1=c(NA,NA,7.5,1,10,2,5,6,7,8,10), VA_1=4, Exe_2=c(7,11,8.8,5,7,8), Proj=4, VA_2=7, VA_3=9, Opt=4, threshold=7)
  

minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(6,8,9,8,5,7,8), Proj=7, VA_2=7, VA_3=9, Opt=4, threshold=8)
