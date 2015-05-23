library(shiny)
HighestRatedMovie <-
  function(year, genre) {
    require(ggplot2); require(reshape2); require(dplyr)
    inputgenre <- as.character(genre);  inputyear <- as.integer(year)
    
    data(movies)
    moviesDS <- movies[complete.cases(movies),]
    #id.vars contains all variables you want to keep, measure.vars are the variables you want to melt together into one column
    meltmovies <- melt(moviesDS, id.vars = c("title", "year", "length", "budget", "rating", "votes", "r1", "r2", "r3", 
                                             "r4", "r5", "r6", "r7", "r8", "r9", "r10", "mpaa" ),
                       measure.vars = c("Action", "Animation", "Comedy", "Drama", "Documentary", "Romance", "Short"))  
    meltmovies <- subset(meltmovies, value == 1) # get only rows for which the value = 1 meaning the movie is in that Genre
    names(meltmovies)[names(meltmovies)=="variable"] <- "genre"  # change column name to make sense 
    meltmovies <- select(meltmovies, -value) #remove value variable as it no longer is applicable
    
    tempDS <- subset(meltmovies, genre == inputgenre & year == inputyear) 

    if(nrow(tempDS) > 1) {
      ties <- with(tempDS, title[rating == max(rating)])
      ties[1]
      
    }
    else if(nrow(tempDS) >0 ) {
      with(tempDS, title[rating == max(rating)])
    }
    else {
      paste("There are no ", inputyear, " ", inputgenre , " movies in this dataset.  Please try a different combination.")
    }
    
}

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$year})
    output$inputValue2 <- renderPrint({input$genre})
    output$outputValue <-  renderPrint({HighestRatedMovie(input$year, input$genre)})        
  }
)