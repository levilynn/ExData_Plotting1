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
ele2$t<-strptime(paste(ele2$Date,ele2$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")##注意分隔符号

##分区
png("plot4.png",width=480, height=480)
par(mfrow = c(2, 2), mar = c(4,4,4,4))
##plot
plot(ele2$t,ele2$Global_active_power,type="l",main="",xlab="",
     ylab="Global Active Power")

plot(ele2$t,ele2$Voltage,type="l",main="",xlab="datetime",
     ylab="Voltage")

plot(ele2$t,ele2$Sub_metering_1,type="l",main="",xlab=""
     ,ylab="Energy sub metering")
lines(ele2$t,ele2$Sub_metering_2,type="l",col="red")
lines(ele2$t,ele2$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),bty="n",cex=0.6)

plot(ele2$t,ele2$Global_reactive_power,type = "l",
     xlab="datetime",ylab ="Global_reactive_power")

##save png
##dev.copy(png,file="plot4.png",width=480, height=480)
dev.off()


