library(shiny)
library(ggplot2)
library(Ecdat)
library(stats)

data(Diamond)
fit <- lm(price ~ carat, data = Diamond)

pr <- function(x){
        result <- predict(fit,data.frame(carat=x))
        return(as.numeric(result[1]))
}

shinyServer(
        function(input, output) {
                
                output$text1 <- renderPrint({input$slider})
                output$text2 <- renderPrint({pr(input$slider)})
                
                output$plot <- renderPlot(qplot(Diamond$carat,Diamond$price, geom=c("point"))
                                          +xlab("Weight of diamond stones in carat unit")
                                          +ylab("Price in Singapore dollar")
                                          +geom_vline(xintercept=input$slider, colour='red', size=1)
                                          +geom_hline(yintercept=pr(input$slider), colour='blue', size=1))
})
