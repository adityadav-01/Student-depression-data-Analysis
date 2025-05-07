# Level 6: Regression 

# =======================================================================
# Q1: Simple Linear Regression : Total_Stress based on Study Satisfaction
# =======================================================================

# Load required library for plotting
library(ggplot2)

# Step 1: Build the regression model: Total_Stress ~ Study_Satisfaction
stress_model <- lm(total_stress ~ study_satisfaction, data = data)

# Step 2: View model summary
summary(stress_model)

# Step 3: Create new Study Satisfaction values for prediction
new_data_stress <- data.frame(study_satisfaction = c(1, 2, 3, 4, 5))

# Step 4: Predict Total_Stress using the model
new_data_stress$predicted_stress <- predict(stress_model, newdata = new_data_stress)

# Step 5: Print predictions
print("Predicted Total Stress:")
print(new_data_stress)

# Step 6: Visualization - Actual data, regression line, and predicted points
ggplot(data, aes(x = study_satisfaction, y = total_stress)) +
  geom_point(alpha = 0.4, color = "blue") +  # Blue points for actual data
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Red regression line
  geom_point(data = new_data_stress, aes(x = study_satisfaction, y = predicted_stress),
             color = "darkgreen", size = 3) +  # Dark green points for predicted data
  labs(title = "Regression: Total Stress vs Study Satisfaction",
       x = "Study Satisfaction",
       y = "Total Stress") +
  theme_minimal()  # Apply minimal theme for clean look



# =================================================================================
# Q2: Simple Linear Regression : Predicting Depression Score using Work/Study Hours
# =================================================================================

# Load required library for plotting
library(ggplot2)

# Step 1: Build the regression model: Depression ~ Work/Study Hours
depression_model <- lm(depression ~ work_study_hours, data = data)

# Step 2: View model summary
summary(depression_model)

# Step 3: Create new Work/Study Hours values for prediction
new_data_depression <- data.frame(work_study_hours = c(5, 10, 15, 20, 25))

# Step 4: Predict Depression using the model
new_data_depression$predicted_depression <- predict(depression_model, newdata = new_data_depression)

# Step 5: Print predictions
print("Predicted Depression based on Work/Study Hours:")
print(new_data_depression)

# Step 6: Visualization - Actual data, regression line, and predicted points
ggplot(data, aes(x = work_study_hours, y = depression)) +
  geom_point(alpha = 0.4, color = "blue") +  # Blue points for actual data
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Red regression line
  geom_point(data = new_data_depression, aes(x = work_study_hours, y = predicted_depression),
             color = "darkgreen", size = 3) +  # Dark green points for predicted data
  labs(title = "Regression: Depression vs Work/Study Hours",
       x = "Work/Study Hours",
       y = "Depression") +
  theme_minimal()  # Apply minimal theme for clean look



# ==================================================================================
# Q3: Multiple Linear Regression : Depression ~ Academic Pressure + Financial Stress
# ==================================================================================

# Step 1: Corrected model
depression_model_multi <- lm(depression ~ academic_pressure + financial_stress, data = data)

# Step 2: Summary
summary(depression_model_multi)

# Step 3: New data for prediction (total_stress removed)
new_data_depression_multi <- data.frame(
  academic_pressure = c(6, 8, 10, 12, 14),
  financial_stress = c(5, 6, 7, 8, 9)
)

# Step 4: Predict Depression
new_data_depression_multi$predicted_depression <- predict(depression_model_multi, newdata = new_data_depression_multi)

# Step 5: Print predictions
print("Predicted Depression based on Academic Pressure and Financial Stress:")
print(new_data_depression_multi)

# Step 6: Visualization (Separate lines for academic_pressure and financial_stress)
library(tidyr)

# Convert for plotting
data_long <- data %>%
  gather(key = "Predictor", value = "Value", academic_pressure, financial_stress)

ggplot(data_long, aes(x = Value, y = depression, color = Predictor)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression: Depression vs Academic Pressure & Financial Stress",
       x = "Predictor Values",
       y = "Depression") +
  theme_minimal() +
  scale_color_manual(values = c("red", "blue"))



# ==============================================================
# Q4: Polynomial Regression : Study Satisfaction vs Total Stress
# ==============================================================

# Load required libraries
library(ggplot2)

# Step 1: Build the polynomial regression model (2nd degree polynomial)
polynomial_model <- lm(total_stress ~ poly(study_satisfaction, 2), data = data)

# Step 2: View model summary
summary(polynomial_model)

# Step 3: Create new data for prediction (you can customize the values)
new_data_polynomial <- data.frame(study_satisfaction = seq(1, 5, by = 0.1))

# Step 4: Predict Total Stress using the polynomial model
new_data_polynomial$predicted_stress <- predict(polynomial_model, newdata = new_data_polynomial)

# Step 5: Print predictions
print("Predicted Total Stress (Polynomial Regression):")
print(new_data_polynomial)

# Step 6: Visualization - Actual data, polynomial regression curve, and predicted points
ggplot(data, aes(x = study_satisfaction, y = total_stress)) +
  geom_point(alpha = 0.4, color = "blue") +  # Blue points for actual data
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "red") +  # Polynomial regression line
  labs(title = "Polynomial Regression: Total Stress vs Study Satisfaction",
       x = "Study Satisfaction",
       y = "Total Stress") +
  theme_minimal()  # Apply minimal theme for clean look








#=================================================================================================

# Polynomial Regression Model (Degree 2: Quadratic)
model_poly <- lm(total_stress ~ study_satisfaction + I(study_satisfaction^2), data = data)

# Summary of the model
cat("Summary of Polynomial Regression (Total Stress vs Study Satisfaction):\n")
summary(model_poly)

# Scatter plot of Study Satisfaction vs Total Stress
plot(data$study_satisfaction, data$total_stress,
     col = "lightblue",
     pch = 16,
     main = "Polynomial Regression: Total Stress vs Study Satisfaction",
     xlab = "Study Satisfaction",
     ylab = "Total Stress")

# Add the polynomial regression curve
x_seq <- seq(min(data$study_satisfaction, na.rm=TRUE), max(data$study_satisfaction, na.rm=TRUE), length=100)
y_pred <- predict(model_poly, newdata = data.frame(study_satisfaction = x_seq))
lines(x_seq, y_pred, col = "red", lwd = 2)

