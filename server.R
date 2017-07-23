source("helpers.R")
source("libraries.R")

server <- function(input, output, session) { 
    
  #Group Ride Tab
  #Value Boxes
  output$box1gr <- renderValueBox({
    valueBox(
      value = prettyNum(round(median(df5$Trip_distance),2), big.mark = ",")
      ,subtitle = "Median Distance"
      ,color = "green"
      ,icon = icon("arrows-h")
    )}) 
  #Average Fare Amount
  output$box2gr <- renderValueBox({
    valueBox(
      value = prettyNum(round(mean(df5$Fare_amount),2), big.mark = ",")
      ,subtitle = "Average Fare Amount"
      ,color = "green"
      ,icon = icon("dollar")
    )}) 
  
  #Total Trips
  output$box3gr <- renderValueBox({
    valueBox(
      value = prettyNum(length(df5$RateCodeID), big.mark = ",")
      ,subtitle = "Total Trips"
      ,color = "green"
      ,icon = icon("car")
    )}) 
  
  #Total Distance
  output$box4gr <- renderValueBox({
    valueBox(
      value = prettyNum(round((df5$Fare_amount/df5$Trip_distance),2), big.mark = ",")
      ,subtitle = "Fare Amount per Mile"
      ,color = "black"
      ,icon = icon("car")
    )}) 
  
  #Total Distance
  output$box5gr <- renderValueBox({
    valueBox(
      value = prettyNum(sum(round(df5$Fare_amount),1), big.mark = ",")
      ,subtitle = "Total Money Made"
      ,color = "black"
      ,icon = icon("black")
    )}) 
  
  #Total Distance
  output$box6gr <- renderValueBox({
    valueBox(
      value = prettyNum(mean(round(df5$Tip_amount),2), big.mark = ",")
      ,subtitle = "Average Tip Amount"
      ,color = "black"
      ,icon = icon("dollar")
    )}) 
  
  #Leaflet Map
  output$mymap3gr <- renderLeaflet({
    # define the leaflet map object
    leaflet() %>%
      addTiles() %>%
      #setView(0,0,2) %>%
      setView(-73.9465, 40.8116, zoom = 14) %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      addCircleMarkers(lng = df5$Pickup_longitude, lat = df5$Pickup_latitude
                       ,radius = 6
                       ,color = "black"
                       ,stroke = FALSE
                       ,fillOpacity = 0.5
                       ,popup = df5$Trip_distance) 
    
  })
  
  #Distance Vs Amount scatter chart
  output$mainChart3gr <- renderHighchart({ 
    hc <- highchart()
    hc <- hc %>%
      hc_add_series_scatter(df5$Trip_distance, df5$Tip_amount ,showInLegend = FALSE) %>%
      hc_colors(color='black') %>%
      hc_yAxis(title=list(text='Tip Amount')) %>%
      hc_xAxis(title=list(text='Trip Distance'))%>%
      hc_tooltip(headerFormat = "", pointFormat = "Tip: {point.y} <br> Distance: {point.x}")
    
  })
  
  
  #Barchart for Day Vs Count
  output$barChart1gr <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = dategr$date) %>% 
      hc_add_series(name = "Total Number of Trips", data = dategr$count, type = "column" ,color = "black") 
    hc
  })
  
  #Brachart for Day Vs Average Distance
  output$barChart2gr <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = dategr$date) %>% 
      hc_add_series(name = "Average Distance", data = dategr$mean, color = "black") 
    hc
  })
  
  #Brachart for Day Vs Total Distance
  output$barChart3gr <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = dategr$date) %>% 
      hc_add_series(name = "Total Distance", data = dategr$sum, color = "black") 
    hc
  })
  
  
  #NEGOTIATED FARE
  #Value Boxes
  output$box1nf <- renderValueBox({
    valueBox(
      value = prettyNum(round(median(df4$Trip_distance),2), big.mark = ",")
      ,subtitle = "Median Distance"
      ,color = "green"
      ,icon = icon("arrows-h")
    )}) 
  #Average Fare Amount
  output$box2nf <- renderValueBox({
    valueBox(
      value = prettyNum(round(mean(df4$Fare_amount),2), big.mark = ",")
      ,subtitle = "Average Fare Amount"
      ,color = "green"
      ,icon = icon("dollar")
    )}) 
  
  #Total Trips
  output$box3nf <- renderValueBox({
    valueBox(
      value = prettyNum(length(df4$RateCodeID), big.mark = ",")
      ,subtitle = "Total Trips"
      ,color = "green"
      ,icon = icon("car")
    )}) 
  
  #Total Distance
  output$box4nf <- renderValueBox({
    valueBox(
      value = prettyNum(round((df4$Fare_amount/df2$Trip_distance),2), big.mark = ",")
      ,subtitle = "Fare Amount per Mile"
      ,color = "black"
      ,icon = icon("car")
    )}) 
  
  #Total Distance
  output$box5nf <- renderValueBox({
    valueBox(
      value = prettyNum(sum(round(df4$Fare_amount),1), big.mark = ",")
      ,subtitle = "Total Money Made"
      ,color = "black"
      ,icon = icon("black")
    )}) 
  
  #Total Distance
  output$box6nf <- renderValueBox({
    valueBox(
      value = prettyNum(mean(round(df4$Tip_amount),2), big.mark = ",")
      ,subtitle = "Average Tip Amount"
      ,color = "black"
      ,icon = icon("dollar")
    )}) 
  
  #Leaflet Map
  output$mymap3nf <- renderLeaflet({
    # define the leaflet map object
    leaflet() %>%
      addTiles() %>%
      #setView(0,0,2) %>%
      setView(-73.9465, 40.8116, zoom = 14) %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      addCircleMarkers(lng = df4$Pickup_longitude, lat = df4$Pickup_latitude
                       ,radius = 6
                       ,color = "black"
                       ,stroke = FALSE
                       ,fillOpacity = 0.5
                       ,popup = df4$Trip_distance) 
    
  })
  
  #Distance Vs Amount scatter chart
  output$mainChart3nf <- renderHighchart({ 
    hc <- highchart()
    hc <- hc %>%
      hc_add_series_scatter(df4$Tip_amount, df4$Trip_distance, showInLegend = FALSE) %>%
      hc_colors(color='black') %>%
      hc_yAxis(title=list(text='Tip Amount')) %>%
      hc_xAxis(title=list(text='Trip Distance'))%>%
      hc_tooltip(headerFormat = "", pointFormat = "Tip: {point.x} <br> Distance: {point.y}")
    
  })
  
  
  #Barchart for Day Vs Count
  output$barChart1nf <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = datenf$date) %>% 
      hc_add_series(name = "Total Number of Trips", data = datenf$count, type = "column" ,color = "black") 
    hc
  })
  
  #Brachart for Day Vs Average Distance
  output$barChart2nf <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = datenf$date) %>% 
      hc_add_series(name = "Average Distance", data = datenf$mean, color = "black") 
    hc
  })
  
  #Brachart for Day Vs Total Distance
  output$barChart3nf <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = datenf$date) %>% 
      hc_add_series(name = "Total Distance", data = datenf$sum, color = "black") 
    hc
  })
  
  
  
  
  
  
  
  
  
  
