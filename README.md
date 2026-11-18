# 📦 Supply Chain Analysis – Product, Inventory & Logistics

*Analyzing product performance, inventory levels, supplier efficiency, shipping operations, and product quality using Excel, MySQL, Python, and Power BI.*

---

## 📌 Table of Contents

- [Overview](#overview)
- [Business Problem](#business-problem)
- [Dataset](#dataset)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Data Cleaning & Preparation](#data-cleaning--preparation)
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
- [Research Questions & Key Findings](#research-questions--key-findings)
- [Dashboard](#dashboard)
- [How to Run This Project](#how-to-run-this-project)
- [Final Recommendations](#final-recommendations)
- [Author & Contact](#author--contact)

---

## Overview

This project focuses on analyzing supply chain operations to identify opportunities for improving inventory management, product performance, supplier efficiency, shipping operations, and quality control.

A complete data analysis workflow was followed using Excel for initial data preparation, MySQL for data analysis and business queries, Python for Exploratory Data Analysis (EDA), and Power BI for creating an interactive dashboard.

The analysis provides business insights to support better inventory planning, supplier evaluation, logistics management, and operational decision-making.

---

## Business Problem

Efficient supply chain management is essential for maintaining product availability, controlling operational costs, and ensuring timely delivery.

This project aims to:

- Identify the best-performing product categories based on revenue and sales.
- Analyze inventory levels and identify products with low or critical stock.
- Evaluate supplier performance based on manufacturing costs and lead times.
- Compare shipping carriers and transportation modes.
- Analyze product defect rates and inspection results.
- Identify areas where inventory, logistics, and quality management can be improved.

---

## Dataset

The project uses a Supply Chain dataset containing **100 records and 24 columns** covering different aspects of supply chain operations.

The dataset includes information related to:

- Product categories and SKU details
- Product prices and revenue generated
- Product availability and stock levels
- Number of products sold and order quantities
- Supplier details and manufacturing costs
- Manufacturing lead times and production volumes
- Shipping carriers and transportation modes
- Shipping times and transportation costs
- Product inspection results and defect rates
- Customer demographics and geographical locations

The dataset was used to perform product-level, inventory-level, supplier-level, logistics, and quality analysis.

---

## Tools & Technologies

- **Microsoft Excel:** Data cleaning, formatting, and initial data validation.
- **MySQL:** Data storage, querying, filtering, aggregations, joins, and business analysis.
- **Python:** Exploratory Data Analysis using Pandas, NumPy, Matplotlib, and Seaborn.
- **Power BI:** Interactive dashboards, KPI cards, slicers, and data visualizations.
- **GitHub:** Project documentation, version control, and portfolio presentation.

---

## Project Structure

```text
Supply-Chain-Analysis-SQL-Python_PowerBI
│
├── README.md
├── .gitignore
├── Supply Chain Analysis Report.pdf
│
│
├── notebooks/                         # Python notebooks
│   └── supply_chain_eda.ipynb
│
├── scripts/                           # Python scripts
│   └── supply_chain_analysis.py
│
├── sql/                               # SQL queries
│   └── supply_chain_analysis.sql
│
├── dashboard/                         # Power BI dashboard
│   └── supply_chain_dashboard.pbix
│
└── images/                             # Dashboard screenshots
    └── dashboard.png
```

---

## Data Cleaning & Preparation

The dataset was initially prepared using Microsoft Excel and subsequently imported into MySQL for analysis.

The data preparation process included:

- Checked the dataset for missing and duplicate records.
- Verified column names and data types.
- Checked numerical fields for consistency.
- Validated product, supplier, inventory, and shipping information.
- Prepared the dataset for SQL analysis and Python EDA.
- Imported the cleaned dataset into Power BI for dashboard development.

**Data Quality Summary:**
- Total records: 100
- Total columns: 24
- Missing values: None identified in the working dataset
- Duplicate records: None identified in the working dataset

---

## Exploratory Data Analysis (EDA)

Python was used to explore the dataset and understand patterns across product categories, inventory, suppliers, manufacturing, shipping, and quality.

Key areas of analysis included:

**Product Performance:**
- Compared revenue and units sold across product categories.
- Analyzed average product prices.
- Identified the highest-revenue product category.

**Inventory Analysis:**
- Examined stock levels and product availability.
- Classified inventory into critical, low, moderate, and high stock categories.
- Identified products that may require inventory attention.

**Supplier & Manufacturing Analysis:**
- Compared average manufacturing costs across suppliers.
- Examined supplier lead times.
- Evaluated manufacturing performance indicators.

**Shipping & Logistics:**
- Compared shipping times across transportation modes.
- Analyzed shipping carriers and transportation costs.
- Identified differences in delivery speed and shipping expenses.

**Quality Analysis:**
- Compared defect rates across product categories.
- Examined product inspection results.
- Identified categories requiring further quality attention.

---

## Research Questions & Key Findings

### 1. Product Category Performance
- Skincare generated the highest revenue of **$241,628.16**.
- Haircare generated revenue of **$174,455.39**.
- Cosmetics generated revenue of **$161,521.27**.
- Cosmetics had the highest average product price of **$57.36**.

### 2. Inventory Management
- 17% of product records were classified as critical stock.
- 16% were classified as low stock.
- 32% had moderate stock levels.
- 35% had high stock levels.
- Overall, **33% of records fell under critical or low stock categories**, indicating potential inventory replenishment priorities.

### 3. Supplier & Manufacturing Analysis
- Supplier 4 had the highest average manufacturing cost of **$62.71**.
- Supplier 1 had 27 product records in the dataset.
- Supplier performance was evaluated using manufacturing costs and lead-time indicators.

### 4. Shipping & Transportation Analysis
- Road transportation had the lowest average shipping time of **4.72 days**.
- Air transportation had an average shipping time of **5.12 days**.
- Sea transportation had the highest average shipping time of **7.12 days**.
- Sea transportation had the lowest average shipping cost among the transportation modes analyzed.

### 5. Product Quality Analysis
- Haircare had the highest average defect rate of approximately **2.48%**.
- Skincare had an average defect rate of approximately **2.34%**.
- Cosmetics had the lowest average defect rate of approximately **1.92%**.
- Out of 100 records, 36 had failed inspections, 41 were pending, and 23 had passed.

---

## Dashboard

An interactive Power BI dashboard was developed to present the key performance indicators and findings from the analysis.

The dashboard includes:

**Key Performance Indicators (KPIs):**
- Total Revenue
- Total Products
- Total Units Sold
- Average Defect Rate
- Average Shipping Time
- Average Stock Level

**Dashboard Visualizations:**
- Revenue by Product Category
- Inventory Status Distribution
- Average Defect Rate by Product Category
- Supplier and Manufacturing Analysis
- Shipping and Transportation Analysis
- Geographical Distribution Map

**Interactive Filters:**
- Product Category
- Supplier Name
- Shipping Carrier
- Transportation Mode
- Location
- Inspection Results

### Dashboard Preview

![Supply Chain Power BI Dashboard](images/dashboard.png)

[View Supply Chain Dashboard](images/dashboard.png)

---

## How to Run This Project

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/supply-chain-analysis.git
```

Replace `yourusername` with your GitHub username and `supply-chain-analysis` with your repository name.

### 2. Navigate to the Project Folder

```bash
cd supply-chain-analysis
```

### 3. Install Required Python Libraries

```bash
pip install -r requirements.txt
```

### 4. Load the Dataset into MySQL

- Open MySQL Workbench.
- Create the database.
- Import the dataset.
- Execute the SQL queries available in the `sql/` folder.

### 5. Run Python Analysis

Open the Jupyter Notebook:

```text
notebooks/supply_chain_eda.ipynb
```

Run the notebook cells to perform Exploratory Data Analysis.

### 6. Open the Power BI Dashboard

Open the following file using Power BI Desktop:

```text
dashboard/supply_chain_dashboard.pbix
```

Explore the dashboard using the available KPIs, charts, and interactive slicers.

---

## Final Recommendations

Based on the analysis, the following recommendations can help improve supply chain operations:

- **Inventory Optimization:** Monitor critical and low-stock products to support timely replenishment.
- **Product Performance:** Focus on high-revenue categories while evaluating opportunities to improve lower-performing categories.
- **Supplier Evaluation:** Regularly compare supplier manufacturing costs and lead times before making purchasing decisions.
- **Shipping Optimization:** Evaluate transportation modes based on the trade-off between delivery time and shipping cost.
- **Quality Improvement:** Investigate the higher defect rate in haircare products and review failed inspection records.
- **Inspection Management:** Prioritize pending inspections to obtain a clearer picture of product quality.

---

## Author & Contact

**Name:** __________________________

**Role:** Aspiring Data Analyst

**Email:** __________________________

**LinkedIn:** __________________________

**GitHub:** __________________________

**Portfolio:** __________________________
```

**A few important points before uploading:**

1. The folder structure above is a suggested GitHub structure based on your reference. Make sure the actual files and folder names in your repository match it.
2. Replace `yourusername` in the clone command with your GitHub username.
3. Add your actual Power BI dashboard screenshot at `images/dashboard.png`.
4. Your dataset has no transaction-date field suitable for time-series analysis, so I have not included monthly or seasonal trend claims.
5. Your analysis does not contain profit-margin calculations, so the README focuses on revenue, costs, inventory, logistics, and quality rather than claiming profitability analysis.
