library(RMySQL)

dbreader <- function()
{
mydb= dbConnect(MySQL(),user='root',password='root',dbname='MD',host='localhost')
dbListTables(mydb)
datar=dbSendQuery(mydb,"select * from MyD")
data1=fetch(datar,n=-1)
return(data1)
dbDisconnect(mydb)
}

sd<-data.frame(dbreader())
cor(sd[,-1], use='complete.obs') # corealation table 

myPlot <- function(x,y){
  plot(x,y)}

