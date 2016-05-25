setwd("~/Documents/DataScience/stocks")
# Citation: Samuel H. Williamson, 'Daily Closing Value of the Dow Jones Average, 1885 to Present,' MeasuringWorth, 2016. 
# https://measuringworth.com/DJA/
# convert to unix witih
#   tail +2 DJA.csv | dos2unix -c mac > fixed.csv
dja <- read.csv('fixed.csv')

dja$isodate <- strptime(dja$Date, "%m/%d/%Y")
dja$year <- as.numeric(format(dja$isodate, "%Y"))
byyear <- split(dja, dja$year)
openByYear <- lapply(byyear, "[", 1, )

growth_over <- function(x, start=1, skip=17) {
    return = ((x[[start+skip]][2] - x[[start]][2])/x[[start]][2])
    # g is the return
    
    arr = ((1 + return)**(1/skip) -1)
    unlist(list(year=x[[start]]$year, per_return=return, arr=arr*100))
    
}

result <- lapply(1:84, function(x) {
    growth_over(openByYear, x, 16)
})