#NASSAU TAB
#Value Boxes
  output$box1na <- renderValueBox({
    valueBox(
      value = prettyNum(round(median(df3$Trip_distance),2), big.mark = ",")
      ,subtitle = "Median Distance"
      ,color = "green"
      ,icon = icon("arrows-h")
    )}) 
  #Average Fare Amount
  output$box2na <- renderValueBox({
    valueBox(
      value = prettyNum(round(mean(df3$Fare_amount),2), big.mark = ",")
      ,subtitle = "Average Fare Amount"
      ,color = "green"
      ,icon = icon("dollar")
    )}) 
  
  #Total Trips
  output$box3na <- renderValueBox({
    valueBox(
      value = prettyNum(length(df3$RateCodeID), big.mark = ",")
      ,subtitle = "Total Trips"
      ,color = "green"
      ,icon = icon("car")
    )}) 
  
  #Total Distance
  output$box4na <- renderValueBox({
    valueBox(
      value = prettyNum(round((df3$Fare_amount/df2$Trip_distance),2), big.mark = ",")
      ,subtitle = "Fare Amount per Mile"
      ,color = "black"
      ,icon = icon("car")
    )}) 
  
  #Total Distance
  output$box5na <- renderValueBox({
    valueBox(
      value = prettyNum(sum(round(df3$Fare_amount),1), big.mark = ",")
      ,subtitle = "Total Money Made"
      ,color = "black"
      ,icon = icon("black")
    )}) 
  
  #Total Distance
  output$box6na <- renderValueBox({
    valueBox(
      value = prettyNum(mean(round(df3$Tip_amount),2), big.mark = ",")
      ,subtitle = "Average Tip Amount"
      ,color = "black"
      ,icon = icon("dollar")
    )}) 
  
  output$mymap3na <- renderLeaflet({
    # define the leaflet map object
    leaflet() %>%
      addTiles() %>%
      #setView(0,0,2) %>%
      setView(-73.9465, 40.8116, zoom = 14) %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      
      addCircleMarkers(lng = df3$Pickup_longitude, lat = df3$Pickup_latitude
                       ,radius = 6
                       ,color = "black"
                       ,stroke = FALSE
                       ,fillOpacity = 0.5
                       ,popup = df3$Trip_distance) 
    
  })
  
  #Distance Vs Amount scatter chart
  output$mainChart3na <- renderHighchart({ 
    hc <- highchart()
    hc <- hc %>%
      hc_add_series_scatter(df3$Tip_amount, df3$Trip_distance, showInLegend = FALSE) %>%
      hc_colors(color='black') %>%
      hc_yAxis(title=list(text='Tip Amount')) %>%
      hc_xAxis(title=list(text='Trip Distance'))%>%
      hc_tooltip(headerFormat = "", pointFormat = "Tip: {point.x} <br> Distance: {point.y}")
    
  })
  
  #Barchart for Day Vs Count
  output$barChart1na <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = datena$date) %>% 
      hc_add_series(name = "Total Number of Trips", data = datena$count, type = "column" ,color = "black") 
    hc
  })
  
  #Brachart for Day Vs Average Distance
  output$barChart2na <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = datena$date) %>% 
      hc_add_series(name = "Average Distance", data = datena$mean, color = "black") 
    hc
  })
  
  #Brachart for Day Vs Total Distance
  output$barChart3na <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = datena$date) %>% 
      hc_add_series(name = "Total Distance", data = datena$sum, color = "black") 
    hc
  })
  
