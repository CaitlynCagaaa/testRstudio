#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#file upload


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Test File Upload"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
       
        #file upload
        sidebarPanel( fileInput("file1", "Choose CSV File",
                                accept = c(
                                  "text/csv",
                                  "text/comma-separated-values,text/plain",
                                  ".csv")
        ),
        tags$hr(),
        checkboxInput("header", "Header", TRUE)
        ),
        # Show a plot of the generated distribution
        mainPanel(
          tableOutput("contents")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$contents <- renderTable({ inFile <- input$file1
  
  if (is.null(inFile))
    return(NULL)
  
  read.csv(inFile$datapath, header = input$header)
  
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
