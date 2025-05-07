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


# Rename the columns 
colnames(data) <- c("id", "gender", "age", "city", "profession",
                    "academic_pressure", "cgpa", "study_satisfaction",
                    "sleep_duration", "dietary_habits", "degree",
                    "suicidal_thoughts", "work_study_hours",
                    "financial_stress", "mental_illness_history",
                    "depression", "cgpa_group", "depression_status",
                    "total_stress")
