####################### START OF WEATHER DATA PROJECT #################################

#############     Deliverable One    ############
#Setting working directory
setwd(".\\Weather Data")
getwd

#Reading data
CG = read.csv("Chicago-F.csv", row.names = 1)
HT = read.csv("Houston-F.csv", row.names = 1)
NY = read.csv("NewYork-F.csv", row.names = 1)
SF = read.csv("SanFrancisco-F.csv", row.names = 1)

#Check the excel files
CG
HT
NY
SF

#checking if they are data frames
is.data.frame(CG)

#Converting to matrix (because no need for df)
CG = as.matrix(CG)
NY = as.matrix(NY)
HT = as.matrix(HT)
SF = as.matrix(SF)

is.matrix(CG)

#Putting  all in a list (weather)
weather =list(CG = CG, NY = NY, HT = HT, SF = SF)
weather
weather[3]

#Using apply()
CG
apply(CG, 1, mean)
#checking
mean(CG["DaysWithPrecip",])

#Analysing data from Chicago
apply(CG, 1, max)
apply(CG, 1, min)

#Comparing cities
apply(CG, 1, mean)
apply(HT, 1, mean)
apply(NY, 1, mean)
apply(SF, 1, mean)

#Average high for the 4th quarter
sapply(weather, "[", 1, 10:12)
round(sapply(weather, rowMeans),2) #<< Deliverable 1

### Requirement of deliverable 1 ###

#######################v#########################

#Recreating the apply function with loops (advanced) shows difference between apply and loops
output = NULL
for(i in 1:5){
  output[i] = mean(CG[i,])
}

names(output) = rownames(CG)

#######################^##########################

#############     Deliverable two    ############

#Using lapply to to transpose all elements in weather list
CG
t(CG) #Transpossing CG
t_weather = lapply(weather, t) #Transpossing elements in weather (CG, HT, NY, SF)

lapply(weather, rowMeans) #Even better deliv 1

#Combining lapply with the [] operator
weather$CG[1,1]
lapply(weather,"[", 1, 1) #Highest avg temp for jan for all cities
lapply(weather, "[", 1,) #Highest avg temp for all months for all cities
lapply(weather, "[", , 3) #All vars for the month of march for all cities

#Adding my own function to lapply (deliverable 2)
lapply(weather, function(x) round((x[1,]-x[2,])/x[2,],2)) #Shows how much the average temperature fluctuates between the highest and lowest in percentage
sapply(weather, function(x) round((x[1,]-x[2,])/x[2,],2)) ## << Deliverable 2
### Deliverable 2 ###

#############     Deliverable three and four    ############

#Using sapply()
sapply(weather, "[",1,7) #Putting the values into a vector (instead of list)

#Nestling apply functions
apply(CG, 1, max)
#Apply across whole list
lapply(weather, apply, 1, max) 
lapply(weather, function(x) apply(x, 1, max) )#Same results as above but using functions
#tidying up
sapply(weather, apply, 1, max) #<< Deliverable 3
sapply(weather, apply, 1, min) #<< Deliverable 4

#############     Deliverable five    ############

#Finding out the months in which all the variables were maximum for the year for all cities
?which.max
which.max(CG[1,])
names(which.max(CG[1,]))
apply(CG, 1, function(x) names(which.max(x)))
sapply(weather, function(y) apply(y, 1, function(x) names(which.max(x)))) #<< Deliverable 5

####################### END OF WEATHER DATA PROJECT #################################






















