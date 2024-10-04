# Telecom-Customer-Churn-Analysis
This project aims to analyze and predict customer churn for a telecom company. The project involves data cleaning, exploratory data analysis (EDA), visualization, and predictive modeling. The insights derived from this analysis can help stakeholders identify at-risk customers and make informed decisions to improve customer retention
Project Workflow
1. Data Import and Cleaning
Imported raw customer data from a CSV file into MySQL.
Performed data cleaning and exploratory data analysis (EDA) using SQL to understand the data structure and trends.

3.** SQL Views Creation**
Created three SQL components to enhance data management and analysis:
*prod_churn: Table Creation: Creates a new table prod_churn in the telecom_churan schema. It selects data from customer_data and applies transformations to handle empty string values. Numeric columns with empty *strings are replaced with zeroes and cast to the appropriate numeric type. Text columns with empty strings are replaced with default values using the COALESCE and NULLIF functions.
*vw_churn_data: Displays records of customers whose status is either 'Churned' or 'Stayed'.
*vw_join_data: Displays records of newly joined customers.

**3. Data Visualization (Power BI)**
Imported data from MySQL into Power BI.
Conducted ETL processes, including the creation of calculated columns and transformations.
Developed visualizations such as:
*Gender-wise churn
*Churn by age group
*Churn by payment method
Created measures for total customers, churn rate, new joiners, and customer churn.

**5. Predictive Modeling (Python)**
Utilized Python (Jupyter Notebook) to predict potential customer churn using a Random Forest algorithm.
Conducted data preprocessing, including dropping irrelevant columns and label encoding.
Trained the Random Forest model and evaluated its performance.

**7. Integration of Predictions in Power BI**
Imported the prediction results back into Power BI.
Added a separate page in the dashboard to visualize customers who are likely to churn, providing stakeholders with actionable insights.

**Results**
Achieved an accuracy of 85% in predicting customer churn.
Developed visualizations that allow stakeholders to understand customer churn patterns based on different demographics and factors.
Integrated predictive analytics into Power BI to identify at-risk customers.
**Conclusion**
This project demonstrates how data analysis, visualization, and machine learning can be combined to provide actionable business insights. The predictive model and visualizations can be used by telecom companies to proactively address customer churn and improve retention strategies.
