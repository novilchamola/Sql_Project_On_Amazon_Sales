-- SQL Capstone Project
-- by S6735

/*Purposes Of The Capstone Project
The major aim of this project is to gain insight into the sales data of Amazon 
to understand the different factors 
that affect sales of the different branches.
*/

-- Feature Engineering:

use amazon;
select* from amazon_data;
describe amazon_data;
-- Add new columns for day name and month name
alter table amazon_data
add column day_name VARCHAR(10),
add column month_name VARCHAR(10);

SET SQL_SAFE_UPDATES = 0;
UPDATE amazon_data
SET date = DATE_FORMAT(STR_TO_DATE(date, '%m/%d/%Y'), '%Y-%m-%d'); -- since the date column was in mm-dd-yy format, 
-- I have changed it to the general format which is yy-mm-dd.

ALTER TABLE amazon_data ADD COLUMN Time_of_day VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;
Update amazon_data
-- Adding a new column as time_of_day to see what time the sale was generated. The divided categories are Morning,Afternoon and evening.
SET Time_of_day =(CASE WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning" 
	 WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
	 ELSE "Evening"
     END);

-- Update the new columns with values from the date column, two columns created, day_name and month_name.
UPDATE amazon_data
SET day_name = DAYNAME(date),
    month_name = MONTHNAME(date);
    
-- Q1 What is the count of distinct cities in the dataset?
select count(distinct(city)) as Count_of_Distinct_cities from amazon_data;   -- Here used distinct function to count the unique values in that particular column

-- Q2 For each branch, what is the corresponding city?
select branch,city
from amazon_data
group by branch,city;

-- Q3 What is the count of distinct product lines in the dataset?
select count(distinct(product_line)) as count_of_distinct_product_lines from amazon_data; -- Here used an aggregate function which is count to get the count of the numnerical data.

-- Q4 Which payment method occurs most frequently?
select payment,count(payment) as Count_of_payments from amazon_data
group by payment
order by payment desc
limit 1;

-- Q5 Which product line has the highest sales?
select product_line,sum(total) as highest_sales -- used sum, an aggregate function to determine the summation of sales
from amazon_data
group by product_line
order by highest_sales desc
limit 1; -- order by to basically give the order, whether descending or ascending

-- Q6 How much revenue is generated each month?
select month_name as Month,sum(total) as total_revenue
from amazon_data
group by month_name
order by total_revenue desc;

-- Q7 In which month did the cost of goods sold reach its peak?
select month_name,max(cogs) as Total_cogs from amazon_data
group by month_name
order by Total_cogs desc
limit 1;
    
-- Q8 Which product line generated the highest revenue? 
select product_line,sum(total) as Total_revenue_generated from amazon_data
group by product_line
order by Total_revenue_generated desc
limit 1;

-- Q9 In which city was the highest revenue recorded?   
select city,sum(total) as City_revenue from amazon_data
group by city
order by City_revenue desc
limit 1;

-- Q10 Which product line incurred the highest Value Added Tax?
select Product_line,sum(vat) as Total_vat from amazon_data
group by Product_line
order by Total_vat desc
limit 1;

-- Q11 For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."

select product_line,sum(total) as total_sales,
case when sum(total)>(select avg(total) from amazon_data) then "Good" -- here used a subquery to find the avg(total), it is not dependedent on the parent query.
else "Bad"
end as Sales_Rating
from amazon_data
group by product_line
order by total_sales desc;

-- Q12 Identify the branch that exceeded the average number of products sold
select branch,sum(quantity) as quantity from amazon_data
group by branch
having sum(quantity)>(select avg(quantity) from amazon_data);

-- Q13 Which product line is most frequently associated with each gender?
select gender,product_line,count(gender) as total
from amazon_data
group by gender,product_line
order by total desc;

-- Q14 Calculate the average rating for each product line.
select product_line,avg(rating) as Avg_Rating
from amazon_data
group by product_line
order by Avg_Rating desc;

-- Q15 Count the sales occurrences for each time of day on every weekday.

select day_name,time_of_Day,count(invoice_id) as count_no from amazon_data
where day_name NOT IN ("Saturday","Sunday")
group by day_name,time_of_Day
order by day_name desc,count_no desc;

-- Q16 Identify the customer type contributing the highest revenue
select customer_type,sum(total) as total_revenue from amazon_data
group by customer_type
order by total_revenue desc
limit 1;

-- Q17 Determine the city with the highest VAT percentage.
select city,max(vat) as highest_vat from amazon_data
group by city
order by highest_vat desc
limit 1;

select vat from amazon_data;
-- Q18 Identify the customer type with the highest VAT payments.
select customer_type,sum(vat) as Highest_vat from amazon_data
group by customer_type
order by Highest_vat desc
limit 1;

-- Q19 What is the count of distinct customer types in the dataset?
select count(distinct(customer_type)) as count_distinct_customer_type from amazon_data;

-- Q20 What is the count of distinct payment methods in the dataset?
select count(distinct(payment)) as count_payment_type from amazon_data;

-- Q21 Which customer type occurs most frequently?
select customer_type,count(Customer_type) as frequency from amazon_data
group by Customer_type
order by frequency desc
limit 1;

-- Q22 Identify the customer type with the highest purchase frequency
select customer_type,count(*) as highest_purchase_frequency from amazon_data
group by customer_type
order by highest_purchase_frequency desc
limit 1;

-- Q23 Determine the predominant gender among customers.
select gender,count(*) as count_no from amazon_data
group by gender
order by count_no desc
limit 1;

-- Q24 Examine the distribution of genders within each branch.
select branch,gender,count(gender) as Gender_distribution from amazon_data
group by branch,gender
order by branch,Gender_distribution desc;

-- Q25 Identify the time of day when customers provide the most ratings.
select time_of_day,avg(rating) AS avg_rating from amazon_data
group by time_of_day
order by avg_rating DESC;

-- Q26 Determine the time of day with the highest customer ratings for each branch.
select time_of_day,branch,count(rating) as Rating_count from amazon_data
group by time_of_day,Branch
order by Rating_count desc;

-- Q27 Identify the day of the week with the highest average ratings.
select day_name,avg(rating) from amazon_data
group by day_name
order by avg(rating) desc
limit 1;

-- Q28 Determine the day of the week with the highest average ratings for each branch
select branch,day_name,avg(rating) as avg_rating from amazon_data
group by day_name,branch
order by branch,avg_rating desc;

select column_name,data_type
from information_schema.columns
where table_schema="amazon" and table_name="amazon_data";

-- ANALYSIS LIST:
-- Product Analysis::

select product_line,sum(total) as total_revenue  from amazon_data
group by product_line
order by total_revenue desc;

/*from the above query, we can figure out that food and beverages is at the top in total sales, 
followed by sports and sports and travel. The section which is at the lowest is health and beauty, 
that needs to be focused.*/


---------------------------------- Sales Analysis---------------------------------------------------------
-- City wise sales

select city,sum(total) from amazon_data
group by city
order by sum(total) desc;


-- Gender wise sales

select gender,sum(total) from amazon_data
group by gender
order by sum(total) desc;

-- From sales analysis we can figure out that Naypyitaw has generated most sales followed by Yangon and then Mandalay with more number of female buyers than men.

--------------------------------------- Customer Analysis---------------------------------------------------------
select customer_type,sum(total) from amazon_data
group by customer_type
order by sum(total) desc;

/*From this data, the analysis we can derive is that members are 
contributing more in sales as comparison to Normal customers*/

select* from amazon_data;
describe amazon_data;


