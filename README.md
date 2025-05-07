# Student Depression Analysis using R

This project aims to analyze the level of depression among students using R programming. The goal is to identify key stress factors and build models to understand and predict depression using various statistical techniques.

## 📌 Objectives

- Clean and prepare the student depression dataset.
- Explore the data using summary statistics and visualizations.
- Identify main stress factors (academic, financial, family, etc.).
- Group and compare depression levels based on CGPA, age, gender, and degree.
- Create new insights like `Total_Stress` and `Depression_Status`.
- Perform correlation and ANOVA analysis.
- Build regression models (simple, multiple, polynomial) to predict depression.

## 📊 Techniques Used

- **Data Cleaning**: `dplyr`, `tidyr`, `readr`
- **Exploratory Data Analysis**: `summary()`, `group_by()`, `mutate()`, `filter()`
- **Visualization**: `ggplot2` for bar plots, scatter plots, boxplots
- **Correlation Analysis**: `cor()`, correlation plots
- **ANOVA**: One-way ANOVA to test group differences
- **Regression Models**:
  - Simple Linear Regression
  - Multiple Linear Regression
  - Polynomial Regression

## 📁 Project Structure

```
📦Student-depression-data-Analysis
┣ 📂r_script
┃ ┣ 📄1_cleaning.R
┃ ┣ 📄2_Analysis.R
┃ ┣ 📄3_Analysis.R
┃ ┣ 📄4_Analysis.R
┃ ┣ 📄5_Analysis.R
┃ ┣ 📄6_Regression.R
┃ ┣ 📄7_Correlation.R
┃ ┗ 📄8_ANOVA.R
┣ 📄Analyzing_Student_Depression_...
┣ 📄Depression .pdf
┣ 📄student depression.csv
┗ 📄README.md
```

## 📌 Key Insights

- High academic and financial stress lead to higher depression rates.
- Students with lower CGPA showed more signs of depression.
- Female students and certain degrees reported slightly higher depression.
- Suicidal thoughts are strongly linked with high stress and low CGPA.
- Regression models were effective in predicting depression based on stress scores.

## 📦 Requirements

- R (version 4.0 or above)
- RStudio
- Required libraries: `dplyr`, `ggplot2`, `tidyr`, `readr`, `stats`, `car`

Install them using:

```r
install.packages(c("dplyr", "ggplot2", "tidyr", "readr", "car"))
```

## 📬 Contact

**Aditya Kumar Yadav**  
📧 adityadav757@gmail.com  
📍 Ballia, Uttar Pradesh  
🎓 BCA Student, LPU Punjab  

---

Feel free to fork or contribute to improve this project!

