library(shiny)
library(tidyverse)

penguins <- read_csv("data/penguins.csv")

ui <- fluidPage(
  titlePanel("Penguins"),
  selectInput("x_val", label = "x value", c("(Choose a body mass"), )
)

shinyApp(ui, server)