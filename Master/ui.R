#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(baseballr)
library(tidyverse)
library(shinythemes)
batters <- read_csv("bat_split.csv")
# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("paper"),
                  
  
  # Application title
  titlePanel("Interactive Baseball App"),
  
  # Sidebar with a slider input for number of bins 
  tabsetPanel(type= "tabs",
    tabPanel("Table",      
    sidebarLayout(
    sidebarPanel(
       
       selectInput("select",
                   h3("Year"),
                   choices = sort(unique(batters$Season), decreasing = T)),
       selectInput("check",
                     h3("Stats"),
                     choices = colnames(batters)[1:25],
                     selected= "Name",
                   multiple = T)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       dataTableOutput("distPlot")
    )
  )
)
)))
