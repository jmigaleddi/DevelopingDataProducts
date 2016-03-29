library(shiny)

shinyUI(fluidPage(
        
        titlePanel("Name That IRIS"),

        fluidRow(column(width = 12,
                        h3("Description"),
                        p("This application was designed to help users identify the species of Iris
                          they are observing based on how long and wide their sepals and petals are.
                          When the user provides the specified inputs, the application will utilize
                          a model to predict the species of Iris."),
                        h4("Data"),
                        p("The data for this application comes from the famous (Fisher's or Anderson's)
                          Iris data set which gives the measurements in centimeters of the variables
                          sepal length and width and petal length and width, respectively, for 50
                          flowers from each of 3 species of iris. The species are Iris setosa, versicolor,
                          and virginica."),
                        h4("Modeling"),
                        p("For this application, a random forest model is being used to generate the predictions."),
                        h4("Further Documentation"),
                        p("All code for this application can be found on",
                          a("Github.", href="https://github.com/jmigaleddi/DevelopingDataProducts"))
        )),
        
        br(),
  
        sidebarLayout(
                sidebarPanel(
                        helpText('Here is where you will input information about the Iris you are observing.
                                  All measurements should be in centimeters. Once all of the measurements
                                  have been entered, click "Apply Changes."'),
                        
                        sliderInput("Sepal.Length", 
                                    label = "How long is the sepal that you are observing?",
                                    min = 3.0, max = 9.0, value = 5.5, step = 0.1),
                        
                        sliderInput("Sepal.Width", 
                                    label = "How wide is the sepal that you are observing?",
                                    min = 1.0, max = 6.0, value = 3.0, step = 0.1),
                        
                        sliderInput("Petal.Length", 
                                    label = "How long is the petal that you are observing?",
                                    min = 1.0, max = 8.0, value = 3.5, step = 0.1),
                        
                        sliderInput("Petal.Width", 
                                    label = "How wide is the petal that you are observing?",
                                    min = 0, max = 3.0, value = 1.0, step = 0.1),
                                                    
                        submitButton()
                        ),
                
                mainPanel("It is likely that the flower you are viewing is a:", 
                          br(), br(),
                          strong(textOutput("text1")),
                          br(),
                          imageOutput("image"))
                )
        )
)