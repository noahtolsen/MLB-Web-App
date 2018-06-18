#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(baseballr)
library(tidyverse)
library(knitr)
library(kableExtra)
batters <- read_csv("/Users/noaholsen/GitHub/MLB-Web-App/bat_split.csv")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderDataTable(
      batters %>%
      filter(Season == input$select) %>%
      select(input$check))
  }) 

