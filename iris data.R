# Install and load necessary packages
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}
library(tidyverse)

# Load a sample dataset (you can replace it with your own dataset)
data("iris")

# Explore the dataset
summary(iris)

# Create a scatter plot using ggplot2
scatter_plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(title = "Scatter Plot of Sepal Length vs. Sepal Width",
       x = "Sepal Length", y = "Sepal Width")
scatter_plot

#Create a boxplot for petal length by species
boxplot <- ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Petal Length by Species",
       x = "Species", y = "Petal Length")
boxplot 

# Create a histogram of petal width
histogram <- ggplot(iris, aes(x = Petal.Width, fill = Species)) +
  geom_histogram(binwidth = 0.2, position = "identity", alpha = 0.7) +
  labs(title = "Histogram of Petal Width by Species",
       x = "Petal Width", y = "Frequency")
histogram 

# Combine plots into a single layout
multi_plot <- cowplot::plot_grid(scatter_plot, boxplot, histogram, ncol = 2)
multi_plot

# Save the plots
ggsave("scatter_plot.png", plot = scatter_plot, width = 10, height = 8, units = "in")
ggsave("boxplot.png", plot = boxplot, width = 10, height = 8, units = "in")
ggsave("histogram.png", plot = histogram, width = 10, height = 8, units = "in")
ggsave("multi_plot.png", plot = multi_plot, width = 14, height = 10, units = "in")

