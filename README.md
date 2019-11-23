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
* Push your image to Dockerhub
```
docker push docker-username/rental-prop-research:latest
```
* Deploy to Elastic Beanstalk using Dockerrun.aws.json file.
    * https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/single-container-docker.html#single-container-docker.test-remote
    * Using the EB Web GUI
        * Create a new environment in and existing Application
        * Choose 'Web server environment'
        * Choose 'Generic Docker' for Platform
        * Choose 'Upload Code' and upload the Docker.aws.json file in your project folder
        * Deploy. This will cause EB to deploy you public image from Dockerhub


## Run from RStudio
```python
library('plumber')

r <- plumb("rest_controller.R")
r$run(port=80, host="0.0.0.0")
```

<p align="center">
<img src="https://img.shields.io/github/commit-activity/w/fsuskate/ECO6416-Research-Project" />
<a href="https://img.shields.io/github/followers/fsuskate?label=Follow&style=social" alt="Follow">
        <img src="https://img.shields.io/github/followers/fsuskate" /></a>
<a href="https://img.shields.io/github/stars/fsuskate/ECO6416-Research-Project?style=social" alt="Star">
        <img src="https://img.shields.io/github/stars/fsuskate/ECO6416-Research-Project" /></a>
</p>




