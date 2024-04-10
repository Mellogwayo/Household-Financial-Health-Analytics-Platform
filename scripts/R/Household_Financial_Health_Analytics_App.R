library(shiny)
library(ggplot2)
library(dplyr)

# Assume 'data' is your loaded data frame with the necessary variables

# Define the user interface (UI)
ui <- fluidPage(
  titlePanel("Household Financial Health Analytics Platform"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("incomeHist"),
      plotOutput("netIncomeVsKids")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  
  # Histogram for net household monthly income
  output$incomeHist <- renderPlot({
    ggplot(data, aes(x = jkl_fihhmnnet1_dv)) +
      geom_histogram(bins = input$bins, fill = 'blue') +
      labs(title = 'Histogram of Net Household Monthly Income', x = 'Net Income', y = 'Count')
  })
  
  # Scatter plot to visualize the relationship between the number of kids and net household monthly income
  output$netIncomeVsKids <- renderPlot({
    ggplot(data, aes(x = jkl_nkids_dv, y = jkl_fihhmnnet1_dv)) +
      geom_point() +
      labs(title = 'Scatter Plot of Net Income vs Number of Kids', x = 'Number of Kids', y = 'Net Income')
  })
}

# Run the application
shinyApp(ui = ui, server = server)
