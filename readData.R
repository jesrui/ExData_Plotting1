get.power.consumption <- function(filename)
{
    # specifying how many rows to read speeds up the reading process
    numrows <- 2075259
    #numrows <- 20
    data <- read.table(filename, header=TRUE, nrows=numrows, sep=';',
                    na.strings='?', comment.char='', stringsAsFactors=FALSE,
                    colClasses=c('character','character',
                                    'numeric','numeric','numeric',
                                    'numeric','numeric','numeric','numeric'))
    # calculate DateTime from date and time columns 
    data$DateTime <- as.POSIXct(strptime(paste(data$Date,data$Time),
                                        "%d/%m/%Y %H:%M:%S"))

    # Return only data for 2007-02-01 and 2007-02-02
    data[data$DateTime >= as.POSIXct('2007-02-01') &
                data$DateTime < as.POSIXct('2007-02-03'), ]
}
