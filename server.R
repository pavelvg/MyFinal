shinyServer(function(input, output) {
   
   output$map <- renderPlot({
    #sd$input$Indicator_y
    #attach(sd)
    
     #plot(na.omit(sd)$input$Indicator_x,na.omit(sd)$input$Indicator_x)
     #barplot(sd[,input$Indicator_x],main=sd$input$Indicator_x)
    plot(sd[,input$Indicator_x],sd[,input$Indicator_y],xlab=input$Indicator_x,ylab=input$Indicator_y,col='cyan3', type = 'p',pch=16)
    outputOptions(output,"map",suspendWhenHidden=FALSE)
      })
    output$bar <- renderPlot({
      
      xx=barplot(head(sd[order(-sd[,input$Indicator]),],7)[,input$Indicator],main=input$Indicator,col=c("cyan",'blue',"red","green",'white','black','grey'),ylab="Values",xlab=input$Indicator,names.arg =head(sd[order(-sd[,input$Indicator]),],7)[,"True"],legend.text=head(sd[order(-sd[,input$Indicator]),],7)[,"True"])
      
     # axis(1, at=xx, line=3,LETTERS[1:7])
    })
    output$bar1 <- renderPlot({
      
      #if we do it this way, we could probably use $ sign notation since this passes 
      #column rather than string
      
      
      #barplot(head(sd[order(-sd[,input$Indicator]),],7)[,input$Indicator],main=input$Indicator,col = 'red',ylab="Values",xlab=input$Indicator,names.arg =head(sd[order(-sd[,input$Indicator]),],7)[,"True"])
      barplot(aaz[,"current_amount"],col="cyan",names.arg =aaz[,"assistance_category_name"])
 })
})  

