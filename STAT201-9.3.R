pokemon = read.csv("pokemon.csv")
pokemon |> View()

GrandMean = mean(pokemon$Total)
GrandMean

tapply(pokemon$Total, pokemon$Defense, mean)

#Effect Sizes
tapply(pokemon$Total, list(pokemon$Defense, pokemon$Type.1), mean)

pokemon$Total[pokemon$Type.1 == "Fire" & pokemon$Defense == 1] |> mean()

tapply(pokemon$Total, pokemon$Defense, mean)-GrandMean
tapply(pokemon$Total, pokemon$Type.1, mean)-GrandMean


#or----------------

#install.packages("dplyr")
library(dplyr)
pokemon |> group_by(Defense, Type.1) |>
  summarize(
    group_mean = mean(Total),
    n = n()
  ) |> arrange(n)

#--------------------

pokemon.lm = lm(Total ~ Type.1+as.factor(Defense)+Type.1:as.factor(Defense), data=pokemon)
pokemon.lm
#Changing the order doesn't matter because it's a balanced Anova
pokemon.lm2 = lm(Total ~ as.factor(Defense)+Type.1+Type.1:as.factor(Defense), data=pokemon)
pokemon.lm2

new <- data.frame(Type.1=c("Fire", "Rock", "Grass"), Defense=c(3,3,3))
predict.lm(pokemon.lm, new, interval="confidence")

pokemon.anova = anova(pokemon.lm)
pokemon.anova
#The same results
anova(pokemon.lm2)

#SS
SST = (pokemon$Total - GrandMean)^2 |> sum()
SST

#RSS
interaction_groups <- interaction(pokemon$Type.1, pokemon$Defense)
interaction_groups
group_means_interaction <- tapply(pokemon$Total, interaction_groups, mean)
RSS <- sum((pokemon$Total - group_means_interaction[interaction_groups])^2)
RSS

#DF
#A = levels of A-1
#B = levels of B-1
#Interaction = (A-1)(B-1)
#Residual = N-(a-1)-(b-1)-(a-1)(b-1)-1 = N-a-b+2-(ab)+a+b-2 = N-(ab)
#(DF error)
nrow(pokemon)

#MS = SS/DF
93172/2
51542/2
90986/2

#F Value = MS/MSE
f = 46586/12021
f

#P-value
1-pf(f,2,108)
qf(1-0.117,4,108)

#Interaction Plots
interaction.plot(x.factor=pokemon$Type.1, trace.factor = pokemon$Defense,
                 response=pokemon$Total, col=c("#AACCFF", "#AA33AA", "#BBDFAB"),
                 lwd=3)
interaction.plot(x.factor=pokemon$Defense, trace.factor = pokemon$Type.1,
                 response=pokemon$Total, col=c("#AACCFF", "#AA33AA", "#BBDFAB"),
                 lwd=3)


#Confidence Intervals
#95% confidence Interval for Rock Total
#x_bar +- qt((1-alpha/2),df=DfRes)*sqrt(MSE/n)
tapply(pokemon$Total, pokemon$Type.1, mean)
tapply(pokemon$Total, pokemon$Type.1, length)

(456.0256)+c(-1,1)*qt(0.975, 108)*sqrt(12021/39)
