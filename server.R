library(shiny)

shinyServer(function(input, output) {
  observe({
    ft <- "mtcars$mpg ~"
    if(input$cyl)
      ft <- paste(ft, "mtcars$cyl +")
    if(input$disp)
      ft <- paste(ft, "mtcars$disp +")
    if(input$hp)
      ft <- paste(ft, "mtcars$hp +")
    if(input$drat)
      ft <- paste(ft, "mtcars$drat +")
    if(input$wt)
      ft <- paste(ft, "mtcars$wt +")
    if(input$qsec)
      ft <- paste(ft, "mtcars$qsec +")
    if(input$vs)
      ft <- paste(ft, "mtcars$vs +")
    if(input$am)
      ft <- paste(ft, "mtcars$am +")
    if(input$gear)
      ft <- paste(ft, "mtcars$gear +")
    if(input$carb)
      ft <- paste(ft, "mtcars$carb +")
    if(ft != 'mtcars$mpg ~') {
      ft <- substr(ft, 0, nchar(ft)-2)
      model <- lm(as.formula(ft))
      output$summary <- renderText({
        paste(capture.output(summary(model)), collapse='\n')
      })
    }
    
    output$plot <- renderPlot({
      variable <- paste("mtcars$", input$var, sep="")
      ft <- reactive({paste("mtcars$mpg ~ ", variable)})
      plot(as.formula(ft()))
      abline(lm(as.formula(ft())), col="red")
    })
  })
})