#
#   COursera Johns Hopkins Data Sci Sequence
#   Exploring Data
#   Week 1 Project 1
#   Plot from Electric Power Counsumption
#   Put this script in the directory with the data file. 
#   PRE:    install.packages('sqldf')
#   PRE:    library('sqldf')
#   PRE:    library(chron)
#   by JPR
#
#   Read the file household_power_consumption.txt

plot1 <- function() {
    #df<-read.csv.sql('household_power_consumption.txt', sep=';', sql="SELECT * FROM file WHERE (Date=='1/2/2007' OR Date=='2/2/2007')")
    df<-read.csv.sql('household_power_consumption.txt', sep=';', sql="SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007') ")
    dft<-df
    dft['Date']<-as.Date(df$Date, format='%d/%m/%Y')
    dft['Time']<-chron(times=df$Time)
    
    # plot1  histogram
    print(dev.cur())  # rstudio
    png('plot1.png', width=480, height=480)
    hist(df$Global_active_power, freq=T, 
         col='red', 
         xlab='Global Active Power (kilowatts)',
         main='Global Active Power')
    dev.off()       #close the file
    print(dev.cur())  # rstudio
}
