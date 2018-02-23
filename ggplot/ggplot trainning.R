#ggplot trainning

#first start by intalling tyverse package

install.packages("tidyverse")
library(tidyverse)

#ggplot is the data visialization packege
#ggplot2 the second version
#data turn into a coordinate system


#we are going to be working with the mpg data base
View(mpg)

ggplot(data=mpg) #first argument is where the data is going to be

#secondly you add aes aesthetics

ggplot(data = mpg, aes(x=displ, y=hwy)) #take this date and disply it but Im not telling how

ggplot(data = mpg, aes(x=displ, y=hwy))+
  geom_point() #dis display the the points of the data base

#assign plot to a variable

car_plot <- ggplot(data = mpg, aes(x=displ, y=hwy))
  

#I can build upon the plot I assinged a variable to

car_plot+
  geom_point()

#the plus sign must always be at the en of the line


#adding transperency to the points with the alpha function

ggplot(data = mpg, aes(x=displ, y=hwy))+
  geom_point(alpha=0.4)

#comoring points in the plot based on car class
ggplot(data = mpg, aes(x=displ, y=hwy))+
  geom_point(aes(color=class))


#you can also do it with shpes but you can tun into some problems
ggplot(data = mpg, aes(x=displ, y=hwy))+
  geom_point(aes(shape=class))


ggplot(data = mpg, aes(x=displ, y=hwy))+ #this top aes if the default for all what is comming but you can also added in the next line 
  geom_point(aes(color=class))

#task: create a scater plot of hwy vs cty with different size points representing each car class and different size and the fuel type different colors.
ggplot(data = mpg, aes(x=cty, y=hwy))+
  geom_point(aes(color=fl, size=class))


#
ggplot(data=mpg)+
  geom_point(aes(x=displ, y=hwy), color="blue", alpha=0.4) #when I give the argument color outside the eas it will color everything blue. inside the aes it will look somthing inside the data set


#Excersise: 
ggplot(data=mpg)+
  geom_point(aes(x=displ, y=hwy,color="blue"), alpha=0.4) #herea an example of the color inside the aes. ggplot does not find nothing in the data set call blue therfore it just colors the dots in the default

#plot with colors representing cyt, if you do it with shape it will give you an error because it is a continoues variable
ggplot(data = mpg, aes(x=displ, y=hwy))+ 
  geom_point(aes(color=cty))

#execesise 4
ggplot(data=mpg)+
  geom_point(aes(x=displ, y=hwy, color=displ<5)) #saying to change color for displ < 5






























