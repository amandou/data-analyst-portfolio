SELECT
  order_items.product_id,
  products.name,
  products.category,
  SUM(order_items.sale_price) AS total_revenue
FROM
  `bigquery-public-data.thelook_ecommerce.products` AS products
JOIN
  `bigquery-public-data.thelook_ecommerce.order_items` AS order_items
ON
  products.id = order_items.product_id
WHERE
  order_items.status = 'Complete'
GROUP BY
  order_items.product_id,
  products.name,
  products.category
ORDER BY
  total_revenue DESC
LIMIT
  10