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

#coloring points in the plot based on car class
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
  geom_point(aes(x=displ, y=hwy,color="blue"), alpha=0.4) #here an example of the color inside the aes. ggplot does not find nothing in the data set call blue therfore it just colors the dots in the default

#plot with colors representing cyt, if you do it with shape it will give you an error because it is a continoues variable
ggplot(data = mpg, aes(x=displ, y=hwy))+ 
  geom_point(aes(color=cty))

#execesise 4
ggplot(data=mpg)+
  geom_point(aes(x=displ, y=hwy, color=displ<5)) #saying to change color for displ < 5

#Faceting - split one plot to multiples based on data of the data set

ggplot(data = mpg)+
  geom_point(aes(x=displ, y=hwy))+
  facet_wrap(~ manufacturer)

#add color per class type
ggplot(data = mpg)+
  geom_point(aes(x=displ, y=hwy, color=class))+
  facet_wrap(~ manufacturer)


#Remove the gray background with the theme_bw

ggplot(data = mpg)+
  geom_point(aes(x=displ, y=hwy, color=class))+
  facet_wrap(~ manufacturer)+
  theme_bw()

#you can use any theme you want!!

ggplot(data = mpg)+
  geom_point(aes(x=displ, y=hwy, color=class))+
  facet_wrap(~ manufacturer)+
  theme_light()

ggplot(data = mpg)+
  geom_point(aes(x=displ, y=hwy, color=class))+
  facet_wrap(~ manufacturer)+
  theme_minimal()

#you can isntall gg theme package to have more type of themes for your graphs

install.packages("ggthemes")
library(ggthemes)

ggplot(data = mpg)+
  geom_point(aes(x=displ, y=hwy, color=class))+
  facet_wrap(~ manufacturer)+
  theme_economist()

#looking into more geoms

ggplot(data=mpg, aes(x=drv, y=hwy))+
  geom_jitter()


ggplot(data=mpg, aes(x=drv, y=hwy))+
  geom_boxplot()

ggplot(data=mpg, aes(x=drv, y=hwy))+
  geom_violin()

#adding more information
ggplot(data=mpg)+
  geom_point(aes(x=displ, y=hwy))+
  geom_smooth(aes(x=displ, y=hwy))


#more efficient code
ggplot(data=mpg, aes(x=displ, y=hwy))+
  geom_point()+
  geom_smooth()

#playing with colors

ggplot(data=mpg, aes(x=displ, y=hwy))+
  geom_point(aes(color=class))+
  geom_smooth(color="red")

#adding stuff: tible and axix lables
ggplot(data=mpg, aes(x=displ, y=hwy))+
  geom_point(aes(color=class))+
  geom_smooth(color="black")+
  labs( x = "Highway MPG", y = "Engine displacement (liters)",title ="Relationship between engine size and miles per gallon (mpg)")+
  scale_color_discrete(name = "Type of cars")+
  theme_minimal()+
  theme(legend.position = "bottom")


#Bar chart

ggplot(data = mpg)+
  geom_bar(aes(x=fl, fill=fl)) #bar will coun the amount of of data in each theme in this case type of fuel (fl)

ggplot(data = mpg)+
  geom_bar(aes(x=fl, color=fl)) #acts over the outside line

ggplot(data = mpg)+
  geom_bar(aes(x=fl, fill=class))+ #creates a stack bar according to class types
  scale_color_discrete(name = "Type of cars")+
  theme_minimal()+
  theme(legend.position = "bottom")


ggplot(data = mpg)+
  geom_bar(aes(x=fl, fill=class), position="fill") #fill makes the bars fill up to the top and create a proportion within classes

ggplot(data = mpg)+
  geom_bar(aes(x=fl, fill=class), position = "dodge") #stacks the bars to the side. one next to the other under one one fuel type

#colling the dyspla.brewer.all function from the RColorBrewer package. This pakage is for color pallets
RColorBrewer::display.brewer.all()

myplot <- ggplot(data = mpg)+
  geom_bar(aes(x=fl, fill=class), position = "dodge")+
  theme_bw()+
  scale_x_discrete(labels= c("CNG", "Diesel", "Ethanol", "Premium", "Regular"))+
  xlab("Fuel Type")+
  ylab("Number of cars")+
  scale_fill_brewer(palette = "Set3")

#how to save my graphs
ggsave("myplot.jpg", myplot, width = 6, height=6) #first argument is the name and type of file I want, follow by calling the object I want to save. If I did not save the plot as a variable
#I can still save the last plot i created, this time I dont have to use the second argument. Finally you assing the size you want your image. 



























