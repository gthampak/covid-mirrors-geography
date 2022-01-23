library(tidyverse)
library(lubridate)
library(shiny)


covid <- read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")

vars <- names(covid)

vars <- vars[! vars %in% c('date')]

sum <- covid %>% group_by(date) %>% 
  summarise(across(vars, ~ sum(is.na(.))))

prop <- covid %>% group_by(date) %>% 
  summarise(across(vars, funs(sum(is.na(.)) / length(.))))

NAsummary <- prop %>% 
  pivot_longer(!date, names_to="variable") %>%
  mutate(date=ymd(date))

all_variables <- unique(NAsummary$variable)



ui <- fluidPage(
  titlePanel("NA Summary of Covid dataset variables"),
  sidebarLayout(
    sidebarPanel(selectInput(inputId="variable", label="Variable", choices = all_variables, multiple = TRUE, selected="total_cases_/")),
    mainPanel(plotOutput(outputId="day_NAprop_plot"))
  )
)
server <- function(input, output) {
  output$day_NAprop_plot <- renderPlot({
    
    data_long_filtered <- NAsummary %>% 
      filter(variable %in% input$variable)
    
    ggplot(data_long_filtered, aes(x=date, y=value, color=variable)) + 
      geom_line() +
      ggtitle("Proportions of NAs per day") +
      xlab("Date") +
      ylab("Proportions of NAs")
  })
}


shinyApp(ui=ui, server=server)