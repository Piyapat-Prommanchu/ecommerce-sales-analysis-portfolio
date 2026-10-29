/* =====================================================
   KPI 03: Revenue by Product Category
   Business Question:
   Which product categories generate the highest revenue
   and how many completed orders do they have?
   ===================================================== */

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