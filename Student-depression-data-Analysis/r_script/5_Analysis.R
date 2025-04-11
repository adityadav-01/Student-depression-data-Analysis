#Level 5: Creating New Insights

#=========================================
# 15: Add a new column "Depression_Status"
#=========================================

data <- data %>%
  mutate(Depression_Status = ifelse(Depression == 1, "Depressed", "No Depression"))
View(data)

#===================================
# 16: Create a "Total_Stress" column
#===================================

data <- data %>%
  mutate(Total_Stress = `Academic Pressure` + `Financial Stress`)
View(data)









#--------------------------------------------------------------------------------------------------

# Average and Maximum Total Stress per Degree
stress_by_degree <- data %>%
  group_by(Degree) %>%
  summarise(
    Average_Stress = mean(Total_Stress, na.rm = TRUE),
    Max_Stress = max(Total_Stress, na.rm = TRUE),
    Count = n()
  ) %>%
  arrange(desc(Average_Stress))  # Sort by highest average stress

print(stress_by_degree)
# Average and Maximum Total Stress per Age
stress_by_age <- data %>%
  group_by(Age) %>%
  summarise(
    Average_Stress = mean(Total_Stress, na.rm = TRUE),
    Max_Stress = max(Total_Stress, na.rm = TRUE),
    Count = n()
  ) %>%
  arrange(desc(Average_Stress))  # Sort by highest average stress

print(stress_by_age)

