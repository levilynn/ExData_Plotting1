## set the working directory
setwd("D:/0 Data Science/4 explorary data analysis/projcet")
Sys.setlocale("LC_TIME", "English") ##solve "thu" ,not "����"������

##read data
library(readr)
ele<-read_csv2("household_power_consumption.txt")
ele2<-ele[which(ele$Date=="1/2/2007" | ele$Date=="2/2/2007"),]##ѡ��۲�
str(ele2)

##ת��ʱ���ʽ
##�ѵ㣺��������ʱ���� �ַ����㣬Ȼ�����ں�ʱ����ϵ��һ��
ele2$t<-strptime(paste(ele2$Date,ele2$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")##ע��ָ�����

##
png("plot3.png",width=480, height=480)
##plot 

plot(ele2$t,ele2$Sub_metering_1,type="l",main="",xlab="",ylab="Energy sub metering)"
     ,margin=c(2,4,2,4))
lines(ele2$t,ele2$Sub_metering_2,type="l",col="red")
lines(ele2$t,ele2$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))


##save png
##legend ���ƺ�ͼ�������仯������ֱ��ʹ��png����,��ʾ��������
##dev.copy(png,file="plot3.png",width=480, height=480)
dev.off()