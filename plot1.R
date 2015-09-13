## set the working directory
setwd("D:/0 Data Science/4 explorary data analysis/projcet")

##read data
library(readr)
ele<-read_csv2("household_power_consumption.txt")
ele2<-ele[which(ele$Date=="1/2/2007" | ele$Date=="2/2/2007"),]##选入观测
str(ele2)

##转换时间格式
ele2$Date<-strptime(ele2$Date,format="%d/%m/%Y")##注意分隔符号
ele2$Time<-strptime(ele2$Time,format="%H:%M:%S")##注意分隔符号

##plot
hist(ele2$Global_active_power,main="Global Active Power",
     xlab="Global Active Power(kilowatts)",col="red")

##save png
dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()


