library(shiny)
library(tidyverse)

ui <- fluidPage(
  titlePanel(
    tagList(
      textOutput("title", inline = TRUE),
      "Shiny App"
    ),
    # Without this, the browser tab would show the HTML of the title above.
    windowTitle = "Shiny App"
  ),
  textInput("name", label = "Enter your Name"),
  numericInput("age", label = "Enter your age", value = 0, min = 0, max = 150),
  selectInput("colour", label = "Select your favourite colour", c("(choose a colour)", "red", "blue", "purple", "yellow", "pink", "green", "orange", "brown", "black", "white", "grey")),
  uiOutput("coloured_greeting"),
  textOutput("colour"),
)

server <- function(input, output, session) {
  output$title <- renderText({
    req(input$name)
    paste0(input$name, "'s")
  })
  
  greeting <- reactive({
    req(input$name)
    paste("Hello", input$name, "you are ", input$age, "years old")
  })
  output$greeting <- renderText(greeting())
  
  output$coloured_greeting <- renderUI(
    span(style = paste0("color: ", input$colour, ";"), greeting())
  )
  output$colour <- renderText(paste0("Your favourite colour is ", input$colour))
  
}

shinyApp(ui, server)
