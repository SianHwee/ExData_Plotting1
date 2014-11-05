#read subset of data in

power_data<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=grep("31/1/2007;23:59:00;", readLines("household_power_consumption.txt")),nrows=2880, stringsAsFactors = FALSE)
row1<-read.table("household_power_consumption.txt", sep=";",nrow = 1,header = TRUE)   #read header row from txt file
colnames<-colnames(row1)
colnames(power_data)<-colnames # assign colnames to power_data
power_data$Date<- as.Date(power_data$Date,format = "%d/%m/%Y")   #convert Date columns to Date
concat = paste(power_data$Date,power_data$Time,sep=' ')  #Merge Date and Time columns
totime = strptime(concat,"%Y-%m-%d %H:%M:%S")   #convert merged Date and Time into Date and Time variables

#plot3
png(filename = "plot3.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white",  res = NA)
plot(totime, power_data$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
points(totime,power_data$Sub_metering_2, type="l",col="red")
points(totime,power_data$Sub_metering_3, type="l", col ="blue")
legend("topright", lty=c(1,1),col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()