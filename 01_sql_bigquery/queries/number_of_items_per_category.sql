SELECT products.category, COUNT(products.id) as total_products
FROM `bigquery-public-data.thelook_ecommerce.products` as products 
GROUP BY products.category
ORDER BY total_products DESC
