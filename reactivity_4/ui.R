library(shiny)
shinyUI(fluidPage(
	# Application title
	titlePanel("Reactivity_2"),
	# Sidebar with a slider input for number of bins 
	sidebarLayout(
		sidebarPanel(
			sliderInput("sl_mpg", "Value of mpg", min = 10, max = 45, value = 23),
			submitButton("Submit")
		),
		# Show a plot of the generated distribution
		mainPanel(
			tabsetPanel(type = "tabs",
				tabPanel("Plot", plotOutput("plot_1")),
				tabPanel("Model_1", h4("Prediction from Model 1 = "), textOutput("tab_2")),
				tabPanel("Model_2", h4("Prediction from Model 2 = "), textOutput("tab_3"))
			)
		)
	)
))
