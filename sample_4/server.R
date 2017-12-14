library(shiny)
shinyServer(function (input, output) {
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
})