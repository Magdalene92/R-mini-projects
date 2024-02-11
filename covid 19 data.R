library(Hmisc)
data <- read_csv("C:/Users/Magda/Downloads/COVID19_line_list_data.csv")
describe(data)
data$death_dummy <- as.integer(data$death != 0)
sum(data$death_dummy) / nrow(data)

# Age
# claim: people who die are older
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)

# is this statistically significant? 
t.test(alive$age, dead$age, alternative= "two.sided", conf.level = 0.95)
# normally, if p-value < 0.05, we reject null hypothesis 
# here, p-value ~ 0, so we reject the null hypothesis, so this is statistically significant


# GENDER
# claim: gender has no effect 
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)

# is this statistically significant? 
t.test(men$death_dummy, women$death_dummy, alternative= "two.sided", conf.level = 0.95)
# normally, if p-value < 0.05, we reject null hypothesis 
# here, p-value ~ 0, so we reject the null hypothesis, so this is statistically significant
# men have higher chance of dying


# Boxplot for age comparison
boxplot(age ~ death_dummy, data = data, xlab = "Death", ylab = "Age", main = "Age vs Death")

# Barplot for gender comparison
barplot(table(data$gender, data$death_dummy), beside = TRUE, legend = TRUE,
        col = c("lightblue", "lightgreen"), names.arg = c("Female", "Male"),
        main = "Gender vs Death")

install.packages("ggplot2")
library(ggplot2)


# Boxplot using ggplot2
ggplot(data, aes(x = factor(death_dummy), y = age, fill = factor(death_dummy))) +
  geom_boxplot() +
  labs(x = "Death", y = "Age", title = "Age vs Death")

# Barplot using ggplot2
ggplot(data, aes(x = gender, fill = factor(death_dummy))) +
  geom_bar(position = "dodge") +
  labs(x = "Gender", y = "Count", title = "Gender vs Death") +
  scale_fill_manual(values = c("red", "blue"))







