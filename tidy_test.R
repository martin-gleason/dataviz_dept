seps <- read_csv("http://www.mm-c.me/mdsi/hospitals93to98.csv")

View(seps)
inprogress<-gather(seps,year,value,FY1993:FY1998)

View(inprogress)

rearranged <- spread(inprogress,Field,value)

View(rearranged)
