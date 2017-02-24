#Loading libraries

library(shiny)
library(caret)
library(rpart)

#Function for predicting income, based on user input
#Tree prediction model is used. Shiny uses already compiled model (original model was ccalculated on desktop computer for perfomance reasons)
predi<-function(age,work.class,education,occupation,marital.status,race,sex,hpw)
{
    #Loading model from data file
    load("modFit_adult.RData")
    #Generating test dataset from user input data
    test<-data.frame(age,work.class,education,occupation,marital.status,race,sex,hpw)
    #Predicting income and return it for output
    return(as.matrix(predict(modFit,newdata=test))[1])
    
}

#Server logic
shinyServer(function(input, output, session) {
#Text output of predicted income (<50k USD or >50k USD)
output$result<-renderText({predi(input$age,input$work.class,input$education,input$occupation,input$marital.status,input$race,input$sex,input$hpw)})
})


