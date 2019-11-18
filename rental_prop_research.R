# Clear workspace.
rm(list=ls(all=TRUE))

#install.packages('R.utils')
#install.packages("plumber")

library('R.utils')
library('httr')
library('plumber')

Sys.setenv(TZ='America/New_York')
response <- GET('https://pokeapi.co/api/v2/pokemon')

##################################################
# Setting the Parameters
##################################################

# Set path for working directory.
# Put files on desktop in a folder called ECO6416
wd_path <- '<Your local folder>'

# Set the working directory to this path. 
setwd(wd_path)

# Verify that the path was assigned correctly. 
getwd()

##################################################
# Loading the Data and Conducting Initial Assessment
##################################################
rental_prop_data <- read.csv('rental_prop_data.csv')

# Inspect the contents.
summary(rental_prop_data)

hist(rental_prop_data[, 'Median.Household.Income'])
hist(rental_prop_data[, 'Current.Price'])

lm_model_1 <- lm(data = rental_prop_data, 
                    formula =  Current.Price ~ Median.Household.Income + Heated.Area )

summary(lm_model_1)

lm_full_model <- lm(data = rental_prop_data, 
                 formula =  Current.Price ~ Median.Household.Income + Pool.Type + Property.Style.Type
                 + Beds + Full.Baths + Half.Baths + Heated.Area )

summary(lm_full_model)

predict_rental <- function(house_hold_inc) 
{
  input <- data.frame( Median.Household.Income = house_hold_inc, Pool.Type = 1,  Property.Style.Type = 1,
                     Beds = 3, Full.Baths = 2,  Half.Baths = 0, Heated.Area = 1400)
  
  predict(lm_full_model, input, se.fit = TRUE, type = 'response')
}

#* Echo back the input
#* @param income The household income to test
#* @get /rental
predict_rental_web <- function(income="50000") 
{
  income = strtoi(income)
  input <- data.frame( Median.Household.Income = income, Pool.Type = 1,  Property.Style.Type = 1,
                       Beds = 3, Full.Baths = 2,  Half.Baths = 0, Heated.Area = 1400)
  
  predict(lm_full_model, input, se.fit = TRUE, type = 'response')
}

get_input_loop <- function() {
  while (TRUE) {
    house_hold_inc <- readline(prompt = 'Enter a value for household income (enter x to quit): ')
    if (house_hold_inc[1] == 'x') {
      break
    }
    
    printf("Running prediction on household income of %s\n", house_hold_inc)
    if (is.null(house_hold_inc)) {
      house_hold_inc = 50000
    } else {
      house_hold_inc = strtoi(house_hold_inc)
    }
    print(predict_rental(house_hold_inc))
  }
}