#NEWARK TAB
#Value Boxes
  output$box1ne <- renderValueBox({
    valueBox(
      value = prettyNum(median(df2$Trip_distance), big.mark = ",")
      ,subtitle = "Median Distance"
      ,color = "green"
      ,icon = icon("arrows-h")
    )}) 
  #Average Fare Amount
  output$box2ne <- renderValueBox({
    valueBox(
      value = prettyNum(round(mean(df2$Fare_amount),2), big.mark = ",")
      ,subtitle = "Average Fare Amount"
      ,color = "green"
      ,icon = icon("dollar")
    )}) 
  
  #Total Trips
  output$box3ne <- renderValueBox({
    valueBox(
      value = prettyNum(length(df2$RateCodeID), big.mark = ",")
      ,subtitle = "Total Trips"
      ,color = "green"
      ,icon = icon("car")
    )}) 
  
  #Total Distance
  output$box4ne <- renderValueBox({
    valueBox(
      value = prettyNum(round((df2$Fare_amount/df2$Trip_distance),2), big.mark = ",")
      ,subtitle = "Fare Amount per Mile"
      ,color = "black"
      ,icon = icon("car")
    )}) 
  
  #Total Distance
  output$box5ne <- renderValueBox({
    valueBox(
      value = prettyNum(sum(round(df2$Fare_amount),1), big.mark = ",")
      ,subtitle = "Total Money Made"
      ,color = "black"
      ,icon = icon("black")
    )}) 
  
  #Total Distance
  output$box6ne <- renderValueBox({
    valueBox(
      value = prettyNum(mean(round(df$Tip_amount),2), big.mark = ",")
      ,subtitle = "Average Tip Amount"
      ,color = "black"
      ,icon = icon("dollar")
    )}) 
  
  #Leaflet Map for newark data
  output$mymap2ne <- renderLeaflet({
    # define the leaflet map object
    leaflet() %>%
      addTiles() %>%
      #setView(0,0,2) %>%
      setView(-73.9465, 40.8116, zoom = 14) %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      
      addCircleMarkers(lng = df2$Pickup_longitude, lat = df2$Pickup_latitude
                       ,radius = 6
                       ,color = "black"
                       ,stroke = FALSE
                       ,fillOpacity = 0.5
                       ,popup = df2$Trip_distance) 
    
  })
  #Distance Vs Amount scatter chart
  output$mainChart2ne <- renderHighchart({ 
    hc <- highchart()
    hc <- hc %>%
      hc_add_series_scatter(df2$Tip_amount, df2$Trip_distance, showInLegend = FALSE) %>%
      hc_colors(color='black') %>%
      hc_yAxis(title=list(text='Tip Amount')) %>%
      hc_xAxis(title=list(text='Trip Distance'))%>%
      hc_tooltip(headerFormat = "", pointFormat = "Tip: {point.x} <br> Distance: {point.y}")
    
  })
  
  #Barchart for Day Vs Count
  output$barChart1ne <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = date2ne$date) %>% 
      hc_add_series(name = "Total Number of Trips", data = date2ne$count, type = "column" ,color = "black") 
    hc
  })
  
  #Brachart for Day Vs Average Distance
  output$barChart2ne <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = date2ne$date) %>% 
      hc_add_series(name = "Average Distance", data = date2ne$mean, color = "black") 
    hc
  })
  
  #Brachart for Day Vs Total Distance
  output$barChart3ne <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = date2ne$date) %>% 
      hc_add_series(name = "Total Distance", data = date2ne$sum, color = "black") 
    hc
  })
  
  

  
  

  
