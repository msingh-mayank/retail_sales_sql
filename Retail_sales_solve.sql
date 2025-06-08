USE sql_project_1;
SHOW tables;

-- data cleaning

SELECT * FROM retail_sales
WHERE transactions_id IS NULL ;

SELECT * FROM retail_sales
WHERE 
	transactions_id IS NULL 
    OR 
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    customer_id IS NULL
    OR
    gender IS NULL
    OR
    age IS NULL
    OR 
    category IS NULL
    OR 
    quantiy IS NULL
    OR
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR 
    total_sale IS NULL;
   
SET SQL_SAFE_UPDATES = 0;
    
DELETE FROM retail_sales
WHERE 
	transactions_id IS NULL 
    OR 
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    customer_id IS NULL
    OR
    gender IS NULL
    OR
    age IS NULL
    OR 
    category IS NULL
    OR 
    quantiy IS NULL
    OR
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR 
    total_sale IS NULL;
    
    
    

--     data explorations
-- how manny sales we have
SELECT COUNT(*) AS total_sale FROM retail_sales;

-- how manny unique coustomer we have 
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales;
-- all unique category 
SELECT DISTINCT category  FROM retail_sales;

-- business key problem
-- 1 . - retrive all colums for sales  made on '2022-11-05'

SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

-- retrive all transations where the category is 'clothing' and the quantiy sold more than 4 in nov month

SELECT *  FROM retail_sales
where 
	category =  'clothing' 
    AND
    DATE_FORMAT(sale_date,'%Y-%m') = '2022-11'
    AND
    quantiy >=4;
    
    -- calgulate the total sale for each category
    
    SELECT category , 
    SUM(total_sale) as net_sale , 
    COUNT(*) AS total_order
    FROM retail_sales GROUP BY 1;
    
    -- average age of customer who purchased item from beauty category 
    SELECT ROUND(AVG(age),2) as avg_age
    FROM retail_sales
    WHERE category = 'Beauty';
    
-- find all the transtations where total sale is greater than 1000
SELECT * FROM retail_sales
WHERE total_sale>1000;

-- total number of transtions made by each gender in each categroy 
SELECT 
	category,
    gender,
    COUNT(*) AS total_trans
FROM retail_sales
GROUP BY 
	category,
    gender
ORDER BY 1;


-- avg sale for each month find best selling month in each year 

SELECT  
	year,month,avg_sale
FROM (
SELECT 
	YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale,
    RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS ranke
FROM retail_sales
GROUP BY 1,2
) AS t2
WHERE ranke =1 ;

-- top 5 customer based on the highest total sales

SELECT 
customer_id,
SUM(total_sale) as total_sales
FROM retail_sales 
GROUP BY 1 ORDER BY 2 DESC LIMIT 5;

-- number of unique customer who purchased item from each category 
SELECT 
category ,
COUNT(DISTINCT customer_id)
FROM retail_sales 
GROUP BY 1;



-- create each shift and number of orders 

WITH hourly_shift AS (
SELECT *,
	CASE 
		WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'AfterNoon'
        ELSE 'Evening'
	END AS shift 
FROM retail_sales
)
SELECT shift, 
COUNT(*) AS total_Order
FROM hourly_shift
 GROUP BY 1;