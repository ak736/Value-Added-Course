# Data visualization
count<-table(mtcars$gear)
View(count)
plot(count)

barplot(count)
barplot(count, horiz=TRUE)
barplot(count, main="sample bar plot",
        xlab = "Improvement",
        ylab = "Frequecy",
        legend = rownames(count),
        col=c("red","yellow","green"))

pie(count)

#Let us try line, scatter and box plot
salary<-read.csv("salary_data.csv")
view(salary)

install.packages("ggplot2")
library(ggplot2)

ggplot(salary,aes(x=Experience,y=salary))+
  geom_point()
ggplot(salary,aes(x=Experience,y=salary))+
  geom_line()
ggplot(salary,aes(x=Experience,y=salary))+
  geom_boxplot   