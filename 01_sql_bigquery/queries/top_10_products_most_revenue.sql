SELECT order_items.product_id, products.name, products.category, COUNT(*) AS total_orders
FROM `bigquery-public-data.thelook_ecommerce.products` as products 
JOIN `bigquery-public-data.thelook_ecommerce.order_items` as order_items
ON products.id = order_items.product_id
GROUP BY order_items.product_id, products.name, products.category
ORDER BY total_orders DESC
LIMIT 10

