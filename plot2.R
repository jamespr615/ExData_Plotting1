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

plot2 <- function() {
    
    #df<-read.csv.sql('household_power_consumption.txt', sep=';', sql="SELECT * FROM file WHERE (Date=='1/2/2007' OR Date=='2/2/2007')")
    df<-read.csv.sql('household_power_consumption.txt', sep=';', sql="SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007') ")
    dft<-df
    dft['Date']<-as.Date(df$Date, format='%d/%m/%Y')  
    dft['Time']<-chron(times=df$Time)
    dy<-weekdays(unique(dft[,1]))
    
    # plot2 
    print(dev.cur())  # rstudio
    png('plot2.png', width=480, height=480)
    #plot(df$Global_active_power, type='l', ylab='Global Active Power (kilowatts)',xaxt='n')
    plot(df$Global_active_power, type='l',ann=F, xaxt='n')
    title(ylab='Global Active Power (kilowatts)')
    tick<-length(dft$Date)
    axis(1,at=c(1,tick/2,tick),labels=c('Thu','Fri','Sat'))
    print(dev.cur())  # rstudio
    dev.off()

}
