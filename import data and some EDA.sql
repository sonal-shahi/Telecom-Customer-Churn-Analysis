-- This statement creates a new database named 'telecom_churan'.
-- Use this database for subsequent operations.
create database telecom_churan;

-- This statement sets the current database to 'telecom_churan'.
-- All subsequent operations will be performed on this database.
use telecom_churan;

/* Exploratory Data Analysis (EDA) for Telecom Churn Dataset */


-- This query calculates the count and percentage of each gender in the 'customer_data' table.
-- It groups the data by 'Gender' and counts the number of occurrences for each gender.
-- The percentage is calculated as the count of each gender divided by the total number of records.
SELECT Gender, COUNT(Gender) as gender_count , COUNT(Gender) / (SELECT COUNT(*) FROM customer_data) * 100 AS percentage 
from customer_data 
group by Gender;


-- This query calculates the count and percentage of each contract type in the 'customer_data' table.
-- It groups the data by 'Contract' and counts the number of occurrences for each contract type.
-- The percentage is calculated as the count of each contract type divided by the total number of records. 
SELECT Contract, COUNT(Contract) as contract_count , COUNT(Contract) / (SELECT COUNT(*) FROM customer_data) * 100 AS percentage 
from customer_data 
group by Contract;

-- This query calculates the count of customers, total revenue, and the percentage of total revenue for each customer status.
-- It groups the data by 'customer_status' and computes the sum of 'Total_Revenue' for each status.
-- The percentage of revenue is calculated as the total revenue for each status divided by the sum of total revenue across all statuses.
select customer_status , count(customer_status) as customer_status_count , sum(Total_Revenue) as total_revenue,
sum(total_revenue) / ( select sum(Total_Revenue) from customer_data) * 100 as percentage_of_revenue 
from customer_data
group by 1;


-- This query calculates the count and percentage of customers from each state in the 'customer_data' table.
-- It groups the data by 'state' and counts the number of occurrences for each state.
-- The percentage is calculated as the count of each state divided by the total number of records, and the results are ordered by percentage in descending order.
SELECT state, COUNT(state) as state , COUNT(state) / (SELECT COUNT(*) FROM customer_data) * 100.0 AS percentage 
from customer_data 
group by state
order by percentage desc;
