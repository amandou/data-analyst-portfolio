SELECT
  users.id, users.first_name, users.last_name, avg(order_items.sale_price) as avg_sale_price
FROM
  `bigquery-public-data.thelook_ecommerce.users` as users
JOIN `bigquery-public-data.thelook_ecommerce.order_items` as order_items
ON users.id = order_items.user_id
GROUP BY users.id, users.first_name, users.last_name
ORDER BY avg_sale_price DESC
LIMIT 10