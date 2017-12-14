library(shiny)
shinyServer(function (input, output) {
	model <- lm (hp ~ mpg, data = mtcars)
	output$plot_1 <- renderPlot ({
		plot(x = mtcars$mpg, y = mtcars$hp, xlab = "mpg", ylab = "hp", pch = 16, bty = "n")
		abline(model, col = "red", lwd = 2)
	})
	output$pred_1 <- renderText ({
		sel_data <- brushedPoints(mtcars, input$brush_1, xvar = "mpg", yvar = "hp")
		if (nrow (sel_data) < 2) {
			"No Model Found !!"
		} else {
			predict (lm (hp ~ mpg, data = sel_data), newdata = data.frame(mpg = input$sl_mpg))
		}
	})
	
})
