sensibilidade <- 0.9
especificidade <- 0.8
prevalencia <- 0.02

#Passo 1 - Matriz descritiva do teste
table_carac <-  matrix(c(sensibilidade,1-sensibilidade,1-especificidade,especificidade),nrow = 2,ncol = 2,byrow = TRUE)
colnames(table_carac) <- c("Positivo", "Negativo")
rownames(table_carac) <- c("Doente", "Não Doente")
table_carac


#Passo 2 - Matriz descritiva do teste  em % na população
table_pop <- table_carac*c(0.02,0.98)

table_pop

#Passo 3 - Matriz resultantes dos testes na população 

D_P <- table_pop[1,1]/sum(table_pop[,1]) 
D_N <- table_pop[1,2]/sum(table_pop[,2]) 
ND_P <- table_pop[2,1]/sum(table_pop[,1]) 
ND_N <- table_pop[2,2]/sum(table_pop[,2])

table_resul <- matrix(c(D_P,D_N,ND_P,ND_N),ncol = 2,byrow = TRUE)
colnames(table_resul) <- c("Positivo", "Negativo")
rownames(table_resul) <- c("Doente", "Não Doente")
table_resul


teste <- function(sens,espec,prev ){
  
  #Passo 1 - Matriz descritiva do teste
  table_carac <-  matrix(c(sensibilidade,1-sensibilidade,1-especificidade,especificidade),nrow = 2,ncol = 2,byrow = TRUE)
  colnames(table_carac) <- c("Positivo", "Negativo")
  rownames(table_carac) <- c("Doente", "Não Doente")

  
  #Passo 2 - Matriz descritiva do teste  em % na população
  table_pop <- table_carac*c(prev,1 - prev)
  
  
  #Passo 3 - Matriz resultantes dos testes na população 
  
  D_P <- table_pop[1,1]/sum(table_pop[,1]) 
  D_N <- table_pop[1,2]/sum(table_pop[,2]) 
  ND_P <- table_pop[2,1]/sum(table_pop[,1]) 
  ND_N <- table_pop[2,2]/sum(table_pop[,2])
  
  table_resul <- matrix(c(D_P,D_N,ND_P,ND_N),ncol = 2,byrow = TRUE)
  colnames(table_resul) <- c("Positivo", "Negativo")
  rownames(table_resul) <- c("Doente", "Não Doente")
                             
  return(table_resul)
}

teste(sens = 0.9,
      espec = 0.8,
      prev = 0.02)


prev_vals <- seq(0.01, 1, by = 0.05)

result_vpp <- sapply(prev_vals, function(p) teste(0.9, 0.8, prev = p)[1, 1])
result_vpn <- sapply(prev_vals, function(p) teste(0.9, 0.8, prev = p)[2, 2])


plot(prev_vals, result_vpp,
     col = "blue"
)

points(prev_vals, result_vpn,
       col = "red")                

