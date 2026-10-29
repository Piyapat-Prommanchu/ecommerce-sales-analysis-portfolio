/* ======================================
   KPI 01: Overall Sales Performance
   Business Question:
   How many completed orders did we have,
   and what was the total revenue?
   ======================================*/

   select 
          count ( distinct order_id ) as total_order,
          sum ( sales_amount ) as total_revenue
   from   orders
   where  order_status = 'completed' ;

/* 
   Insight:
   - Completed orders: 428
   - Total revenue: 2,736,413.66
*/

/* ================================================
   KPI 01b: Average Order Value
   Business Question:
   What is the average revenue per completed order?
   ================================================ */

   select 
          count ( distinct order_id ) as total_order,
		  sum ( sales_amount ) as total_revenue,
          round ( sum ( sales_amount ) * 1.0 / count ( distinct order_id ), 2 ) as aov
   from   orders
   where  order_status = 'completed' ;
   
/*
   Insight:
   - There were 428 completed orders.
   - Total revenue from completed orders was 2,736,413.66.
   - Average order value was 6,393.43.
*/