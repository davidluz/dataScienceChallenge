# gera as dummies necessárias
d = model.matrix(data=paes_tratado, ~.)  

# a primeira coluna deve ser apagada
d = d[,-1]

# re-transforma em dataframe
d=as.data.frame(d)
names(d)

# executa a RLM
regr=lm(Demand~.,data = d)
summary(regr)

# stepwise (backward)
step(regr)

# faz a RLM somente que as variáveis selecionadas
regr2=lm(Demand ~ DayFriday + DaySaturday + DaySunday + OnSaleYes, data = d)
summary(regr2)