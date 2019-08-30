
##Example already available on rpubs . I have included comparison with / withot adstock

library(bayesm)
cheese<-as.data.frame(data("cheese"))
summary(cheese)
data("cheese")


library(dplyr)
library(stats)
adstockTransform <- function(x){
  stats::filter( 1/(1+exp(-2*x)), 0.25, method = "recursive")
}


#with actual data
mmm.data0 <- cheese %>% filter(RETAILER == 'CHICAGO - DOMINICK') %>%
  select(-RETAILER) %>% 
  mutate(log.volume = (VOLUME), log.price = (PRICE), adstock=(DISP)) %>%
  select(-VOLUME, -DISP, -PRICE)

fit0 <- lm(log.volume ~ adstock + log.price, data=mmm.data0)
summary(fit0)


mmm.data1 <- cheese %>% filter(RETAILER == 'CHICAGO - DOMINICK') %>%
  select(-RETAILER) %>% 
  mutate(log.volume = log(VOLUME), log.price = log(PRICE), adstock= adstockTransform(DISP)) %>%
  select(-VOLUME, -DISP, -PRICE)

fit1 <- lm(log.volume ~ adstock + log.price, data=mmm.data1)
summary(fit1)


#with actual Ad variable with without decay
mmm.data2 <- cheese %>% filter(RETAILER == 'CHICAGO - DOMINICK') %>%
  select(-RETAILER) %>% 
  mutate(log.volume = log(VOLUME), log.price = log(PRICE), adstock=(DISP)) %>%
  select(-VOLUME, -DISP, -PRICE)

fit2 <- lm(log.volume ~ adstock + log.price, data=mmm.data2)
summary(fit2)

#After checking the ACF and PACF of log.volume to ensure stationarity and independence, we fit a linear model

acf(mmm.data$log.volume)
fit <- lm(log.volume ~ adstock + log.price, data=mmm.data)
summary(fit)


#Ad stock rate-- at what rate exposure is decaying
#Adstock--what is the impact of week 1 on week2 with a adstock
#for exapmle idf a company continues to add till week 5 and stop then in th sales of week 6,onewards as well we see impact.


##in the above explame we have studied Promotion,Price
#Adstock rate is a measurement of the advertising decay effect.
#Advertising adstock is a term used to measure the memory effect of advertising carried over from start of advertising.
#For example, if a company advertises at a certain level in week 1, week 2 will have a portion of week 1 level. 
#Week 3, in turn, will have a portion of week 2 level. 
#In other words, adstock is a percentage term that measures the decaying effect of advertising throughout the weeks.



#Filter function is basicaaly applying the adstock rate and do forward calcution.like excel

