# Level 2: Identifying Patterns

#=======================================
# 5: Find the most common stress factors
#=======================================

# Mean calculation with NA handling
financial_stress_mean <- mean(data$`Financial Stress`, na.rm = TRUE)
academic_pressure_mean <- mean(data$`Academic Pressure`, na.rm = TRUE)

# Comparison using if-else
if (academic_pressure_mean > financial_stress_mean) {
  print("Academic pressure is higher than financial stress for depression")
} else if (financial_stress_mean > academic_pressure_mean) {
  print("Financial stress is higher than academic pressure for depression")
} else {
  print("Both academic pressure and financial stress are equal for depression")
}

#=================================
# 6: List students with depression
#=================================

students_with_depression <- data %>% filter(Depression == 1)
head(students_with_depression)


#===================================================
# 7: Identify students with low CGPA and depression
#===================================================

# Total depressed students with CGPA below average
low_performance_depressed <- data %>%
  filter(CGPA < mean(CGPA) & Depression == 1)%>%
  nrow()

# Total students with CGPA below average
low_cgpa_students <- data %>%
  filter(CGPA < mean(CGPA)) %>%
  nrow()

# Calculate percentage
percentage_low_cgpa_depressed <- (low_performance_depressed / low_cgpa_students) * 100

# Print result
print(paste("Percentage of students with low CGPA who are depressed:", round(percentage_low_cgpa_depressed, 2), "%"))


