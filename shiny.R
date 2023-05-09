# Load required libraries
library(shiny)
library(ggplot2)

# Define the user interface
ui <- fluidPage(
  titlePanel("Iris dataset explorer"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "xvar", label = "X-axis variable", 
                  choices = c("Sepal Length" = "Sepal.Length", 
                              "Sepal Width" = "Sepal.Width", 
                              "Petal Length" = "Petal.Length", 
                              "Petal Width" = "Petal.Width")),
      selectInput(inputId = "yvar", label = "Y-axis variable", 
                  choices = c("Sepal Length" = "Sepal.Length", 
                              "Sepal Width" = "Sepal.Width", 
                              "Petal Length" = "Petal.Length", 
                              "Petal Width" = "Petal.Width")),
      sliderInput(inputId = "npoints", label = "Number of points to plot", 
                  min = 10, max = nrow(iris), value = 50)
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(iris[1:input$npoints,], aes(x = .data[[input$xvar]], y = .data[[input$yvar]])) + 
      geom_point()
  })
}

# Create and launch the app
shinyApp(ui = ui, server = server)

