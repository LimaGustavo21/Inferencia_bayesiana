data <- read.csv('TesteDiag-dados1.csv')

with(subset(data, Classe == "Doente"), table(X1))
with(subset(data, Classe == "Sadio"), prop.table(table(X1)))


#
data_2 <- read.csv('TesteDiag-dados3.csv')

data_2



with(subset(data_2, X1 == "Positivo"), prop.table(table(Classe)))

with(subset(data_2, X2 == "Positivo"), prop.table(table(Classe)))


with(subset(data_2, X3 == "Positivo"), prop.table(table(Classe)))
     