# Texts following "#" sign are comments.

# Read the Data set in Rcmdr.

# Name your data set Ex9_5_4.

# Then run the follwoing codes.

# You need to make sure that the types of variables 
# A, B and C are factors. If not, then you need to 
# coerce the type of each to be factor. To find 
# out the type of a varaible, use the "class()" function.

class(Ex9_5_4$A)
class(Ex9_5_4$B)
class(Ex9_5_4$C)

# The function "factor()" was used to coerce
# the typle of a variable to be factor.

Ex9_5_4$A<-factor(Ex9_5_4$A)
Ex9_5_4$B<-factor(Ex9_5_4$B)
Ex9_5_4$C<-factor(Ex9_5_4$C)

# Assign the fitted model to "fit.1". (you can name 
# the model whichever the way you like.)

fit.1<-lm(Yield~(A+B+C)^3, data=Ex9_5_4)

# Obtain the ANOVA table.  

anova(fit.1)

# To obtain treatment means, level means or grand mean, you may do the following, 
# replace "mean" by "sd" will get you standard deviations instead. 

with(Ex9_5_4, (tapply(Yield, list(A, B, C), mean, na.rm = TRUE)))
with(Ex9_5_4, (tapply(Yield, list(A, B), mean, na.rm = TRUE)))
with(Ex9_5_4, (tapply(Yield, list(A, C), mean, na.rm = TRUE)))
with(Ex9_5_4, (tapply(Yield, list(B, C), mean, na.rm = TRUE)))
with(Ex9_5_4, (tapply(Yield, list(A), mean, na.rm = TRUE)))
with(Ex9_5_4, (tapply(Yield, list(B), mean, na.rm = TRUE)))
with(Ex9_5_4, (tapply(Yield, list(C), mean, na.rm = TRUE)))

mean(Ex9_5_4$Yield)


# If you would ever consider to obtain interaction plots, 
# you may try to exlore more about the funtion "interaction.plot()". 
