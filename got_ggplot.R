library(ggplot2)
library(reshape)
library(xlsx)
#GOT <- read.xlsx("game_of_thrones_no_view.xls",sheetIndex=1)
#GOT_melt <- melt(GOT[,-12], id.vars=c("Season"))
#GOT_melt$Season=paste("Season",GOT_melt$Season)
#write.xlsx(GOT_melt,file="got_melt.xls")


GOT <- read.xlsx("got_melt.xls",sheetIndex=1)
GOT$Episode<-factor(as.character(GOT$Episode),levels=c("Ep1","Ep2",  "Ep3" , "Ep4",  "Ep5" , "Ep6" , "Ep7" , "Ep8",  "Ep9","Ep10" ))
GOT$Season<-as.character(GOT$Season)

ggplot(GOT, aes(x=Episode, y=Number_of_viewers,colour=Season,group=Season))+ geom_line()+geom_point()

ggplot(GOT, aes(x=Episode, y=Number_of_viewers,colour=Season,group=Season)) + geom_line()+ geom_point()+
  ggtitle("Game of throne Viewership per episode by Season ")+
  scale_x_discrete("Episode number",labels=c("1", "2", "3","4", "5", "6","7", "8", "9","10"))+
  scale_y_continuous("Numer of U.S viewers in millions",breaks=seq(0,12,1))+
  scale_colour_discrete(name="")+
  theme(plot.title = element_text(face="bold"),
        panel.background = element_rect(fill = "white",colour = "grey"),
        panel.grid.major = element_line(colour = "grey",size=0.1),
        panel.grid.minor = element_line(colour = "grey",size=0.1))


plot <- plot + theme(plot.title = element_text(face="bold"),
                     panel.background = element_rect(fill = "white",colour = "grey"),
                     panel.grid.major = element_line(colour = "grey",size=0.1),
                     panel.grid.minor = element_line(colour = "grey",size=0.1))



ggplot(GOT,aes(Episode,Number_of_viewers,fill=Season))+geom_bar(stat="identity",show.legend=FALSE)+facet_grid(~Season)+theme_linedraw()+ggtitle("Game of thrones - number of viewers")+
  scale_x_discrete("Episode number",labels=c("1", "2", "3","4", "5", "6","7", "8", "9","10"))+
  scale_y_continuous("Number of viewers per episode")



plot<- ggplot(GOT, aes(x=Episode, y=Number_of_viewers,colour=Season,group=Season))

plot <- plot + geom_line()
plot <- plot + geom_point()

plot <- plot + ggtitle("Game of throne Viewership per episode by Season ")+
               scale_x_discrete("Episode number",labels=c("1", "2", "3","4", "5", "6","7", "8", "9","10"))+
               scale_y_continuous("Numer of U.S viewers in millions",breaks=seq(0,12,1))+
               scale_colour_discrete(name="")


plot<- plot + theme(plot.title = element_text(face="bold"),
                     panel.background = element_rect(fill = "white",colour = "grey"),
                     panel.grid.major = element_line(colour = "grey",size=0.1),
                     panel.grid.minor = element_line(colour = "grey",size=0.1))





