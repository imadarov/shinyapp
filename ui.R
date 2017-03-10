library(shiny)

shinyUI(fluidPage(
        
        titlePanel("Prediction of price based on weight of diamond stones in carat unit"),
        
        sidebarPanel(
                
                h4("Introduction"),
                
                h5("This application uses the ", code('Diamond'), " dataset included in ", code('Ecdat'), " library
                    and predicts price on weight of diamond stones in carat unit."),
                
                h4("Methods"),
                
                h5("Linear model fit is used to predict the price in Singapore dollar."),
                
                h4("Price calculator"),
                
                sliderInput("slider", label = h5("Select weight of diamond stones in carat unit:"),
                            min = 0.2, max = 1.1, step=0.1, value=0.6),
                submitButton("Submit")
                ),
        
        mainPanel(
                h4("Graphical view of the dataset"),
                h5("The red line shows the weight in carat unit selected, the blue line represents the linear regression model prediction"),
                plotOutput('plot'),
                
                h4("Results"),
                h5("Weight of diamond stones in carat unit:"),
                verbatimTextOutput('text1'),
                h5("Predicted price in Singapore dollar:"),
                verbatimTextOutput('text2')
        )
))
