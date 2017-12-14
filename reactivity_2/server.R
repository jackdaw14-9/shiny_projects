library(shiny)
shinyServer(function(input, output) {
	output$tab_1 <- renderText({
		input$sl_1[1]
	})
	output$tab_2 <- renderText({
		input$sl_2[1]
	})
	output$tab_3 <- renderText({
		input$sl_3[1]
	})
})
