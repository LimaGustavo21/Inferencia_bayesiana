
#Gerar Doentes
D <- rbinom(10000,1,prob = 0.02)

prob_test <- ifelse(D == 1, 0.9,0.2)

exame1  <- rbinom(10000,1,prob = prob_test)

exame2  <- rbinom(10000,1,prob = prob_test)

exame3  <- rbinom(10000,1,prob = prob_test)



exame_dois <- data.frame(exame1 = exame1,
           exame2 = exame2,
           doente = D)

exame_tres <- data.frame(exame1 = exame1,
                         exame2 = exame2,
                         exame3 = exame3,
                         doente = D)


dois_posit <- exame_dois[exame_dois$exame1 == 1 & exame_dois$exame2 == 1, ]

mean(dois_posit$doente)
