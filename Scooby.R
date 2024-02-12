# Load necessary libraries
library(readr)
library(dplyr)
library(ggplot2)

# Step 0: Load Data
scoobydoo <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-13/scoobydoo.csv')

# Step 1: Data Exploration
str(scoobydoo)
summary(scoobydoo)

mean(scoobydoo$run_time)
mean(scoobydoo$imdb)
mean(scoobydoo$imdb, na.rm = TRUE)

filter(scoobydoo, imdb >= 8)
scoobydoo_network <- filter(scoobydoo, network == "CBS")


# Step 2: Data Cleaning
# No missing values in this case, so no cleaning needed.

# Step 3: Visualizations
# Histogram for run times
ggplot(scoobydoo, aes(x = run_time)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Scooby-Doo Episode Run Times",
       x = "Run Time (minutes)",
       y = "Frequency")

# Scatter plot for IMDb ratings and run times
ggplot(scoobydoo, aes(x = run_time, y = imdb)) +
  geom_point(color = "darkorange") +
  labs(title = "Scatter Plot of IMDb Ratings and Run Times",
       x = "Run Time (minutes)",
       y = "IMDb Rating")


# Step 4: Additional Exploration
# Visualize the distribution of IMDb ratings
ggplot(scoobydoo, aes(x = imdb)) +
  geom_histogram(binwidth = 0.5, fill = "purple", color = "black") +
  labs(title = "Distribution of Scooby-Doo IMDb Ratings",
       x = "IMDb Rating",
       y = "Frequency")

