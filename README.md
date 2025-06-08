#  Retail Sales Analysis SQL Project

This project involves analyzing a retail sales dataset using SQL. It focuses on data cleaning, exploration, and solving real business queries to gain insights that can support better decision-making in retail operations.

##  Project Overview

- **Language Used:** MySQL  
- **Database Name:** `sql_project_1`  
- **Dataset:** `retail_sales` table  
- **Objective:** Clean the data, explore patterns, and answer key business questions related to customer behavior, product performance, and sales trends.

---

##  Key Features

###  Data Cleaning
- Removed all records with missing values across critical columns like `transaction_id`, `sale_date`, `customer_id`, etc.
- Ensured clean and reliable data for analysis.

###  Data Exploration
- Counted total sales and unique customers.  
- Identified all product categories available in the dataset.  
- Extracted useful customer and product insights using SQL queries.

###  Business Queries Solved
- Sales made on a specific date (`2022-11-05`)  
- Transactions in the "Clothing" category with quantity ≥ 4 in November 2022  
- Total sales and order count per category  
- Average age of customers who purchased from the "Beauty" category  
- High-value transactions (sales > ₹1000)  
- Gender-wise transaction distribution across categories  
- Best selling month in each year  
- Top 5 customers based on total purchase value  
- Category-wise unique customer count  
- Sales shift analysis (Morning, Afternoon, Evening)  

---

##  File Structure

```
Retail_sales_solve.sql     # Main SQL script for entire analysis
README.md                  # Project overview and documentation
```

---

##  Skills Demonstrated

- SQL Query Writing  
- Data Cleaning  
- Analytical Thinking  
- Aggregation & Grouping  
- Window Functions  
- Categorical Analysis  

---

##  How to Use

1. Open MySQL Workbench or any compatible SQL editor.  
2. Create a database named `sql_project_1`.  
3. Import the dataset into a table called `retail_sales`.  
4. Run the queries in `Retail_sales_solve.sql`.  

---

##  What's Next

In future versions:
- Add visualizations using Power BI or Tableau.  
- Optimize queries for performance.  
- Build KPI dashboards for executive-level insights.  

---

##  Credits

This project was independently developed as part of practical SQL learning.
