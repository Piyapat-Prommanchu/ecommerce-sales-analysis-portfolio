/* =====================================
   E-commerce Sales Performance Analysis
   Tools: SQLite, SQL, Power BI
   Dataset: customers, products, orders
   ===================================== */

/* =====================================
   KPI 01: Overall Sales Performance
   Business Question:
   How many completed orders did we have,
   and what was the total revenue?
   ====================================== */

   select 
          count ( distinct order_id ) as total_order,
		  sum ( sales_amount ) as total_revenue,
          round ( sum ( sales_amount ) * 1.0 / count ( distinct order_id ), 2 ) as aov
   from   orders
   where  order_status = 'completed' ;

/*
   Insight:
   - There were 428 completed orders.
   - Total revenue from completed orders was 2,736,413.66
   - Average order value was 6,393.49
*/


/* ==========================================
   KPI 02: Revenue by Month
   Business Question:
   How does monthly revenue change over time?
   ========================================== */

   select 
            strftime ( '%Y-%m', order_date ) as sale_month,
		    sum ( sales_amount ) as total_revenue
   from     orders
   where    order_status = 'completed'
   group by sale_month
   order by sale_month desc;

/*
   Insight:
   - Revenue varies month to month across 2024-2025.
   - The lowest monthly revenue was 58,069.51 in May 2024.
   - The highest monthly revenue was 205,381.45 in July 2025.
   - This result supports the revenue trend chart in Power BI.
*/


/* ===================================================================
   KPI 03: Revenue by Product Category
   Business Question:
   Which product categories generate the highest revenue,
   what is their revenue share, and what is their average order value?
   =================================================================== */

   with category_sales as (
   select 
            p.category,
		    sum ( o.sales_amount ) as total_revenue,
		    count ( distinct o.order_id ) as total_order
   from     orders o
   join     products p
   on       o.product_id = p.product_id
   where    o.order_status = 'completed'
   group by p.category )
   
   select 
            category,
			total_revenue,
			total_order,
			round ( total_revenue * 100.0 / sum ( total_revenue ) over ( ), 2 ) as revenue_share_pct,
			round ( total_revenue * 1.0 / total_order, 2 ) as avg_order_value
   from     category_sales
   group by category
   order by total_revenue desc ;

/*
   Insight:
   - Electronics is the largest revenue category,
     contributing about 41% of total revenue.
   - Beauty and Fashion each contribute around 24%.
   - Home and Sports contribute only about 5-6% each.
   - Electronics has the highest average order value.
   - Sports has the lowest average order value.
*/


/* ==============================================================
   KPI 04: Revenue by Region
   Business Question:
   Which regions generate the most revenue from completed orders?
   ============================================================== */

   select 
          c.region,
		  count ( distinct o.order_id ) as completed_order,
		  sum ( o.sales_amount ) as total_revenue
   from   orders o
   join   customers c
   on     o.customer_id = c.customer_id
   where  o.order_status = 'completed'
   group by c.region 
   order by total_revenue desc ;
          
/*
   Insight:
   - Bangkok generated the highest revenue at 843,657.88
   and had the most completed orders at 124
   - North ranked second in revenue at 486,896.54,
   despite having the fewest completed orders at 71
   - Central generated the lowest revenue at 462,653.11
   from 73 completed orders.
   - Revenue across North, South, Northeast, and Central
   was relatively close, ranging from 462,653.11 to 486,896.54

   Note:
   - Region refers to the customer's region, not the shipping location.
*/


/* ==========================
   Overall Summary
   ========================== */

/*
   - Total revenue from completed orders: 2,736,413.66
   - Total completed orders: 428
   - Average order value: 6,393.49
   - Monthly revenue peaked in July 2025 at 205,381.45
   - Electronics generated the highest category revenue
     at 1,119,271.92
   - Bangkok generated the highest regional revenue
     at 843,657.88 from 124 completed orders.

   Note:
   - Revenue and average order value include completed orders only.
   - Region refers to the customer's region.
   - This project uses synthetic data for portfolio purposes.
*/