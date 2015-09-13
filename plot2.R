## set the working directory
setwd("D:/0 Data Science/4 explorary data analysis/projcet")
Sys.setlocale("LC_TIME", "English") ##solve "thu" ,not "周四"的问题

##read data
library(readr)
ele<-read_csv2("household_power_consumption.txt")
ele2<-ele[which(ele$Date=="1/2/2007" | ele$Date=="2/2/2007"),]##选入观测
str(ele2)

##转换时间格式
##难点：连接两个时间点的 字符运算，然后将日期和时间联系在一起
ele2$t<-strptime(paste(ele2$Date,ele2$Time,sep=" "),
                 format="%d/%m/%Y %H:%M:%S")##注意分隔号

##plot
plot(ele2$t,ele2$Global_active_power,type="l",main="",xlab="",
     ylab="Global Active Power(kilowatts)")

##save png
dev.copy(png,file="plot2.png",width=480, height=480)
dev.off()


