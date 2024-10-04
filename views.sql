-- This view, vw_churn_data, is created to display records of customers whose status is either 'Churned' or 'Stayed'. 
-- It selects all columns from the prod_churn table for these specific customer statuses.
create view vw_churn_data as
	select * 
    from prod_churn 
	where Customer_Status in ( 'Churned', 'Stayed');


-- This view, vw_join_data, is designed to show records of customers who have joined. 
-- It selects all columns from the prod_churn table where the Customer_Status is 'Joined'.
create view vw_join_data as
	select * 
    from prod_churn 
	where Customer_Status in ( 'Joined');

