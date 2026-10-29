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
   - Lowest monthly revenue: May 2024 at 58,069.51
   - Highest monthly revenue: July 2025 at 205,381.45
   - Revenue shows month-to-month variation across 2024-2025.
*/
