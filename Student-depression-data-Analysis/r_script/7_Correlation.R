# Level 7: Correlation

# =======================================================
# Q1: Correlation: Work/Study Hours vs Study Satisfaction
# =======================================================
cor_work_study_hours_study_satisfaction <- cor(data$work_study_hours, data$study_satisfaction, method = "pearson")
print(paste("Correlation between Work/Study Hours and Study Satisfaction: ", cor_work_study_hours_study_satisfaction))

# Visualization: Correlation Plot
library(ggplot2)

# Scatter Plot with Correlation Line - Visualizing linear relationship between Work/Study Hours and Study Satisfaction
ggplot(data, aes(x = work_study_hours, y = study_satisfaction)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Correlation: Work/Study Hours vs Study Satisfaction", x = "Work/Study Hours", y = "Study Satisfaction") +
  theme_minimal()



# =================================================
# Q2: Correlation: Study Satisfaction vs Depression
# =================================================

cor_study_satisfaction_depression <- cor(data$study_satisfaction, data$depression, method = "pearson")
print(paste("Correlation between Study Satisfaction and Depression: ", cor_study_satisfaction_depression))

# Scatter Plot with Correlation Line
ggplot(data, aes(x = study_satisfaction, y = depression)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Correlation: Study Satisfaction vs Depression", x = "Study Satisfaction", y = "Depression") +
  theme_minimal()



# =================================================
# Q3: Correlation: Work/Study Hours vs Total Stress
# =================================================

# Step 1: Calculate Pearson Correlation
cor_work_study_hours_total_stress <- cor(data$work_study_hours, data$total_stress, method = "pearson")

# Step 2: Print Correlation
print(paste("Correlation between Work/Study Hours and Total Stress: ", cor_work_study_hours_total_stress))

# Step 3: Visualization with Scatter Plot and Regression Line
library(ggplot2)
ggplot(data, aes(x = work_study_hours, y = total_stress)) +
  geom_point(color = "blue", alpha = 0.6) +   # Scatter points
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Linear regression line
  labs(title = "Scatter Plot: Work/Study Hours vs Total Stress",
       x = "Work/Study Hours",
       y = "Total Stress") +
  theme_minimal()



# ====================================
# Q4: Correlation: Age vs Total Stress
# ====================================

# Step 1: Calculate Pearson Correlation
correlation_age_total_stress <- cor(data$age, data$total_stress, method = "pearson")

# Step 2: Print Correlation
print(paste("Correlation between Age and Total Stress:", correlation_age_total_stress))

# Step 3: Visualization with Scatter Plot and Regression Line
ggplot(data, aes(x = age, y = total_stress)) +
  geom_point(color = "blue", alpha = 0.6) +   # Scatter points
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Linear regression line
  labs(title = "Scatter Plot: Age vs Total Stress",
       x = "Age",
       y = "Total Stress") +
  theme_minimal()
