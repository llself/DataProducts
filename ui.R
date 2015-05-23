library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Find the Movie with the Highest Average IMDB User Rating"),
  sidebarPanel(
    helpText("To find the movie with the highest average IMDB User Rating by genre and year,
             just type in a year between 1903 and 2005 and then select one genre from the
             list below and select Submit.  It will return the movie that you should go see!
             Please Note:  Some movies are classified as being in multiple genre's so you may 
             see that movie twice.  For example, I have defaulted it on year 1999 with a genre
             of Comedy and I get Toy Story 2.  If I remove Comedy from the list and choose Animation
             instead, I will get the same movie!  Have fun."),
    numericInput('year', 'Enter a Year:', 1999, min = 1903, max = 2005, step = 1),
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


  