# build the model
source("rental_prop_research.R")

#* Echo back the input
#* @param income The median household income to test
#* @param home_price The median home price to test
#* @param heated_area The heated square footage
#* @param beds The number of bedrooms
#* @param pool_type The type of pool private=1, public=0
#* @param prop_style The style of the property house=1, townhouse=0
#* @param baths The number of full baths
#* @get /rental
predict_rental <- function(income="50000", 
                           home_price="150000", 
                           heated_area="1500", 
                           beds="3", 
                           pool_type="1", 
                           prop_style="1", 
                           baths="2") 
{
  input <- data.frame( Median.Household.Income = as.numeric(income), 
                       Median.Home.Price = as.numeric(home_price),
                       Pool.Type = as.numeric(pool_type),  
                       Property.Style.Type = as.numeric(prop_style),
                       Beds = as.numeric(beds), 
                       Full.Baths = as.numeric(baths),  
                       Half.Baths = 0, 
                       Heated.Area = as.numeric(heated_area))
  
  predict(lm_full_model, input, se.fit = TRUE, type = 'response')
}

