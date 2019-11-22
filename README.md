# ECO6416-Research-Project

This is the research project that I completed for my Fall term at UCF. The course was titled "Econometrics" taught by Leeland Morin.

## Data Collection and Preparation

The housing data file was gathered public real estate resources and focused on zipcodes in the Orlando, FL area. The median income and 
median home prices were pulled from the US Census website.

## Web Service

* Uses the Plumber package to expose Web API - https://www.rplumber.io/
* Includes a dockerfile that you can use to create an image and run using Docker Desktop
```bash
docker build -t rental-prop-research .
docker run -rm -p 80:80 rental-prop-research
```

## Run from RStudio
```python
library('plumber')

r <- plumb("rest_controller.R")
r$run(port=80, host="0.0.0.0")
```
