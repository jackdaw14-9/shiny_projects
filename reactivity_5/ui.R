library(shiny)
shinyUI(fluidPage(
	titlePanel("Reactivity #5 :: Brushed Points"),
	sidebarLayout(
		sidebarPanel(
			h4("Slope"), textOutput("slope"),
			h4("Intercept"), textOutput("intercept")
		),
		mainPanel(
			plotOutput("plot_1", brush = brushOpts(id = "brush_1"))
		)
	)
))
