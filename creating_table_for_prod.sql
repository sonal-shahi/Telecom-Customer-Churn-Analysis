-- This query calculates the count of null or empty values for each column in the 'prod_churn' table.
-- It uses the SUM function with a CASE statement to count rows where each column's value is an empty string ('').
-- The result provides insights into the extent of missing or empty data in each column.
SELECT 
    SUM(CASE WHEN Customer_ID = '' THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender = '' THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age = '' THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married = '' THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State = '' THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals = '' THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months = '' THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal = '' THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service = '' THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines = '' THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service = '' THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type = '' THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security = '' THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup = '' THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan = '' THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support = '' THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV = '' THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies = '' THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music = '' THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data = '' THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract = '' THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing = '' THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method = '' THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge = '' THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges = '' THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds = '' THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges = '' THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges = '' THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue = '' THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status = '' THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category = '' THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason = '' THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM prod_churn;




-- This statement creates a new table 'prod_churn' in the 'telecom_churan' schema.
-- It selects data from 'customer_data' and applies transformations to handle empty string values.
-- For numeric columns, empty strings are replaced with zeroes, and values are cast to the appropriate numeric type.
-- For text columns, empty strings are replaced with default values using COALESCE and NULLIF functions.
CREATE TABLE telecom_churan.prod_churn AS
SELECT 
    Customer_ID,
    Gender, 
    Age, 
    Married, 
    State, 
    CASE 
        WHEN Number_of_Referrals = '' THEN 0
        ELSE CAST(Number_of_Referrals AS UNSIGNED)
    END AS Number_of_Referrals,
    Tenure_in_Months,
    COALESCE(NULLIF(Value_Deal, ''), 'None') AS Value_Deal,
    Phone_Service,
    COALESCE(NULLIF(Multiple_Lines, ''), 'No') AS Multiple_Lines,
    Internet_Service,
    COALESCE(NULLIF(Internet_Type, ''), 'None') AS Internet_Type,
    COALESCE(NULLIF(Online_Security, ''), 'No') AS Online_Security,
    COALESCE(NULLIF(Online_Backup, ''), 'No') AS Online_Backup,
    COALESCE(NULLIF(Device_Protection_Plan, ''), 'No') AS Device_Protection_Plan,
    COALESCE(NULLIF(Premium_Support, ''), 'No') AS Premium_Support,
    COALESCE(NULLIF(Streaming_TV, ''), 'No') AS Streaming_TV,
    COALESCE(NULLIF(Streaming_Movies, ''), 'No') AS Streaming_Movies,
    COALESCE(NULLIF(Streaming_Music, ''), 'No') AS Streaming_Music,
    COALESCE(NULLIF(Unlimited_Data, ''), 'No') AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    CASE 
        WHEN Total_Refunds = '' THEN 0
        ELSE CAST(Total_Refunds AS DECIMAL)
    END AS Total_Refunds,
    CASE 
        WHEN Total_Extra_Data_Charges = '' THEN 0
        ELSE CAST(Total_Extra_Data_Charges AS DECIMAL)
    END AS Total_Extra_Data_Charges,
    CASE 
        WHEN Total_Long_Distance_Charges = '' THEN 0
        ELSE CAST(Total_Long_Distance_Charges AS DECIMAL)
    END AS Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    COALESCE(NULLIF(Churn_Category, ''), 'Other') AS Churn_Category,
    COALESCE(NULLIF(Churn_Reason, ''), 'Other') AS Churn_Reason
FROM telecom_churan.customer_data;


 