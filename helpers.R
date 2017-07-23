
source("libraries.R")
#Read CSV from the csv folder
#df for jfk data
df = read.csv("csv/jfk_df.csv", header = TRUE)
    #create df grouped by Date for jfk data
    dfdate = read.csv("csv/date.csv", header = TRUE)
    dfdate$mean<-round(dfdate$mean, 2)
#df for newark data
df2 = read.csv("csv/ne_df.csv", header = TRUE)
    #create df grouped by Date for newark data
    date2ne = read.csv("csv/date2ne.csv", header = TRUE)
    date2ne$mean<-round(dfdate$mean, 2)
#df for newark data
df3 = read.csv("csv/na_df.csv", header = TRUE)
    #create df grouped by Date for newark data
    datena = read.csv("csv/datena.csv", header = TRUE)
    datena$mean<-round(datena$mean, 2)
#df for newark data
df4 = read.csv("csv/nf_df.csv", header = TRUE)
    #create df grouped by Date for newark data
    datenf = read.csv("csv/datenf.csv", header = TRUE)
    datenf$mean<-round(datenf$mean, 2)
#df for newark data
df5 = read.csv("csv/gf_df.csv", header = TRUE)
    #create df grouped by Date for newark data
    dategr = read.csv("csv/dategr.csv", header = TRUE)
    dategr$mean<-round(dategr$mean, 2)
  
    

