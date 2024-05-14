#--------------------------------------------------------------------#
# MB5370: Module 4 - Data Science in R
# Nicoline Winding
# 14 May 2024
# Workspace: ~/Documents/Australia/JCU/MB5370/Module4/workshop1.R
# Description: workshop 1 activities
#--------------------------------------------------------------------#

####setting up GitHub
install.packages("usethis")
#introducing myself to GitHub
library(usethis)
use_git_config(user.name = "nicolinewinding", user.email = "nicoline.winding@hotmail.com")

##check if everything is working
#install.packages("credentials")
credentials::git_credential_ask()
usethis::git_sitrep()

##change credentials
gitcreds::gitcreds_set()

##get git to talk to github
usethis::use_github()
## now I can use the pull and push buttons, which just tells me that everything is up-to-date



###Workshop 1, part2
library(tidyverse)

#look at the data frame
mpg

#if you want to know more about this dataset
?mpg

#load ggplot package
library(ggplot2)

## Graphing template
#create a plot of this dataset
#put the size of the engine (displ) on the x axis and the fuel efficiency (hwy) on the y axis
#the function geom_point() adds a layer of points to your plot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

## Aesthetic mappings
#add a third variable, such as class, by mapping it to an aesthetic represented as aes() in your template from above
#change point colours by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))
#change point size by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
#change point transparency by class (alpha)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
#change point shape by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
#change all points to pink
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "pink")
#change colour based on value of one of the variables
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))

## Troubleshooting
#ggplot(data = mpg) 
#+ geom_point(mapping = aes(x = displ, y = hwy)) 
#ERROR the plus sign should be on the top row of code

## Facet and panel plots
#in order to develop separate plots for subsets of your data
#in ggplot this is called facets
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2) #this creates 7 separate plots, one for each class
#you can also create a grid of separate plots for all the variable combinations
#only for discrete variables
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
# only display coloums, but no rows in the grid of separate plots
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl)
#nrow and ncol changes the number of rows and coloums displayed in a grid

## Fitting simple lines
#use geomplot to display data as points
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
#display the same data as a smooth line fit through the points
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
#you can also change the line type and use a variable to control it
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) #changes line type depending on the drv of the car
#changing the colour of each line based on the drv value
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE,)
#plotting multiple geoms on single plot to show underlying data for the smoothed line
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
#there is a more efficient way of doing the same thing
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()
#when you code it more efficiently you can change style for the points and lines more easily
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()
#you can also map only a subset of the data by using a filter
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)



