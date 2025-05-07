# Level 8: ANOVA

# ==========================================================================================
# Q1: ANOVA : Is there a significant difference in Total Stress across different CGPA Groups
# ==========================================================================================

# Step 1: Perform ANOVA to check the relationship between CGPA Groups and Total Stress
anova_result <- aov(total_stress ~ cgpa_group, data = data)

# Step 2: Print the ANOVA summary
summary(anova_result)

# Step 3: Visualization - Boxplot of Total Stress by CGPA Groups
library(ggplot2)
ggplot(data, aes(x = cgpa_group, y = total_stress, fill = cgpa_group)) +
  geom_boxplot() +
  labs(title = "Boxplot: Total Stress vs CGPA Group", x = "CGPA Group", y = "Total Stress") +
  theme_minimal()



# ============================================================================================
# Q2: ANOVA: Is there a significant difference in Total Stress across different Dietary Habits
# ============================================================================================

# Step 1: Perform ANOVA
anova_dietary_stress <- aov(total_stress ~ dietary_habits, data = data)

# Step 2: Print ANOVA Summary
summary(anova_dietary_stress)

# Step 3: Visualization - Boxplot of Total Stress by Dietary Habits
library(ggplot2)
ggplot(data, aes(x = dietary_habits, y = total_stress, fill = dietary_habits)) +
  geom_boxplot() +
  labs(title = "Boxplot: Total Stress vs Dietary Habits",
       x = "Dietary Habits",
       y = "Total Stress") +
  theme_minimal()



# =================================================================================
# Q3: Two-Way ANOVA: Does Total Stress depend on Sleep Duration and Dietary Habits?
# =================================================================================

# Step 1: Perform Two-Way ANOVA
two_way_anova <- aov(total_stress ~ sleep_duration * dietary_habits, data = data)

# Step 2: Print ANOVA Summary
summary(two_way_anova)

# Step 3: Visualization - Interaction Boxplot
library(ggplot2)
ggplot(data, aes(x = sleep_duration, y = total_stress, fill = dietary_habits)) +
  geom_boxplot(position = position_dodge(0.8)) +
  labs(title = "Two-Way ANOVA: Total Stress by Sleep Duration and Dietary Habits",
       x = "Sleep Duration",
       y = "Total Stress",
       fill = "Dietary Habits") +
  theme_minimal()




# =================================================================================
# Q4: Two-Way ANOVA: Does Study Satisfaction depend on CGPA Group and Degree?
# =================================================================================

# Step 1: Perform Two-Way ANOVA
two_way_anova <- aov(study_satisfaction ~ cgpa_group * degree, data = data)

# Step 2: Print ANOVA Summary
summary(two_way_anova)

# Step 3: Visualization - Interaction Boxplot
ggplot(data, aes(x = cgpa_group, y = study_satisfaction, fill = degree)) +
  geom_boxplot(position = position_dodge(0.8)) +
  labs(title = "Study Satisfaction by CGPA Group and Degree", x = "CGPA Group", y = "Study Satisfaction") +
  theme_minimal()



# =========
# Pair Plot
# =========
library(GGally)

# Step 1: Create grouping
data$depression_group <- ifelse(data$depression == 1, "Depressed", "Not Depressed")

# Step 2: Plot
ggpairs(
  data,
  columns = c("depression", "total_stress", "cgpa", "study_satisfaction"),
  aes(color = depression_group),
  title = "Pairs Plot with Depression Group Coloring"
)



