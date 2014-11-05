#read subset of data in

power_data<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=grep("31/1/2007;23:59:00;", readLines("household_power_consumption.txt")),nrows=2880, stringsAsFactors = FALSE)
row1<-read.table("household_power_consumption.txt", sep=";",nrow = 1,header = TRUE)   #read header row from txt file
colnames<-colnames(row1)
colnames(power_data)<-colnames # assign colnames to power_data
power_data$Date<- as.Date(power_data$Date,format = "%d/%m/%Y")   #convert Date columns to Date
concat = paste(power_data$Date,power_data$Time,sep=' ')  #Merge Date and Time columns
totime = strptime(concat,"%Y-%m-%d %H:%M:%S")   #convert merged Date and Time into Date and Time variables

#plot2
png(filename = "plot2.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white",  res = NA)
plot(totime,power_data$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()