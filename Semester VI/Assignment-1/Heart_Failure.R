library(distill)
library(dplyr)
library(readr)
library(tidyverse)
library(knitr)

Df0<- read.csv('heart-Failure-dataset',TRUE,',',na.strings = "N/A")
class(Df0)
colnames(Df0)

dim(Df0)

AdultHD<- filter(Df0, age>=18) #age 0-17
AdultHD1<-select(AdultHD,-c(id))  #eliminate id col
kable(head(AdultHD1), format = "markdown", digits = 2)

Df1<-mutate(AdultHD1, heart_disease = recode(heart_disease, `1` = "Yes", `0` = "No")) 

Df1 %>%
  count(heart_disease, sort = TRUE) %>%
  head(4)

ggplot(Df1, aes(x =gender, fill= hypertension))+
  geom_bar() + 
  labs(x="Gender", y = "No. of Hypertension Patients", 
       title = "Hypertension Patient Count by gender")

ggplot(Df1, aes(x=age, fill=heart_disease))+
  geom_bar()+
  labs(x="Age of Patients", y="Number of Patients", 
       title = " More elderly patients (age >65) have heart disease than younger patients ")

Df1 %>%
  mutate(Df1, heart_disease = recode(heart_disease, `1` = "Yes", `0` = "No")) %>%
  mutate(Df1, hypertension = recode(hypertension, `1` = "Yes", `0` = "No")) %>%
  count(heart_disease,hypertension, sort = TRUE) %>%
  head(4)

ggplot(Df1, aes(x=age, fill=heart_disease))+
  geom_histogram(binwidth = 5)+
  facet_wrap(vars(heart_disease,hypertension))+
  labs(x="Age of Patients", y="Number of Patients", 
       title = "There are 64 Patients with Heart Disease AND Hypertension")

Df1 %>%
  mutate(Df1, heart_disease = recode(heart_disease, `1` = "Yes", `0` = "No")) %>%
  mutate(Df1, stroke = recode(stroke, `1` = "Yes", `0` = "No")) %>%
  count(heart_disease,stroke, sort = TRUE) %>%
  head(4)

ggplot(Df1, aes(x=age, fill=heart_disease))+
  geom_histogram(binwidth = 5)+
  facet_wrap(vars(heart_disease,hypertension))+
  labs(x="Age of Patients", y="Number of Patients", 
       title = "There are 47 Patients with Heart Disease AND Stroke")

Df1 %>%
  count(heart_disease, smoking_status, sort = TRUE) %>%
  head(8)

ggplot(Df1, aes(x=age, fill=smoking_status))+
  geom_histogram(binwidth = 5)+
  facet_wrap(vars(smoking_status,heart_disease))+
  labs(x="Age", y="Number of Patients", title = 
         "Former Smokers with Heart Disease (n=77) vs Current Smokers with Heart Disease (n=61)")

ggplot(Df1, aes(x = age, y = avg_glucose_level)) +
  geom_point(color=7) + 
  geom_smooth(method = "lm") +
  labs(x="Age", y="Ave Glucose Level", title = "Average Glucose Level INCREASES with Age")

ggplot(Df1, aes(x = age, y = bmi, color=bmi)) +
  geom_boxplot(outlier.colour="blue", outlier.shape=8,
               outlier.size=4) + 
  geom_smooth(method = "lm",colour = 1) +
  labs(x="Age", y="BMI", title = "Age and BMI (used jitter to show distribution)")









#Aniket_RA2011026020074
#Aniket_RA2011026020074
#Aniket_RA2011026020074
