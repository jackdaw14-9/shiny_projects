library(shiny)
shinyUI(fluidPage(
	# Application title
	titlePanel("Reactivity_2"),
	# Sidebar with a slider input for number of bins 
	sidebarLayout(
		sidebarPanel(
			sliderInput("sl_1", "TAB_1", min = 1, max = 500, value = 51),
			submitButton("Apply to TAB_1"),
			sliderInput("sl_2", "TAB_2", min = 1, max = 500, value = 151),
			submitButton("Apply to TAB_2"),
			sliderInput("sl_3", "TAB_3", min = 1, max = 500, value = 251),
			submitButton("Apply to TAB_3")
		),
		# Show a plot of the generated distribution
		mainPanel(
			tabsetPanel(type = "tabs",
				tabPanel("TAB_1", textOutput("tab_1")),
				tabPanel("TAB_2", textOutput("tab_2")),
				tabPanel("TAB_3", textOutput("tab_3"))
			)
		)
	)
))
