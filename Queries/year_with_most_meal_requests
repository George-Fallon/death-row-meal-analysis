WITH yearly_request_counts AS (
  SELECT
    EXTRACT(YEAR FROM date) AS year,  -- Extract the year from the date field
    COUNT(*) AS total_requests        -- Count how many requests happened in that year
  FROM death_row_meal
  GROUP BY year
)

, ranked_years AS (
  SELECT
    year,
    total_requests,
    RANK() OVER (ORDER BY total_requests DESC) AS rnk  -- Rank years from highest to lowest
  FROM yearly_request_counts
)

SELECT
  year,
  total_requests
FROM ranked_years
WHERE rnk <= 3               -- Only include top 3 years
ORDER BY total_requests DESC;