#JFK TAB
#Value Boxes 
#Average Distance
  output$box1 <- renderValueBox({
    valueBox(
      value = prettyNum(median(df$Trip_distance), big.mark = ",")
      ,subtitle = "Median Distance"
      ,color = "green"
      ,icon = icon("arrows-h")
    )}) 
#Average Fare Amount
  output$box2 <- renderValueBox({
    valueBox(
      value = prettyNum(mean(df$Fare_amount), big.mark = ",")
      ,subtitle = "Average Fare Amount"
      ,color = "green"
      ,icon = icon("dollar")
    )}) 
  
#Total Trips
  output$box3 <- renderValueBox({
    valueBox(
      value = prettyNum(length(df$RateCodeID), big.mark = ",")
      ,subtitle = "Total Trips"
      ,color = "green"
      ,icon = icon("car")
    )}) 
  
#Total Distance
  output$box4 <- renderValueBox({
    valueBox(
      value = prettyNum(round((df$Fare_amount/df$Trip_distance),2), big.mark = ",")
      ,subtitle = "Fare Amount per Mile"
      ,color = "black"
      ,icon = icon("car")
    )}) 
  
#Total Distance
  output$box5 <- renderValueBox({
    valueBox(
      value = prettyNum(sum(round(df$Fare_amount),1), big.mark = ",")
      ,subtitle = "Total Money Made"
      ,color = "black"
      ,icon = icon("black")
    )}) 
  
#Total Distance
  output$box6 <- renderValueBox({
    valueBox(
      value = prettyNum(mean(round(df$Tip_amount),2), big.mark = ",")
      ,subtitle = "Average Tip Amount"
      ,color = "black"
      ,icon = icon("dollar")
    )}) 
  
  
#Leaflet Map
  output$mymap <- renderLeaflet({
    # define the leaflet map object
    leaflet() %>%
      addTiles() %>%
    #setView(0,0,2) %>%
    setView(-73.9465, 40.8116, zoom = 14) %>%
    addProviderTiles(providers$CartoDB.Positron) %>%
    
    addCircleMarkers(lng = df$Pickup_longitude, lat = df$Pickup_latitude
                     ,radius = 6
                     ,color = "black"
                     ,stroke = FALSE
                     ,fillOpacity = 0.5
                     ,popup = df$Trip_distance) 

})
  
#Distance Vs Amount scatter chart
  output$mainChart <- renderHighchart({ 
    hc <- highchart()
    hc <- hc %>%
    hc_add_series_scatter(df$Tip_amount, df$Trip_distance, showInLegend = FALSE) %>%
      hc_colors(color='black') %>%
      hc_yAxis(title=list(text='Tip Amount')) %>%
      hc_xAxis(title=list(text='Trip Distance'))%>%
    hc_tooltip(headerFormat = "", pointFormat = "Tip: {point.x} <br> Distance: {point.y}")
    
  })
  
  #Barchart for Day Vs Count
  output$barChart1 <- renderHighchart ({   
    hc <- highchart() %>% 
    hc_xAxis(categories = dfdate$date) %>% 
    hc_add_series(name = "Total Number of Trips", data = dfdate$count, type = "column" ,color = "black") 
  hc
  })
  
  #Brachart for Day Vs Average Distance
  output$barChart2 <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = dfdate$date) %>% 
      hc_add_series(name = "Average Distance", data = dfdate$mean, color = "black") 
    hc
  })
  
  #Brachart for Day Vs Total Distance
  output$barChart3 <- renderHighchart ({   
    hc <- highchart() %>% 
      hc_xAxis(categories = dfdate$date) %>% 
      hc_add_series(name = "Total Distance", data = dfdate$sum, color = "black") 
    hc
  })
  
  
  
  
}
