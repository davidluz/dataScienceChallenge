# apenas usa um nome mais curto!
d = TIFORN_tratado

# executa a RLM
regr=lm(Satisf~.,data = d)
summary(regr)

# verifica VIFs
library(car)
vif(regr)

# stepwise (backward)
step(regr)

# faz a RLM somente que as variáveis selecionadas
regr2=lm(Satisf ~ Rapidez + Preco + CondPag + Imagem + VendTec + Quali, data=d)
summary(regr2)

# faz a RLM somente que as variáveis selecionadas, retiranso as que valor-p > 5%
regr3=lm(Satisf ~ Rapidez + Preco + CondPag + Imagem + VendTec, data=d)
summary(regr3)

# Intervalo de Predição
x0 = data.frame(Rapidez = 3, Preco=3, CondPag=3, Imagem=3, VendTec=3)
predict(regr3,x0,interval="prediction",level=0.95)



