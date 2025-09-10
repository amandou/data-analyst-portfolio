SELECT
  users.country,
  COUNT(DISTINCT users.id) AS total_users
FROM
  `bigquery-public-data.thelook_ecommerce.users` AS users
GROUP BY
  1
ORDER BY
  total_users DESC
LIMIT
  10