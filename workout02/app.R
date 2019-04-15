library(shiny)
library(ggplot2)
library(reshape2)


ui <- fluidPage(
  
  
  titlePanel(title = "Three Models of Investment"),
  
  fluidRow(
    column(4,
           sliderInput("amount",
                       "Initial Amount",
                       min = 1,
                       max = 100000,
                       step = 500,
                       value = 1000,
                       pre = "$")),
    column(4,
           sliderInput("rate",
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 5)),
    column(4,
           sliderInput("years",
                       "Years",
                       min = 0,
                       max = 50,
                       step = 1,
                       value = 10)),
    column(4,
           sliderInput("contrib",
                       "Annual Contribution",
                       min = 0,
                       max = 50000,
                       step = 500,
                       value = 2000,
                       pre = "$")),
    column(4,
           sliderInput("growth",
                       "Growth Rate(in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 2)),
    column(4,
           selectInput("facet",
                       "Facet?",
                       c("Yes","No"))
    ),
    
    # Show a plot and a table of the generated distribution
    mainPanel(
      h3("Timeline"),
      plotOutput("distPlot",width = "150%"),
      h3("balances"),
      verbatimTextOutput("modalities")
      
    )))



server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    FV <- c()
    for (i in 1:input$years){
      FV[i]= input$amount*((1+(input$rate/100))^i)
    }
    
    FVA <- c()
    for (i in 1:input$years){
      FVA[i]=input$amount*((1+(input$rate/100))^i)+input$contrib*((((1+(input$rate/100))^i)-1)/(input$rate/100))
    }
    
    FVGA <- c()
    for (i in 1:input$years){
      FVGA[i]= input$amount*((1+(input$rate/100))^i)+(input$contrib*((((1+(input$rate/100))^i)-((1+(input$growth/100))^i))/((input$rate/100)-(input$growth/100))))
    }
    
    modalities <- data.frame(year=0:input$years,no_contrib=c(input$amount,FV), fixed_contrib=c(input$amount,FVA), growing_contrib=c(input$amount,FVGA))
    
    if (input$facet == "Yes") {
      df.m = melt(modalities, id.vars ="year", measure.vars = c("no_contrib","fixed_contrib","growing_contrib"))
      
      ggplot(df.m, aes(year, value)) + geom_area(aes(fill = variable), alpha = 0.3) + geom_point(aes(colour = variable)) + geom_line(aes(colour = variable))+ scale_x_discrete(name ="Years", limits = c(0:input$years)) + ylab("Value") +  
        ggtitle("Three modes of investing")+ theme_bw()+
        facet_wrap(~variable)
    } else if (input$facet == "No"){
      df.m = melt(modalities, id.vars ="year", measure.vars = c("no_contrib","fixed_contrib","growing_contrib"))
      ggplot(df.m, aes(year, value)) + geom_point(aes(color = variable)) + geom_line(aes(color = variable)) + scale_x_discrete(name ="Years", limits = c(0:input$years)) + ylab("Balance") +  
        ggtitle("Growth of Investment Models") 
    }
    
  })
  
  
  modalities <- reactive({
    FV <- c()
    for (i in 1:input$years){
      FV[i]= input$amount*((1+(input$rate/100))^i)
    }
    
    FVA <- c()
    for (i in 1:input$years){
      FVA[i]=input$amount*((1+(input$rate/100))^i)+input$contrib*((((1+(input$rate/100))^i)-1)/(input$rate/100))
    }
    
    FVGA <- c()
    for (i in 1:input$years){
      FVGA[i]= input$amount*((1+(input$rate/100))^i)+(input$contrib*((((1+(input$rate/100))^i)-((1+(input$growth/100))^i))/((input$rate/100)-(input$growth/100))))
    }
    modalities <- data.frame(year=0:input$years,no_contrib=c(input$amount,FV), fixed_contrib=c(input$amount,FVA), growing_contrib=c(input$amount,FVGA))
  })
  
  output$modalities  <- renderPrint({(modalities())})
}

shinyApp(ui = ui, server = server)