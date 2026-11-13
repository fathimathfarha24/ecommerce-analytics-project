# E-Commerce Analytics Project

## 📌 Project Overview

An end-to-end e-commerce analytics project built with SQL, Power BI, and Python.

The project analyzes e-commerce data to understand sales performance, products, sellers, customers, payments, deliveries, reviews, and customer behavior.

---

## 🛠️ Tools & Technologies

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

## 📊 Dataset

This project uses the Brazilian E-Commerce Public Dataset by Olist from Kaggle.

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

Download the CSV files from Kaggle and place them in a `Dataset/` folder in the project root before running the SQL or Python scripts. The dataset is not included in this repository.

---

## 🔄 Project Workflow

```text
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
```

---

## 1. SQL Analysis

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

## 2. Power BI Dashboard

The Power BI section converts the analysis into an interactive business intelligence dashboard. The project is saved in Power BI Project (`.pbip`) format, so report and model changes are tracked as text in Git.

### Dashboard Sections

- Executive Summary
- Customer Analytics
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

![Executive Summary](Power%20BI/Screenshots/Executive_summary.png)

![Customer Analytics](Power%20BI/Screenshots/Customer_analytics.png)

![Product Analytics](Power%20BI/Screenshots/Product_analytics.png)

![Seller Analytics](Power%20BI/Screenshots/Seller_analytics.png)

![Payment Analytics](Power%20BI/Screenshots/Payment_analytics.png)

![Delivery Analytics](Power%20BI/Screenshots/Delivery_analytics.png)

![Review Analytics](Power%20BI/Screenshots/Review_analytics.png)

![Drill Through - Category Details](Power%20BI/Screenshots/Category_details_drill_through.png)

![Tooltip - Customer](Power%20BI/Screenshots/Tooltip_customer.png)

---

## 3. Python Analytics

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

## 📁 Repository Structure

```text
E-Commerce-Analytics/
│
├── SQL/
│   ├── database_setup.sql
│   ├── constraints.sql
│   ├── data_cleaning.sql
│   ├── data_validation.sql
│   ├── basic_kpi.sql
│   ├── sales_analytics.sql
│   ├── revenue_analytics.sql
│   ├── product_analytics.sql
│   ├── customer_analytics.sql
│   ├── seller_analytics.sql
│   ├── payment_analytics.sql
│   ├── delivery_analytics.sql
│   └── view.sql
│
├── Power BI/
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
```

---

## ▶️ How to Run

1. Download the Olist dataset from Kaggle and place the CSV files in a `Dataset/` folder in the project root.
2. **SQL:** run the scripts in the `SQL/` folder in the order listed above, starting with `database_setup.sql`.
3. **Power BI:** open `Power BI/Ecommerce analytics.pbip` in Power BI Desktop with the Power BI Project preview feature enabled.
4. **Python:** install the dependencies and open the notebook.

```bash
pip install -r Python/requirements.txt
jupyter notebook Python/olist_analysis.ipynb
```

---

## 👤 Author

**Fathimath Farha**

GitHub: [fathimathfarha24](https://github.com/fathimathfarha24)