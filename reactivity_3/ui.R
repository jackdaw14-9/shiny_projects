shinyUI(fluidPage(
	titlePanel("Reactivity_3"),
	sidebarLayout(
		sidebarPanel(
			sliderInput("sl_mpg", "What's the value of MPG ?", min = 10, max = 50, value = 25),
			submitButton("Submit"),
			checkboxInput("box_1", "Show/Hide Model_1", value = T),
			checkboxInput("box_2", "Show/Hide Model_2", value = T)
		),
		mainPanel(
			plotOutput("plot_1"),
			h4("Prediction from Model_1"), textOutput("pred_1"),
			h4("Prediction from Model_2"), textOutput("pred_2")
		)
	)
))
