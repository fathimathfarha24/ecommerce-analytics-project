# E-Commerce Analytics Project

## 📌 Project Overview

This is an end-to-end E-Commerce Analytics project developed using SQL, Power BI, and Python.

The project focuses on analyzing e-commerce data to understand sales performance, products, sellers, customers, payments, deliveries, reviews, and customer behavior.

---

## Tools & Technologies

- MySQL
- Power BI
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- Jupyter Notebook

---

## Dataset

This project uses the Brazilian E-Commerce Public Dataset by Olist from Kaggle.

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

Download the CSV files from Kaggle and place them in a Dataset/ folder in the project root before running the SQL or Python scripts. The dataset is not included in this repository.

---

# 🔄 Project Workflow

SQL
↓
Data Analysis & Business Queries
↓
Power BI
↓
Interactive Business Dashboard
↓
Python
↓
Advanced Customer Analytics

---

# 1. SQL Analysis

The SQL section focuses on data analysis and business-oriented queries.

### Topics Covered

- Data exploration
- Joins
- Subqueries
- CTEs
- Window Functions
- Ranking
- Running Totals
- SQL Views
- Business Analysis

---

# 2. Power BI Dashboard

The Power BI section converts the analysis into an interactive business intelligence dashboard.

### Dashboard Sections

- Executive Dashboard
- Product Analytics
- Seller Analytics
- Payment Analytics
- Delivery Analytics
- Review Analytics

### Power BI Features

- DAX Measures
- Slicers
- Drillthrough
- Report Tooltips
- Page Navigation
- Interactive Visualizations
- Power Query
- Data Modeling

### Screenshots

![Executive Summary](Power%20BI/Screenshots/Executive%20Summary.png)

![Customer Analytics](Power%20BI/Screenshots/Customer%20analytics.png)

![Product Analytics](Power%20BI/Screenshots/Product%20analytics.png)

![Seller Analytics](Power%20BI/Screenshots/Seller%20analytics.png)

![Payment Analytics](Power%20BI/Screenshots/Payment%20analytics.png)

![Delivery Analytics](Power%20BI/Screenshots/Delivery%20analytics.png)

![Review Analytics](Power%20BI/Screenshots/Review%20analytics.png)

![Drill Through - Category Details](Power%20BI/Screenshots/Drill%20through%20Category%20details.png)

![Tooltip - Customer](Power%20BI/Screenshots/Tooltip-Customer.png)

---

# 3. Python Analytics

Python is used for advanced analytics beyond the SQL and Power BI analysis.

### Analysis Covered

- Data Preparation
- Feature Engineering
- Exploratory Data Analysis
- RFM Analysis
- Customer Segmentation
- K-Means Clustering
- Customer Lifetime Value
- Revenue Analysis
- Advanced Visualizations

---

# 📁 Repository Structure

```text
E-Commerce-Analytics/
│
├── SQL/
│       database_setup.sql
├──     constraints.sql
├──     data_cleaning.sql
├──     data_validation.sql
├──     basic_kpi.sql
├──     sales_analytics.sql
├──     revenue_analytics.sql
├──     product_analytics.sql
├──     customer_analytics.sql
├──     seller_analytics.sql
├──     payment_analytics.sql
├──     delivery_analytics.sql
└──     view.sql
│
├── PowerBI/
│   ├── Ecommerce analytics.pbip
│   ├── Ecommerce analytics.Report/
│   ├── Ecommerce analytics.SemanticModel/
│   └── Screenshots/
│
├── Python/
│   ├── olist_analysis.ipynb
│   ├── requirements.txt
│   ├── figures/
│   ├── tables/
│   └── outputs/
│
├── README.md
└── .gitignore
