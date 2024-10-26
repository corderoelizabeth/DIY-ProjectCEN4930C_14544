# Load necessary packages
library(ggplot2)

# Load the data
data <- read.csv("data.csv")
data_melted <- read.csv("data_melted.csv")

# Create scatter plot of Productivity vs Social Media usage
ggplot(data, aes(x = Social_Media, y = Productivity)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, color = "blue") +
  labs(title = "Productivity vs. Social Media Usage",
       x = "Time on Social Media (hours)",
       y = "Productivity Rating")

# Create line plot for Productivity and Social Media Usage Over Time
ggplot(data_melted, aes(x = Timestamp, y = value, color = variable)) +
  geom_line() +
  labs(title = "Productivity and Social Media Usage Over Time",
       x = "Date", y = "Value")

# Calculate correlation between Productivity and Social Media usage
correlation <- cor(data$Productivity, data$Social_Media, use = "complete.obs")
print(paste("Correlation between Productivity and Social Media usage:", correlation))

# Simple linear regression: Productivity ~ Social_Media
model <- lm(Productivity ~ Social_Media, data = data)

# Summary of the regression model
model_summary <- summary(model)
print(model_summary)

# Save the last plot as a PDF
ggsave("Rplot.pdf")
