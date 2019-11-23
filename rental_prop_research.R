# Clear workspace.
rm(list=ls(all=TRUE))

Sys.setenv(TZ='America/New_York')

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