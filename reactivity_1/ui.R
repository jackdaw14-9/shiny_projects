library(shiny)

shinyUI(fluidPage(
	# Application title
	titlePanel("Old Faithful Geyser Data || Reactivity_1"),
	# Sidebar with a slider input for number of bins 
	sidebarLayout(
		sidebarPanel(
			sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30),
			submitButton("Apply")
			# delayed reactive
		),
		# Show a plot of the generated distribution
		mainPanel(
			plotOutput("distPlot")
		)
	)
))
