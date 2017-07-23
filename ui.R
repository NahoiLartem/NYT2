source("server.R")


ui <- dashboardPage(
  skin = "green",
  dashboardHeader(title = 'NYC Green Taxi', titleWidth = 450),
  dashboardSidebar(
    width = 250
    # ,dateRangeInput("dateId", "Select Date Range:", start = Sys.Date()-14)
    # ,selectInput('rateCodeId', label = 'Select RateCode ID', choices = df$RateCodeID , multiple = TRUE)
    # ,selectInput('paymentId', label = 'Select Payment Type', choices = df$state , multiple = TRUE)
    # ,selectInput('timeId', label = 'Time', choices = df$Time, multiple = TRUE)
    ,sidebarMenu(
      menuItem("JFK", tabName = "JFK", icon = icon("plane")),
      menuItem("Newark", tabName = "Newark", icon = icon("car")),
      menuItem("Nassau", tabName = "Nassau", icon = icon("car")),
      menuItem("Negotiated Fare", tabName = "nf", icon = icon("car")),
      menuItem("Group Ride", tabName = "gr", icon = icon("truck"))

      


)
),
dashboardBody(
  tabItems( 
    tabItem(tabName = "JFK",
            tags$style(HTML(".box.box-solid.box-danger>.box-header {
                            background:#006400;
                            }
                            .box.box-solid.box-danger{
                            border-bottom-color:#006400;
                            border-left-color:#006400;
                            border-right-color:#006400;
                            border-top-color:#006400;
                            }"))
              ,fluidRow(
                valueBoxOutput("box1"),tags$style(".small-box {background-color:#00000 !important;}")
                ,valueBoxOutput("box2"),tags$style(".small-box {background-color:#00000 !important;}")
                ,valueBoxOutput("box3"),tags$style(".small-box {background-color:#00000 !important;}")
              
              )
            ,fluidRow(
              tabBox(tabPanel(title = "Pickup Locations", leafletOutput("mymap"))
                     ,tabPanel(title = "Tip per Distance", highchartOutput("mainChart"))
                     ,tabPanel(title = "Total Trips per Day", highchartOutput("barChart1"))
                     ,tabPanel(title = "Average Distance per Day", highchartOutput("barChart2"))
                     ,tabPanel(title = "Total Distance per Day", highchartOutput("barChart3"))
                     
            

                 ,width = 12))
            
            ,fluidRow(
              valueBoxOutput("box4"),tags$style(".small-box {background-color:#00000 !important;}")
              ,valueBoxOutput("box5"),tags$style(".small-box {background-color:#00000 !important;}")
              ,valueBoxOutput("box6"),tags$style(".small-box {background-color:#00000 !important;}")
              
            ))
    ,tabItem(tabName = "Newark",
            tags$style(HTML(".box.box-solid.box-danger>.box-header {
                            background:#006400;
                            }
                            .box.box-solid.box-danger{
                            border-bottom-color:#006400;
                            border-left-color:#006400;
                            border-right-color:#006400;
                            border-top-color:#006400;
                            }"))
            ,fluidRow(
              valueBoxOutput("box1ne"),tags$style(".small-box {background-color:#00000 !important;}")
              ,valueBoxOutput("box2ne"),tags$style(".small-box {background-color:#00000 !important;}")
              ,valueBoxOutput("box3ne"),tags$style(".small-box {background-color:#00000 !important;}")
              
            )
            ,fluidRow(
              tabBox(tabPanel(title = "Pickup Locations", leafletOutput("mymap2ne"))
                     ,tabPanel(title = "Tip per Distance", highchartOutput("mainChart2ne"))
                     ,tabPanel(title = "Total Trips per Day", highchartOutput("barChart1ne"))
                     ,tabPanel(title = "Average Distance per Day", highchartOutput("barChart2ne"))
                     ,tabPanel(title = "Total Distance per Day", highchartOutput("barChart3ne"))
                     

                     
                     
                     ,width = 12))
            ,fluidRow(
              valueBoxOutput("box4ne"),tags$style(".small-box {background-color:#00000 !important;}")
              ,valueBoxOutput("box5ne"),tags$style(".small-box {background-color:#00000 !important;}")
              ,valueBoxOutput("box6ne"),tags$style(".small-box {background-color:#00000 !important;}")
              
            ))#end of tabitem
    ,tabItem(tabName = "Nassau",
             tags$style(HTML(".box.box-solid.box-danger>.box-header {
                             background:#006400;
                             }
                             .box.box-solid.box-danger{
                             border-bottom-color:#006400;
                             border-left-color:#006400;
                             border-right-color:#006400;
                             border-top-color:#006400;
                             }"))
             ,fluidRow(
               valueBoxOutput("box1na"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box2na"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box3na"),tags$style(".small-box {background-color:#00000 !important;}"))
             ,fluidRow(
               tabBox(tabPanel(title = "Pickup Locations", leafletOutput("mymap3na"))
                      ,tabPanel(title = "Tip per Distance", highchartOutput("mainChart3na"))
                      ,tabPanel(title = "Total Trips per Day", highchartOutput("barChart1na"))
                      ,tabPanel(title = "Average Distance per Day", highchartOutput("barChart2na"))
                      ,tabPanel(title = "Total Distance per Day", highchartOutput("barChart3na"))
                      ,width = 12))
             
             ,fluidRow(
               valueBoxOutput("box4na"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box5na"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box6na"),tags$style(".small-box {background-color:#00000 !important;}"))
    )
    ,tabItem(tabName = "nf",
             tags$style(HTML(".box.box-solid.box-danger>.box-header {
                             background:#006400;
                             }
                             .box.box-solid.box-danger{
                             border-bottom-color:#006400;
                             border-left-color:#006400;
                             border-right-color:#006400;
                             border-top-color:#006400;
                             }"))
             ,fluidRow(
               valueBoxOutput("box1nf"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box2nf"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box3nf"),tags$style(".small-box {background-color:#00000 !important;}")
             )
             ,fluidRow(
               tabBox(tabPanel(title = "Pickup Locations", leafletOutput("mymap3nf"))
                      ,tabPanel(title = "Tip per Distance", highchartOutput("mainChart3nf"))
                      ,tabPanel(title = "Total Trips per Day", highchartOutput("barChart1nf"))
                      ,tabPanel(title = "Average Distance per Day", highchartOutput("barChart2nf"))
                      ,tabPanel(title = "Total Distance per Day", highchartOutput("barChart3nf"))
                      ,width = 12))
             ,fluidRow(
               valueBoxOutput("box4nf"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box5nf"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box6nf"),tags$style(".small-box {background-color:#00000 !important;}")
               
             )
             
    )
    ,tabItem(tabName = "gr",
             tags$style(HTML(".box.box-solid.box-danger>.box-header {
                             background:#006400;
                             }
                             .box.box-solid.box-danger{
                             border-bottom-color:#006400;
                             border-left-color:#006400;
                             border-right-color:#006400;
                             border-top-color:#006400;
                             }"))
             ,fluidRow(
               valueBoxOutput("box1gr"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box2gr"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box3gr"),tags$style(".small-box {background-color:#00000 !important;}")
             )
             ,fluidRow(
               tabBox(tabPanel(title = "Pickup Locations", leafletOutput("mymap3gr"))
                      ,tabPanel(title = "Tip per Distance", highchartOutput("mainChart3gr"))
                      ,tabPanel(title = "Total Trips per Day", highchartOutput("barChart1gr"))
                      ,tabPanel(title = "Average Distance per Day", highchartOutput("barChart2gr"))
                      ,tabPanel(title = "Total Distance per Day", highchartOutput("barChart3gr"))
                      ,width = 12))
             ,fluidRow(
               valueBoxOutput("box4gr"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box5gr"),tags$style(".small-box {background-color:#00000 !important;}")
               ,valueBoxOutput("box6gr"),tags$style(".small-box {background-color:#00000 !important;}")
               
             )
    )




    
    ))
)
  
