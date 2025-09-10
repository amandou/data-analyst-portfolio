-- Calculate quantity of products in inventory
WITH stock_quantity AS (
SELECT
  inventory_items.product_id,
  inventory_items.product_name,
  COUNT(inventory_items.id) as total_in_stock
FROM
  `bigquery-public-data.thelook_ecommerce.inventory_items` AS inventory_items
GROUP BY
   inventory_items.product_id, inventory_items.product_name
ORDER BY
  total_in_stock DESC
),
-- Calculate number of orders per product
demand AS(
  SELECT
  order_items.product_id,
  products.name,
  products.category,
  COUNT(*) AS total_orders
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
  total_orders DESC
)
-- Calculate quantity of orders by stock quantity
SELECT
  stock_quantity.product_id,
  stock_quantity.product_name,
  stock_quantity.total_in_stock,
  demand.total_orders,
  ROUND(demand.total_orders / stock_quantity.total_in_stock, 3) AS demand_stock_ratio
FROM stock_quantity
JOIN demand ON stock_quantity.product_id = demand.product_id
ORDER BY demand_stock_ratio DESC
LIMIT 100;

