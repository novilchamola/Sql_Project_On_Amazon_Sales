**Amazon Sales Analysis Using SQL**

This project aims to analyze sales data from three branches of Amazon located in Mandalay, Yangon, and Naypyitaw. 
The dataset contains information on sales transactions, including details such as invoice ID, branch, city, customer type, gender, product line, 
unit price, quantity, VAT, total cost, date, time, payment method, cost of goods sold, gross margin percentage, gross income, and rating.

**Purpose**

The primary objective of this project is to gain insights into Amazon's sales data to understand various factors influencing sales across different branches. 
Through analysis, we aim to identify trends, patterns, and areas for improvement in sales strategies and customer segmentation.

**Approach**

1. Data Wrangling
Built a database and created tables to store the sales data.
Inspected the data to detect and handle NULL values and missing data.
Selected columns with NULL values, which were then filtered out as the tables were created with NOT NULL constraints.
2. Feature Engineering
Added new columns such as timeofday, dayname, and monthname to provide insights into sales patterns based on time of day, day of the week, and month of the year, respectively.
3. Exploratory Data Analysis (EDA)
Conducted exploratory data analysis to answer specific business questions and achieve project goals.

**Business Questions**

1.Count of distinct cities in the dataset.
2.Corresponding city for each branch.
3.Count of distinct product lines.
4.Most frequently occurring payment method.
5.Product line with the highest sales.
6.Revenue generated each month.
7.Month with peak cost of goods sold.
8.Product line generating the highest revenue.
9.City with the highest revenue.
10.Product line with the highest Value Added Tax (VAT).
11.Classification of product lines as "Good" or "Bad" based on sales performance.
12.Branch exceeding the average number of products sold.
13.Most frequently associated product line with each gender.
14.Average rating for each product line.
15.Sales occurrences for each time of day on every weekday.
16.Customer type contributing the highest revenue.
17.City with the highest VAT percentage.
18.Customer type with the highest VAT payments.
19.Count of distinct customer types and payment methods.
20.Most frequently occurring customer type.
21.Customer type with the highest purchase frequency.
22.Predominant gender among customers.
23.Distribution of genders within each branch.
24.Time of day with the most ratings from customers.
25.Time of day with the highest customer ratings for each branch.
26.Day of the week with the highest average ratings overall and for each branch.

**Technologies Used**

1. SQL (Structured Query Language) for database management and querying.
2. Git for version control and collaboration.
3. GitHub for project repository hosting and documentation.

**Conclusion**

Through comprehensive analysis of Amazon's sales data, this project aims to provide valuable insights and recommendations to improve sales strategies, customer segmentation, and overall business performance. The results obtained from this analysis can guide decision-making processes and drive future growth and profitability for Amazon.
