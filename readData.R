get.power.consumption <- function(filename)
{
    # Read just the column names
    data <- read.table(filename, header=TRUE, sep=';', nrows=1)
    # Read only data for 2007-02-01 and 2007-02-02
    # NOTE: needs the grep command, probably won't work on Windows!
    # See [https://class.coursera.org/exdata-032/forum/thread?thread_id=5#post-32 Reading data only for the required dates]
    grepped <- paste('grep "^[1-2]/2/2007"', filename)
    data <- read.table(pipe(grepped), header=FALSE, sep=';',
                       col.names=names(data),
                       na.strings='?', comment.char='', stringsAsFactors=FALSE,
                       colClasses=c('character','character',
                                    'numeric','numeric','numeric',
                                    'numeric','numeric','numeric','numeric'))
    # calculate DateTime from date and time columns 
    data$DateTime <- as.POSIXct(strptime(paste(data$Date,data$Time),
                                        "%d/%m/%Y %H:%M:%S"))
    # Return data frame
    data
}
