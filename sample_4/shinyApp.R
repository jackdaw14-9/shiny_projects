library(shiny)
ui <- fluidPage(
        titlePanel("Plotting random number !!"),
        sidebarLayout(
                sidebarPanel(
                        numericInput("seed", "Enter seed :-",
                                     value = 15000, min = 11000, max = 100000),
                        numericInput("num", "Enter the numbers to be plotted :-",
                                     value = 1500, min = 1000, max = 2000, step = 5),
                        sliderInput("slider_x", "Slider X", min = -1000, max = 1000,
                                    value = c(-450, 650)),
                        sliderInput("slider_y", "Slider Y", min = -1000, max = 1000,
                                    value = c(-400, 750)),
                        checkboxInput("x_lab", "Show/Hide X-Label", value = T),
                        checkboxInput("y_lab", "Show/Hide Y-Label", value = T),
                        checkboxInput("title", "Show/Hide Title", value = T)
                ),
                mainPanel(
                        h4 ("Graph of random Plots !"),
                        plotOutput("my_plot")
                )
        )
)
server <- function (input, output) {
        output$my_plot <- renderPlot({
                set.seed(input$seed)
                points <- input$num
                minX <- input$slider_x[1]
                maxX <- input$slider_x[2]
                minY <- input$slider_y[1]
                maxY <- input$slider_y[2]
                x_val = runif(points, min = minX, max = maxX)
                y_val = runif(points, min = minY, max = maxY)
                xlab = ifelse(input$x_lab, "X-Axis", "")
                ylab = ifelse(input$y_lab, "Y-Axis", "")
                title = ifelse(input$title, "Random Plot", "")
                plot (x = x_val, y = y_val, xlab = xlab, ylab = ylab,
                      main = title, xlim = c (-1000, 1000), ylim = c(-1000, 1000))
        })
}

# bundling the app
shinyApp (ui = ui, server = server)
