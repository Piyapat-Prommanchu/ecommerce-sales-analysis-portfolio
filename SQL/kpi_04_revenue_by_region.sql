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