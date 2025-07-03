SELECT
  EXTRACT(YEAR FROM date) AS year,
  COUNT(*) AS total_requests
FROM death_row_meal
GROUP BY year
ORDER BY total_requests DESC
LIMIT 3;
