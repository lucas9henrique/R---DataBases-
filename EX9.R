# Atividade 9

getwd()

fileURL = "https://www.dropbox.com/s/w4xv9urbowbig3s/catsM.csv?dl=1"
destfile = "C:/Users/Lucas Henrique/Documents/catsM.csv"

download.file( fileURL,destfile ,method = "auto")

list.files(getwd())

cats_data <- read.csv(destfile)

View(cats_data)

media = mean(cats_data$Bwt)

--------------------
  
  fileURL = "https://www.dropbox.com/s/9wnr69i6bjhqyct/Snail_feeding.csv?dl=1"
destfile = "C:/Users/Lucas Henrique/Documents/Snail_feeding.csv"

download.file( fileURL,destfile ,method = "auto")

Snail_feeding <- read.csv(destfile, strip.white = T, na.strings = "")

Snail_feeding = Snail_feeding[, 1:7]

Snail_feeding$Sex = factor(Snail_feeding$Sex)
Snail_feeding$Size = factor(Snail_feeding$Size)

levels(Snail_feeding$Sex) [2] = "female"

levels(Snail_feeding$Sex) [4] = "male"

levels(Snail_feeding$Sex) [3] = "male"

Snail_feeding$Distance = as.numeric(Snail_feeding$Distance)

Snail_feeding[682,"Distance"] = 0.58
Snail_feeding[755,"Distance"] = 0.3564

Snail_feeding = Snail_feeding[-733,]

Snail_feeding[8,6] = 1.62

View(Snail_feeding)

summary(Snail_feeding)

snail1 = subset(Snail_feeding, Sex=="female" & Size=="small" )

summary(snail1)


-----------------------------------
  
fileURL = "https://www.dropbox.com/s/jci311cfsj6uva7/Sparrows.csv?dl=1"
destfile = "C:/Users/Lucas Henrique/Documents/Sparrows.csv"

download.file( fileURL,destfile ,method = "auto")

read.csv(destfile, strip.white = T, na.strings = "")

Sparrows <-  read.table(file = "Sparrows.csv", header = TRUE, sep = ",")

Sparrows$Sex = factor(Sparrows$Sex)
summary(Sparrows)

ssts = subset(Sparrows, Species=="SSTS")

summary(ssts)

levels(Sparrows$Sex) [2] = "Female"
levels(Sparrows$Sex) [1] = "Female"
levels(Sparrows$Sex) [3] = "Male"

which(duplicated(Sparrows))

which(is.na(Sparrows$Wing))

Mas = subset(Sparrows, Sex=="Male")
Fem = subset(Sparrows, Sex=="Female")

mean(Mas$Tarsus)
mean(Fem$Tarsus)

Sparrows[64,"Wing"] = 59
Sparrows[250,"Wing"] = 56.5
Sparrows[806,"Wing"] = 57
wing = mean(Sparrows$Wing)


View(Sparrows)


Sparrows_Ordenado=order(Sparrows$Wing,Sparrows$Head) 

View(Sparrows)

