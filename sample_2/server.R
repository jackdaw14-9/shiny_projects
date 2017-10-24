library(shiny)
shinyServer(function(input, output) {
        output$res = renderText (input$slider)
})
