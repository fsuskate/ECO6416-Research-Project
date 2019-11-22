# Clear workspace.
rm(list=ls(all=TRUE))

#install.packages('R.utils')
#install.packages("plumber")

Sys.setenv(TZ='America/New_York')

##################################################
# Setting the Parameters
##################################################

# Set path for working directory.
# Put files on desktop in a folder called ECO6416
wd_path <- 'C:/Users/francis_surroca/Documents/ECO6416/Research Project'

# Set the working directory to this path. 
setwd(wd_path)

# Verify that the path was assigned correctly. 
getwd()

##################################################
# Loading the Data and Conducting Initial Assessment
##################################################
rental_prop_data <- read.csv('rental_prop_data.csv')

rental_prop_data[, 'Heated.Area.SquareRoot'] <- sqrt(rental_prop_data[, 'Heated.Area'])

rental_prop_data[, 'Heated.Area.SquareRoot'] <- sqrt(rental_prop_data[, 'Heated.Area'])

# Inspect the contents.
summary(rental_prop_data)

hist(rental_prop_data[, 'Median.Household.Income'])
hist(rental_prop_data[, 'Current.Price'])

plot(rental_prop_data[, 'Current.Price'])
lines(rental_prop_data[, 'Median.Household.Income'])

lm_model_1 <- lm(data = rental_prop_data, 
                    formula =  Current.Price ~ Median.Household.Income + Heated.Area )

summary(lm_model_1)

lm_full_model <- lm(data = rental_prop_data, 
                 formula =  Current.Price ~ Median.Household.Income + 
                   Median.Home.Price +
                   Pool.Type + 
                   Property.Style.Type + 
                   Beds + 
                   Full.Baths + 
                   Half.Baths + 
                   Heated.Area)

summary(lm_full_model)