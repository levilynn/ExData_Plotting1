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
ele2$t<-strptime(paste(ele2$Date,ele2$Time,sep=" "),
                 format="%d/%m/%Y %H:%M:%S")##ע��ָ���

##plot
plot(ele2$t,ele2$Global_active_power,type="l",main="",xlab="",
     ylab="Global Active Power(kilowatts)")

##save png
dev.copy(png,file="plot2.png",width=480, height=480)
dev.off()

