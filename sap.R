setwd("~/Projects/pburkholder/Rstocks")
# Citation: Samuel H. Williamson, 'Daily Closing Value of the Dow Jones Average, 1885 to Present,' MeasuringWorth, 2016. 
# z
# convert to unix witih
#   tail +2 DJA.csv | dos2unix -c mac > fixed.csv
sap <- read.csv('SAP_1916-2015.csv')

# remove commas as thousands seperator: 
#  http://www.mail-archive.com/r-help@r-project.org/msg62848.html
col2cvt <- c("ave","accum")
for (i in col2cvt){
    sap[[i]] <- as.numeric(gsub(",", "", sap[[i]]))
}
x

growth_over <- function(x, start=1916, skip=17) {
    
    start_accum <- as.numeric(sap[ which(sap$Year==start ), 4])
    end = start+skip
    end_accum <- as.numeric(sap[ which(sap$Year==end), 4])
    
    return <- ( end_accum - start_accum )/start_accum 

    arr = ((1 + return)**(1/skip) -1)
    x <- c(start,end,return,arr*100)
    x
}

gen_arrs <- function(x = sap,start=1916,step=16) {
    
    end <- (tail(x,n=1)$Year - step )
    
    result <- lapply(start:end, function(y) {
      growth_over(x, y, step)
      }
    )
    arrs <- simplify2array(result)[4,]
}

print("1916 in 16 year roll forward\n")
print(summary(gen_arrs()))

print("1932 in 16 year chungs for 5%, 10%, 20%, 50% and 90% quantiles")
x<-gen_arrs(sap, 1932, 16)
print(quantile(x, c(.05,.10,.20,.50,.90)))

