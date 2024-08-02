#Exercicio 10

install.packages("dplyr")
library(dplyr)

install.packages("tidyr")
library(tidyr)
a = getwd()

#dyplyr

df=data.frame(Theoph)
View(df)

df_selec<-df%>%select(Dose)

df_maior5 <- df%>% filter(Dose > 5)

df_cut <- df%>%slice(10:20)

df_media5 <- df%>%filter(Dose>5,Time>(mean(df$Time)))

df_peso <- df%>%arrange(desc(Wt))

df_peso_time <- df%>%arrange(Wt,desc(Time))

df_meantime <- df%>%mutate(tendencia=(Time-(mean(df$Time))))

dfmaior <- df%>%summarise(max(conc))


----------------------

fileURL = "https://www.dropbox.com/s/gi59a1nq3ga9gb7/673598238_T_ONTIME_REPORTING.csv?dl=1"

destfile = paste0(a,"/Ontime.csv")

download.file( fileURL,destfile ,method = "auto")

list.files(getwd())

Ontime <- read.csv(destfile,quote="\"", sep = "," )

View(Ontime)  
  



fileURL = "https://www.dropbox.com/s/73bp8dl8nph6ufz/L_UNIQUE_CARRIERS.csv_?dl=1"

destfile = paste0(a,"/Carries.csv")

download.file( fileURL,destfile ,method = "auto")

list.files(getwd())

Carries <- read.csv(destfile)

View(Carries)  
  


b = merge(Ontime,Carries,by.x = "OP_UNIQUE_CARRIER", by.y = "Code", all.x = TRUE, all.y = FALSE)

View(b)

# Agrupando por idade e calculando a média de salário por idade
df_grouped <- df %>% group_by(idade) %>% summarise(media_salario = mean(salario))
print(df_grouped)




df_grouped = b %>%group_by(Description) %>% summarise(Atraso_Total = sum(DEP_DELAY_NEW, na.rm = TRUE), 
                                                      Atraso_Medio = mean(DEP_DELAY_NEW, na.rm = TRUE))
View(df_grouped)

dados_filtrados <- b %>% filter(!is.na(DEP_DELAY_NEW))

df_grouped2 = dados_filtrados %>%group_by(Description) %>% summarise(Proporção = sum(DEP_DELAY_NEW, na.rm = TRUE)/sum(dados_filtrados$DEP_DELAY_NEW, na.rm = TRUE))

df_grouped2 = dados_filtrados %>%group_by(Description) %>% summarise(Proporção = sum(DEP_DELAY_NEW > 0, na.rm = TRUE)/ n())

View(df_grouped2)

View(dados_filtrados %>% filter(Description =="Alaska Airlines Inc."))

-----------------------


fileURL = "http://stat405.had.co.nz/data/tb.csv"


destfile = paste0(a,"/Tb.csv")

download.file( fileURL,destfile ,method = "auto")

list.files(getwd())

TB <- read.csv(destfile)

TB = TB[,-3]

View(TB)

TB2 = gather(TB, Codigo, N_Casos, 3:22, na.rm = FALSE)
TB2 = separate(TB2, Codigo, c("caso","tipo","sexofaixa"), sep = "_", remove = TRUE)
TB2 = separate(TB2, sexofaixa, c("sexo","faixa"), sep = "(?<=\\D)(?=\\d)", remove = TRUE)


View(TB2)



df_THM <- TB2%>%filter(iso2=="TH",sexo=="m")

View(df_THM)

print(sum(df_THM$N_Casos,na.rm=TRUE))


df_2534 <- TB2%>%filter(faixa=="2534",sexo=="f")

View(df_2534)

print(sum(df_2534$N_Casos,na.rm=TRUE))


df_2000 <- TB2%>%filter(year %in% 2000:2009)

print(sum(df_2000$N_Casos,na.rm=TRUE))

View(df_2000)


us = subset(TB2, iso2=="US")
print(sum(us$N_Casos,na.rm=TRUE)/sum(TB2$N_Casos,na.rm=TRUE))