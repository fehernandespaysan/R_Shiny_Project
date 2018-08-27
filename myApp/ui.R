library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Choosing your new car"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      "Thinking about buying a new car?",
      
      "Have you calculated how much you may spend in fuel?",
      
      "Based on the features you are looking for let's calculate how many miles per gallon your new car may perform",
      
      checkboxInput("am", "Manual transmission?"),
      sliderInput("cyl", "Number of cylinders", min = 4, max = 8, value = 4),
      sliderInput("hp", "Gross horsepower", min = 52, max = 335, value = 52),
      
      "What type of car are you looking for?"),
    
    # Show a plot of the generated distribution
    mainPanel(
      "Miles per gallon prediction",
       textOutput("pred1"),
       plotOutput("plot1")
    )
  )
))
