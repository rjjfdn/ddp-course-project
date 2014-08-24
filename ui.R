library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Multivariate Linear Models with mtcars dataset"),
  
  sidebarPanel(
    h5("This basically makes multivariate linear models for the 
       mtcars dataset where the mpg is the outcome. You can also 
       check the plot of a feature vs. mpg for your guide."),
    h4("Feature Selection"),
    p("Please select the features"),
    checkboxInput("cyl", "Number of cylinders", FALSE),
    checkboxInput("disp", "Displacement (cu.in.)", FALSE),
    checkboxInput("hp", "Gross horsepower", FALSE),
    checkboxInput("drat", "Rear axle ratio", FALSE),
    checkboxInput("wt", "Weight (lb/1000)", FALSE),
    checkboxInput("qsec", "1/4 mile time", FALSE),
    checkboxInput("vs", "V/S", FALSE),
    checkboxInput("am", "Transmission (0 = automatic, 1 = manual)", FALSE),
    checkboxInput("gear", "Number of forward gears", FALSE),
    checkboxInput("carb", "Number of carburetors", FALSE),
    h4("Plot"),
    selectInput("var", "Check the plot of a feature vs. mpg:", 
                list("Number of cylinders" = "cyl",
                     "Displacement (cu.in.)" = "disp",
                     "Gross horsepower" = "hp",
                     "Rear axle ratio" = "drat",
                     "Weight (lb/1000)" = "wt",
                     "1/4 mile time" = "qsec",
                     "V/S" = "vs",
                     "Transmission (0 = automatic, 1 = manual)" = "am",
                     "Number of forward gears" = "gear",
                     "Number of carburetors" = "carb"))
  ),
  
  mainPanel(
    verbatimTextOutput("summary"),
    plotOutput("plot")
  )
))