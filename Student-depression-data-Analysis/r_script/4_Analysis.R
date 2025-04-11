#Level 4: Ranking & Comparison

#======================================================
# 11: Rank students based on CGPA and Depression levels
#======================================================

ranked_data <- data %>%
  # Rank based on CGPA (higher CGPA = better rank)
  mutate(CGPA_Rank = dense_rank(desc(CGPA))) %>%
  # Arrange by Depression (1 first) and CGPA_Rank
  arrange(desc(Depression), CGPA_Rank) %>%
  # Assign final ranking
  mutate(Final_Rank = row_number())

# Select relevant columns
ranked_students <- ranked_data %>%
  select(id, CGPA, CGPA_Rank, Depression, Final_Rank)

# Print top 10 ranked students
print(head(ranked_students, 10))

#=================================================================================
# 12: What is the count and percentage of depression cases among males and females
#=================================================================================
# Count of depression cases by gender
table(data$Gender, data$Depression)

# Percentage of depression in each gender
prop.table(table(data$Gender, data$Depression)) * 100

#================================================================
# 13: Count and percentage of depressed students by dietary habit
#================================================================

dietary_depression <- data %>%
  group_by(`Dietary Habits`, Depression) %>%
  summarise(count = n(), .groups = "drop") %>%
  mutate(Percentage = (count / sum(count)) * 100)

# Print result
print(dietary_depression)

#======================================================
# 14: Who are depressed have also had suicidal thoughts
#======================================================

suicidal_depressed <- data %>%
  filter(Depression == 1, `Have you ever had suicidal thoughts ?` == "Yes") %>%
  summarise(count = n())

print(suicidal_depressed)

