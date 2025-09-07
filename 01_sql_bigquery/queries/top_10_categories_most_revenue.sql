SELECT products.category,  ROUND(SUM(order_items.sale_price), 2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.products` as products 
JOIN `bigquery-public-data.thelook_ecommerce.order_items` as order_items
ON products.id = order_items.product_id
WHERE order_items.status = 'Complete'
GROUP BY products.category
ORDER BY total_revenue DESC
LIMIT 10