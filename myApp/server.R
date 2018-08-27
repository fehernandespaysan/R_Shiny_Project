
library(shiny)
library(plotly)
library(ggplot2)
data("mtcars")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  model<- lm(mpg ~ cyl + hp + am, data = mtcars)
  
  Prediction <- reactive ({
    am<- as.numeric(input$am)
    cyl<- input$cyl
    hp<- input$hp
    
    data <- data.frame(am, cyl, hp)
   round( predict (model, newdata=data))
    
  })
  
output$plot1 <- renderPlot({
  mtcars$am <- as.factor(mtcars$am)
  ggplot(aes(x=hp, y=mpg, color=am, size=cyl), data=mtcars) + geom_point() + geom_hline(yintercept = Prediction()) + xlab("Number of cyliderns")   + ylab("Miles per Gallon") + ggtitle("Miles per Gallon vs Horse Power")
})

output$pred1 <- renderText({
  Prediction()
})

})
