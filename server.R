library(shiny); require(shiny)
library(caret); require(caret)
library(randomForest); require(randomForest)
library(e1071); require(e1071)
data("iris")

set.seed(1234)

train_control <- trainControl(method = "cv", number = 3)
rf.tunegrid <- data.frame(mtry = c(4))

model <- train(Species ~ ., data=iris, method="rf", trControl=train_control, tuneGrid = rf.tunegrid)

shinyServer(
        function(input, output) {
                
                output$text1 <- renderText({
                        species.estimate <- predict(model, newdata = data.frame(Sepal.Length=input$Sepal.Length,
                                                                                Sepal.Width=input$Sepal.Width,
                                                                                Petal.Length=input$Petal.Length,
                                                                                Petal.Width=input$Petal.Width)
                                                    )
                        
                        paste(toupper(species.estimate))
                        })
                
                output$image <- renderImage({
                        species.estimate <- predict(model, newdata = data.frame(Sepal.Length=input$Sepal.Length,
                                                                                Sepal.Width=input$Sepal.Width,
                                                                                Petal.Length=input$Petal.Length,
                                                                                Petal.Width=input$Petal.Width)
                                                    )
                        
                        if(species.estimate == "setosa"){
                                return(list(src = "images/setosa.jpg",
                                #return(list(src = url(http://www.twofrog.com/images/iris38a.jpg),
                                            contentType = "image/jpg",
                                            width = 200,
                                            alt = "Setosa")
                                )
                        } else if (species.estimate == "virginica"){
                                return(list(src = "images/virginica.jpg",
                                            contentType = "image/jpg",
                                            width = 200,
                                            alt = "Virginica")
                                )
                        } else if (species.estimate == "versicolor"){
                                return(list(src = "images/versicolor.jpg",
                                            contentType = "image/jpg",
                                            width = 200,
                                            alt = "Versicolor")
                                )
                        }
                }, deleteFile = FALSE)
         })