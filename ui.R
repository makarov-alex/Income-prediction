library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Income prediction model (based on US 1994 Census database)"),
  # Sidebar with inputs
  sidebarLayout(
    sidebarPanel(
       h4("Please enter person characteristics:"),
       sliderInput("age", "Age:", min = 17, max = 90, value = 30),
       selectInput("work.class", " Work class", c(" Private", " Self-emp-not-inc", " Self-emp-inc", " Federal-gov", " Local-gov", " State-gov", " Without-pay", " Never-worked"), selected = " Self-emp-not-inc", multiple = FALSE, selectize = TRUE, width = NULL, size = NULL),
       selectInput("education", " Education", c(" Bachelors", " Some-college", " 11th", " HS-grad", " Prof-school", " Assoc-acdm", " Assoc-voc", " 9th", " 7th-8th", " 12th", " Masters", " 1st-4th", " 10th", " Doctorate", " 5th-6th", " Preschool"), selected = " Bachelors", multiple = FALSE, selectize = TRUE, width = NULL, size = NULL),
       selectInput("occupation", " Occupation", c(" Tech-support", " Craft-repair", " Other-service", " Sales", " Exec-managerial", " Prof-specialty", " Handlers-cleaners", " Machine-op-inspct", " Adm-clerical", " Farming-fishing", " Transport-moving", " Priv-house-serv", " Protective-serv", " Armed-Forces"), selected = " Exec-managerial", multiple = FALSE, selectize = TRUE, width = NULL, size = NULL),
       selectInput("marital.status", " Marital status", c(" Married-civ-spouse", " Divorced", " Never-married", " Separated", " Widowed", " Married-spouse-absent", " Married-AF-spouse"), selected = " Married-civ-spouse", multiple = FALSE, selectize = TRUE, width = NULL, size = NULL),
       selectInput("race", " Race", c(" White", " Asian-Pac-Islander", " Amer-Indian-Eskimo", " Other", " Black"), selected = NULL, multiple = FALSE, selectize = TRUE, width = NULL, size = NULL),
       selectInput("sex", " Biological sex", c(" Female", " Male"), selected = " Male", multiple = FALSE, selectize = TRUE, width = NULL, size = NULL),
       sliderInput("hpw", " Hours worked per week", min=2,max=99,value=40)
    ),
    mainPanel(
    h2("This is income prediction for your input (in thousand USD):\n"),
    h2(textOutput("result")),
    h4("As example, you can try 20 years old divorced male with 11th education and tech-support occupation vs. 40 years old married-civ-spouse male with Masters education and Exec-managerial occupation")
    )
  )
))
