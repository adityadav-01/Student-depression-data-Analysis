#Level 3: Grouping & Summarization

#==================================================================================
# 8: Group data by Age and calculate percentage of depressed students in each group
#==================================================================================
age_group_depression <- data %>%
  group_by(Age) %>%
  summarise(
    total_students = n(),
    depressed_students = sum(Depression),
    percentage_depressed = (depressed_students / total_students) * 100
  )

# Print result
print(age_group_depression)

#==========================================================================
# 9: Relationship between CGPA and depression by grouping students into CGPA
#===========================================================================
# Create CGPA Groups
data <- data %>%
  mutate(CGPA_Group = cut(CGPA, 
                          breaks = c(-1, 4, 7, 10), 
                          labels = c("0-4", "5-7", "8-10"), 
                          right = TRUE))

# Calculate total students and depressed students per CGPA group
cgpa_depression_summary <- data %>%
  group_by(CGPA_Group) %>%
  summarise(
    Total_Students = n(),
    Total_Depressed = sum(Depression == 1, na.rm = TRUE),
    Percentage_Depressed = (Total_Depressed / Total_Students) * 100
  )

# Print result
print(cgpa_depression_summary)

#======================================================================
# 10: Which degree program has the highest number of depressed students
#======================================================================

# Group by Degree and calculate depression stats
degree_depression <- data %>%
  group_by(Degree) %>%
  summarise(
    Total_Students = n(),
    Depressed_Students = sum(Depression == 1, na.rm = TRUE),
    Percentage_Depressed = (Depressed_Students / Total_Students) * 100
  ) %>%
  arrange(desc(Percentage_Depressed))  # Sort by highest depression percentage

# Show the result
View(degree_depression)

