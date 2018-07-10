#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  h1("Datacamp"),
  h2("Uses cases cource"),
  em("Shiny"),
  strong("is fun"),
  
  
      # Show a plot of the generated distribution

sidebarLayout(
  sidebarPanel(
  h4("Plot parameters"),
  textInput("title", "Plot title", "Car speed vs distance to stop"),
  numericInput("num", "Number of cars to show", 30, 1, nrow(cars)),
  sliderInput("size", "Point size", 1, 5, 2, 0.5) 
),

mainPanel(
  plotOutput("plot"),
  tableOutput("table")
  
)
)
)
# Define the server logic
server <- function(input, output) {
  output$plot <- renderPlot({
    plot(cars[1:input$num, ], main = input$title, cex = input$size)
  })
  output$table <- renderTable({
    cars[1:input$num, ]
  })
}

# Run the application
shinyApp(ui = ui, server = server)

