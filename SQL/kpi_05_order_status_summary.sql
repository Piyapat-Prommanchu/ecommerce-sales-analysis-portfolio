/* ===============================================================
   KPI 05: Order Status Summary
   Business Question:
   What is the share of completed, cancelled, and returned orders?
   =============================================================== */
   
   select 
          order_status,
		  count ( * ) as number_of_order,
		  round ( count ( * ) * 100.0 / sum ( count ( * ) ) over ( ), 2 ) as order_shere_pct
   from   orders
   group by order_status
   order by number_of_order desc ;

/*
    Insight:
    - 85.6% of orders were completed.
    - 7.0% were cancelled and 7.4% were returned.
    - Completed orders remain the dominant order status.
*/