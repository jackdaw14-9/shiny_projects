shinyServer(function(input, output) {
	mtcars$mpgsp <- ifelse(mtcars$mpg > 20, mtcars$mpg - 20, 0)
	model_1 <- lm(hp ~ mpg, data = mtcars)
	model_2 <- lm(hp ~ mpgsp + mpg, data = mtcars)

	model_1_pred <- reactive({
		mpg_input <- input$sl_mpg
		predict(model_1, newdata = data.frame(mpg = mpg_input))
	})

	model_2_pred <- reactive({
		mpg_input <- input$sl_mpg
		predict(model_2, newdata = data.frame(mpg = mpg_input, mpgsp = ifelse(mpg_input > 20, mpg_input - 20, 0)))
	})

	output$plot_1 <- renderPlot({
		mpg_input <- input$sl_mpg
		plot(mtcars$mpg, mtcars$hp, xlab = "Miles per Gallon", ylab = "Horse Power", 
			bty = "n", pch = 16, xlim = c(10, 50), ylim = c(50, 500))

		if (input$box_1) {
			abline(model_1, col = "red", lwd = 2)
		}

		if (input$box_2) {
			# abline(model_2, col = "blue", lwd = 2)
			mod_2_lines <- predict(model_2, newdata = data.frame(mpg = 10:35, mpgsp = ifelse(10:35 > 20, 10:35 - 20, 0)))
			lines(10:35, mod_2_lines, col = "blue", lwd = 2)
		}

		legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, col = c("red", "blue"), bty = "n", cex = 1.2)
		points(mpg_input, model_1_pred(), col = "red", pch = 16, cex = 2)
		points(mpg_input, model_2_pred(), col = "blue", pch = 16, cex = 2)
	})

	output$pred_1 <- renderText({
		model_1_pred()
	})
	output$pred_2 <- renderText({
		model_2_pred()
	})
})
