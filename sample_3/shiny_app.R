library(shiny)
ui <- fluidPage(
        titlePanel ("Sample 3"),
        sidebarLayout (
                sidebarPanel (
                        h5("This will create a slider with steps = 5"),
                        sliderInput("slider", "Slide this", min = 1000, max = 2500, step = 5, value = 1000)
                ),
                mainPanel(
                        p(h4("Here we'll output the value from the slider !"), hr(),"Value = "),
                        textOutput("res"))
        )
)
server <- function(input, output) {
        output$res = renderText (input$slider)
}

shinyApp (ui, server)
