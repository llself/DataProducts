library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Find the Movie with the Highest Average IMDB User Rating"),
  sidebarPanel(
    numericInput('year', 'Enter a Year between 1903 and 2005', 1999, min = 1903, max = 2005, step = 1),
    checkboxGroupInput("genre", "Choose a Movie Genre (Note some movies are classified in multiple genres)",
                       c("Action" = "Action",
                         "Animation" = "Animation",
                         "Comedy" = "Comedy",
                         "Drama" = "Drama",
                         "Documentary" = "Documentary",
                         "Romance" = "Romance",
                         "Short" = "Short"), selected = "Comedy"),
    submitButton('Submit')
  ),
  mainPanel(
    h3('Movie Results'),
    h4('The year you chose:'),
    verbatimTextOutput("inputValue"),
    h4('The genre you chose:'),
    verbatimTextOutput("inputValue2"),
    h4('The movie with the highest rating in this dataset is'),
    verbatimTextOutput("outputValue")
  )
)
)