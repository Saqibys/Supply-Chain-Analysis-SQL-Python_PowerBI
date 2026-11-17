CREATE DATABASE supply_chain_analysis;

USE supply_chain_analysis;

show tables;

SELECT COUNT(*) AS total_rows
FROM supply_chain_data_csv;

SELECT *
FROM supply_chain_data_csv
LIMIT 5;

SELECT COUNT(*) AS total_records
FROM Supplier_Performance_csv;

DESCRIBE supply_chain_data_csv;

DESCRIBE Supplier_Performance_csv;

SELECT
    COUNT(*) AS total_rows,

    SUM(CASE WHEN `Product type` IS NULL THEN 1 ELSE 0 END) AS missing_product_type,
    SUM(CASE WHEN SKU IS NULL THEN 1 ELSE 0 END) AS missing_sku,
    SUM(CASE WHEN Price IS NULL THEN 1 ELSE 0 END) AS missing_price,
    SUM(CASE WHEN `Revenue generated` IS NULL THEN 1 ELSE 0 END) AS missing_revenue,
    SUM(CASE WHEN `Stock levels` IS NULL THEN 1 ELSE 0 END) AS missing_stock,
    SUM(CASE WHEN `Supplier name` IS NULL THEN 1 ELSE 0 END) AS missing_supplier,
    SUM(CASE WHEN `Shipping costs` IS NULL THEN 1 ELSE 0 END) AS missing_shipping_cost,
    SUM(CASE WHEN `Defect rates` IS NULL THEN 1 ELSE 0 END) AS missing_defect_rate

FROM supply_chain_data_csv;

SELECT
    SKU,
    COUNT(*) AS occurrences
FROM supply_chain_data_csv
GROUP BY SKU
HAVING COUNT(*) > 1;

-- Bussiness Questions --
-- Product & Sales Performance --
-- 1. Which product categories generate the highest revenue?
SELECT
    `Product type`,
    COUNT(*) AS product_records,
    SUM(`Number of products sold`) AS total_units_sold,
    ROUND(SUM(`Revenue generated`), 2) AS total_revenue,
    ROUND(AVG(Price), 2) AS average_price
FROM supply_chain_data_csv
GROUP BY `Product type`
ORDER BY total_revenue DESC;

SELECT
    SKU,
    `Product type`,
    `Number of products sold`,
    `Stock levels`,
    `Lead times`,
    `Lead time`
FROM supply_chain_data_csv
WHERE `Stock levels` <= 10
ORDER BY `Stock levels` ASC;

-- 2. Which are the top 10 products based on revenue?
SELECT
    SKU,
    `Product type`,
    `Number of products sold`,
    `Revenue generated`,
    Price
FROM supply_chain_data_csv
ORDER BY `Revenue generated` DESC
LIMIT 10;

-- 3. Which products have the highest sales volume?
SELECT
    SKU,
    `Product type`,
    `Number of products sold`,
    `Revenue generated`
FROM supply_chain_data_csv
ORDER BY `Number of products sold` DESC
LIMIT 10;

-- 4. What is the average selling price for each product category?
SELECT
    `Product type`,
    ROUND(AVG(Price), 2) AS average_price,
    MIN(Price) AS minimum_price,
    MAX(Price) AS maximum_price
FROM supply_chain_data_csv
GROUP BY `Product type`
ORDER BY average_price DESC;

-- 5. Which products generate high revenue but have low sales volume?
SELECT
    SKU,
    `Product type`,
    Price,
    `Number of products sold`,
    `Revenue generated`
FROM supply_chain_data_csv
WHERE `Number of products sold` < (
    SELECT AVG(`Number of products sold`)
    FROM supply_chain_data_csv
)
AND `Revenue generated` > (
    SELECT AVG(`Revenue generated`)
    FROM supply_chain_data_csv
)
ORDER BY `Revenue generated` DESC;

-- Inventory Management --
-- 6. Which products have critically low stock levels?
SELECT
    SKU,
    `Product type`,
    `Stock levels`,
    `Number of products sold`
FROM supply_chain_data_csv
WHERE `Stock levels` <= 10
ORDER BY `Stock levels`;

-- 7. Which products have high stock but low sales?
SELECT
    SKU,
    `Product type`,
    `Stock levels`,
    `Number of products sold`
FROM supply_chain_data_csv
WHERE `Stock levels` > (
    SELECT AVG(`Stock levels`)
    FROM supply_chain_data_csv
)
AND `Number of products sold` < (
    SELECT AVG(`Number of products sold`)
    FROM supply_chain_data_csv
)
ORDER BY `Stock levels` DESC ;

-- 8. What is the inventory status of each product?
SELECT
    SKU,
    `Product type`,
    `Stock levels`,
    CASE
        WHEN `Stock levels` <= 10 THEN 'Critical Stock'
        WHEN `Stock levels` <= 30 THEN 'Low Stock'
        WHEN `Stock levels` <= 60 THEN 'Moderate Stock'
        ELSE 'High Stock'
    END AS inventory_status
FROM supply_chain_data_csv
ORDER BY `Stock levels`;

-- 9. Which product categories have the highest average inventory?
SELECT
    `Product type`,
    ROUND(AVG(`Stock levels`), 2) AS average_stock,
    SUM(`Stock levels`) AS total_stock
FROM supply_chain_data_csv
GROUP BY `Product type`
ORDER BY average_stock DESC;

