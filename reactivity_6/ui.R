library(shiny)
shinyUI(fluidPage(
	titlePanel("Reactivity #6 datasets"),
	sidebarLayout(
		sidebarPanel(
			sliderInput("sl_mpg", "Value :", min = 10, max = 75, value = 23),
			checkboxInput("box_1", "Show/Hide input", value = T),
			h4("Horse Power Prediction = "), textOutput("pred_1")
		),
		mainPanel(
			plotOutput("plot_1", brush = brushOpts (id = "brush_1"))
		)
	)
))
