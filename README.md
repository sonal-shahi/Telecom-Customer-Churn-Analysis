# Telecom-Customer-Churn-Analysis
### 1. Data Import and Cleaning
- **Imported** raw customer data from a CSV file into MySQL.
- **Performed** data cleaning and exploratory data analysis (EDA) using SQL to understand the data structure and trends.

### 2. SQL Views Creation
Created three SQL components to enhance data management and analysis:

- **`prod_churn`:** Table Creation: Creates a new table prod_churn in the telecom_churan schema. It selects data from customer_data and applies transformations to handle empty string values. Numeric columns with empty strings are replaced with zeroes and cast to the appropriate numeric type. Text columns with empty strings are replaced with default values using the COALESCE and NULLIF functions.
- **`vw_churn_data`:** Displays records of customers whose status is either 'Churned' or 'Stayed'.
- **`vw_join_data`:** Displays records of newly joined customers.

```sql
-- View to display churned or stayed customers
CREATE VIEW vw_churn_data AS
SELECT * 
FROM prod_churn 
WHERE Customer_Status IN ('Churned', 'Stayed');

-- View to display newly joined customers
CREATE VIEW vw_join_data AS
SELECT * 
FROM prod_churn 
WHERE Customer_Status = 'Joined';
```
### 3. Data Visualization (Power BI)
- **Imported** data from MySQL into Power BI.
- **Conducted** ETL processes, including the creation of calculated columns and transformations.
- **Developed** visualizations such as:
  - Gender-wise churn
  - Churn by age group
  - Churn by payment method
- **Created** measures for total customers, churn rate, new joiners, and customer churn.

### 4. Predictive Modeling (Python)
- **Utilized** Python (Jupyter Notebook) to predict potential customer churn using a Random Forest algorithm.
- **Conducted** data preprocessing, including dropping irrelevant columns and label encoding.
- **Trained** the Random Forest model and evaluated its performance.

```python
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier  
from sklearn.metrics import classification_report, confusion_matrix   
from sklearn.preprocessing import LabelEncoder   
import joblib

# Load and preprocess the data
df = pd.read_csv('customer_data.csv')
df = df.drop(columns=['Customer_ID', 'Churn_Reason', 'Churn_Category'])
label_encoder = LabelEncoder()
df_encoded = df.apply(label_encoder.fit_transform)

# Split data into training and testing sets
X = df_encoded.drop('Churn_Status', axis=1)
Y = df_encoded['Churn_Status']
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.2, random_state=42)

# Train the Random Forest model
rf_model = RandomForestClassifier(n_estimators=100, random_state=42)
rf_model.fit(X_train, y_train)

# Evaluate the model
y_pred = rf_model.predict(X_test)
print(confusion_matrix(y_test, y_pred))
print(classification_report(y_test, y_pred))
```

### 5. Integration of Predictions in Power BI
- **Imported** the prediction results back into Power BI.
- **Added** a separate page in the dashboard to visualize customers who are likely to churn, providing stakeholders with actionable insights.

## Tools Used
- **SQL (MySQL):** For data cleaning, EDA, and creating views.
- **Power BI:** For data visualization and dashboard creation.
- **Python (Jupyter Notebook):** For predictive modeling using Random Forest.
- **sklearn:** For machine learning tasks, including model training and evaluation.

## Results
- **Achieved** an accuracy of 85% in predicting customer churn.
- **Developed** visualizations that allow stakeholders to understand customer churn patterns based on different demographics and factors.
- **Integrated** predictive analytics into Power BI to identify at-risk customers.

## Conclusion
This project demonstrates how data analysis, visualization, and machine learning can be combined to provide actionable business insights. The predictive model and visualizations can be used by telecom companies to proactively address customer churn and improve retention strategies.