-- Supplier Performance --
-- 10. Which suppliers are associated with the highest manufacturing costs?
SELECT
    `Supplier name`,
    COUNT(*) AS product_count,
    ROUND(AVG(`Manufacturing costs`), 2) AS avg_manufacturing_cost
FROM supply_chain_data_csv
GROUP BY `Supplier name`
ORDER BY avg_manufacturing_cost DESC;

-- 11. Which suppliers have the longest lead times?
SELECT
    `Supplier name`,
    ROUND(AVG(`Lead time`), 2) AS avg_lead_time,
    ROUND(AVG(`Lead times`), 2) AS avg_lead_times
FROM supply_chain_data_csv
GROUP BY `Supplier name`
ORDER BY avg_lead_time DESC;

--  12. Which suppliers have the highest average defect rates?
SELECT
    `Supplier name`,
    ROUND(AVG(`Defect rates`), 3) AS avg_defect_rate
FROM supply_chain_data_csv
GROUP BY `Supplier name`
ORDER BY avg_defect_rate DESC;

-- 13. Rank suppliers based on manufacturing costs.
SELECT
    `Supplier name`,
    ROUND(AVG(`Manufacturing costs`), 2) AS avg_cost,
    DENSE_RANK() OVER (
        ORDER BY AVG(`Manufacturing costs`) DESC
    ) AS cost_rank
FROM supply_chain_data_csv
GROUP BY `Supplier name`;

-- Shipping & Logistics --
-- 14. Which shipping carriers have the highest average shipping costs?
SELECT
    `Shipping carriers`,
    ROUND(AVG(`Shipping costs`), 2) AS avg_shipping_cost,
    COUNT(*) AS total_records
FROM supply_chain_data_csv
GROUP BY `Shipping carriers`
ORDER BY avg_shipping_cost DESC;

-- 15. Which transportation modes are associated with the highest shipping costs?
SELECT
    `Transportation modes`,
    ROUND(AVG(`Shipping costs`), 2) AS avg_shipping_cost,
    ROUND(AVG(`Shipping times`), 2) AS avg_shipping_time
FROM supply_chain_data_csv
GROUP BY `Transportation modes`
ORDER BY avg_shipping_cost DESC;

-- 16. Which routes have the highest transportation costs?
SELECT
    Routes,
    ROUND(AVG(Costs), 2) AS avg_route_cost,
    COUNT(*) AS total_records
FROM supply_chain_data_csv
GROUP BY Routes
ORDER BY avg_route_cost DESC;

 -- 17. Compare shipping times across carriers.
 SELECT
    `Shipping carriers`,
    ROUND(AVG(`Shipping times`), 2) AS avg_shipping_time,
    MIN(`Shipping times`) AS fastest_shipping_time,
    MAX(`Shipping times`) AS slowest_shipping_time
FROM supply_chain_data_csv
GROUP BY `Shipping carriers`
ORDER BY avg_shipping_time;
 
-- Manufacturing & Quality Analysis --
-- 18. Which product categories have the highest defect rates?
SELECT
    `Product type`,
    ROUND(AVG(`Defect rates`), 3) AS avg_defect_rate
FROM supply_chain_data_csv
GROUP BY `Product type`
ORDER BY avg_defect_rate DESC;

-- 19. Which products have the highest manufacturing costs?
SELECT
    SKU,
    `Product type`,
    `Manufacturing costs`,
    `Production volumes`
FROM supply_chain_data_csv
ORDER BY `Manufacturing costs` DESC
LIMIT 10;

-- 20. How do inspection results vary across product categories?
SELECT
    `Product type`,
    `Inspection results`,
    COUNT(*) AS total_products
FROM supply_chain_data_csv
GROUP BY
    `Product type`,
    `Inspection results`
ORDER BY `Product type`, total_products DESC;

-- 21. Which products have high defect rates?
SELECT
    SKU,
    `Product type`,
    `Defect rates`,
    `Inspection results`
FROM supply_chain_data_csv
WHERE `Defect rates` > (
    SELECT AVG(`Defect rates`)
    FROM supply_chain_data_csv
)
ORDER BY `Defect rates` DESC;

-- Cost & Profitability Analysis --
-- 22. Which products have the highest combined manufacturing and shipping costs?
SELECT
    SKU,
    `Product type`,
    `Manufacturing costs`,
    `Shipping costs`,
    ROUND(
        `Manufacturing costs` + `Shipping costs`, 2
    ) AS combined_cost
FROM supply_chain_data_csv
ORDER BY combined_cost DESC
LIMIT 10;

-- 23. Which products have the highest recorded revenue compared with combined manufacturing and shipping costs?
SELECT
    SKU,
    `Product type`,
    `Revenue generated`,
    `Manufacturing costs`,
    `Shipping costs`,
    ROUND(
        `Revenue generated`
        - `Manufacturing costs`
        - `Shipping costs`, 2
    ) AS revenue_after_these_costs
FROM supply_chain_data_csv
ORDER BY revenue_after_these_costs DESC;

-- 24. Rank products based on revenue.
SELECT
    SKU,
    `Product type`,
    `Revenue generated`,
    DENSE_RANK() OVER (
        ORDER BY `Revenue generated` DESC
    ) AS revenue_rank
FROM supply_chain_data_csv;

-- 25. Categorize products based on sales performance.
SELECT
    SKU,
    `Product type`,
    `Number of products sold`,
    CASE
        WHEN `Number of products sold` >= 500 THEN 'High Sales'
        WHEN `Number of products sold` >= 200 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category
FROM supply_chain_data_csv
ORDER BY `Number of products sold` DESC;
