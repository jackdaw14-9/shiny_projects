library(shiny)
shinyUI (fluidPage(
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
))
