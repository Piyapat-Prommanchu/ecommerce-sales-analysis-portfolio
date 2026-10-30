# E-commerce Sales Performance Analysis

### Project Overview
        This project focuses on analyzing sales performance and consumer purchasing behavior from 2024 to 2025, utilizing a dataset of 500 order records across 50 customers and 20 product items. The workflow began with using SQL for data extraction and transformation to compute key business metrics, followed by Power BI to design interactive dashboards that display growth statistics and support data-driven business decisions.

## Business Questions
1. How much revenue did completed orders generate?
2. How did revenue change by month?
3. Which product categories generated the most revenue?
4. Which customer regions generated the most revenue?

## Dataset Information
- Source: AI-generated synthetic e-commerce dataset (mock data created for analysis practice)
- Timeframe: 2024–2025
- Scope: 500 Orders, 50 Customers, and 20 Products

## Tools & Technologies
- SQL (JOINs, aggregations, date functions, window functions)
- SQLite
- Power BI (data visualization)
- DAX (KPI measures, calculated columns)
- Excel (basic data exploration)

# Dashboard Overview

<img width="3977" height="2236" alt="01_dashboard_overview" src="https://github.com/user-attachments/assets/1f8b63d7-0a11-4fa9-bf1b-3bd9f4d0c04b" />

## Dashboard Summary
        An interactive Power BI dashboard tracking e-commerce performance for 2024–2025, consolidating key metrics into a single view. The business generated 2.74M THB in Total Revenue from 428 completed orders, with an Average Order Value (AOV) of 6,393.49 THB. Electronics emerged as the top-performing category (~1.12M THB), while Bangkok led all regions in sales (~843.66K THB).

## Note : 
- Revenue and average order value include completed orders only.
- Region refers to the customer's region, not the shipping location.

## Key Findings

### 1. How much revenue did completed orders generate?
- Total Revenue: 2,736,413.66 THB generated across 428 completed orders
- Average Order Value (AOV): 6,393.49 THB per transaction

### 2. How did revenue change by month?
- Monthly Revenue Trends: Sales peaked significantly in July 2025 (over 200K THB) and August–September 2024 (~190K–200K THB), while experiencing temporary dips around May 2024 and June 2025.

### 3. Which product categories generated the most revenue?
- Top Product Category: Electronics generated the highest sales (1.12M THB), followed by Beauty (662.07K THB) and Fashion (657.16K THB)

### 4. Which customer regions generated the most revenue?
- Top Performing Region: Bangkok led regional revenue with 843.66K THB, followed by the North (486.90K THB) and South (474.97K THB)

### Note :
- Dashboard Features: Includes interactive year filtering (2024–2025) and monthly revenue trend analysis to monitor sales growth   

# Business Recommendations 
1. Capitalize on Core Categories: Double down on Electronics (top revenue generator) through bundled deals with Beauty/Fashion items.
2. Optimize Non-Core Categories: Perform SKU rationalization for lower-performing categories (Home & Sports). Reduce holding costs on slow-moving inventory through clearance sales, and reallocate working capital toward high-margin core products.
3. Increase AOV: Implement tiered discounts (e.g., spend 7,500 THB to get a discount) to push the current average order value above 6,393 THB.
4. Seasonality Management: Prepare heavy marketing budgets ahead of Q3 peaks (July–September) and introduce Mid-Year campaigns in May–June to smooth out seasonal dips.
5. Regional Expansion: Maintain Bangkok's market share while launching targeted regional campaigns (Free Shipping/Local Ads) to boost non-Bangkok sales.  

# Project Structure

```text
ecommerce-sales-portfolio/
│
├── data/
│   ├── E-commerce Sales Performance Analysis.db
│
├── sql/
│   ├── all_kpi_sales_performance_analysis.sql
│   ├── kpi_01_overall_sales_performance.sql
│   ├── kpi_02_revenue_by_month.sql
│   ├── kpi_03_revenue_by_category.sql
│   └── kpi_04_revenue_by_region.sql
│
├── powerbi/
│   └── ecommerce_sales_performance_dashboard.pbix
│
├── images/
│   ├── 01_dashboard_overview.png
│   ├── 02_revenue_by_month.png
│   ├── 03_revenue_by_category.png
│   ├── 04_revenue_by_region.png
│   ├── 05_total_revenue.png
│   ├── 06_completed_orders.png
│   ├── 07_average_order_value.png
│   ├── 08_interactive_filter.png
│   └── 09_data_model.png
│
└── README.md
```

# Data Model

<img width="855" height="334" alt="09_data_model" src="https://github.com/user-attachments/assets/18109ba2-c47c-47e7-b117-6dc39570780c" />

## Designed based on the Star Schema architecture to optimize data processing and filtering performance in Power BI:

## Dimension Tables & Relationships:
  - `products` --> `orders`: Joined via `product_id` to filter data by product category.
  - `customers` --> `orders`: Joined via `customer_id` to filter data by region and customer segment.

## Conclusion

This project demonstrates the ability to:
- Write SQL queries to analyze e-commerce data.
- Build an efficient Star Schema data model in Power BI for dynamic analysis.
- Design clear and intuitive dashboards to visualize key business metrics.
- Translate complex data into actionable business recommendations.

          Key findings across sales performance (2.7M+ THB Revenue), product categories, regional performance, 
and seasonality trends highlight critical opportunities in core product focus, inventory optimization, 
and regional expansion. These insights showcase how combining SQL with Power BI can directly support 
data-driven decision-making and business growth.

# Author
- Name : PIYAPAT PROMMANCHU
- Role: Junior Data Analyst (Aspiring)
- Skills: SQL, Data Analysis, Power BI


