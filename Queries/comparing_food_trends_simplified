-- Categorise each meal into a food category
WITH categorised_meals AS (
  SELECT
    EXTRACT(YEAR FROM date) AS year,  -- Extract year from date field
    CASE 
      WHEN meal ILIKE '%decline%' OR meal ILIKE '%no final meal request%' OR meal ILIKE '%no meal%' THEN 'Refused Meal'
      WHEN meal ILIKE '%ice cream%' OR meal ILIKE '%cake%' THEN 'Dessert'
      WHEN meal ILIKE '%fries%' OR meal ILIKE '%chips%' THEN 'Side Dish'
      WHEN meal ILIKE '%cheeseburger%' OR meal ILIKE '%sandwich%' OR meal ILIKE '%pizza%' THEN 'Fast Food'
      WHEN meal ILIKE '%fried%' OR meal ILIKE '%steak%' OR meal ILIKE '%chicken%' OR meal ILIKE '%sausage%' OR meal ILIKE '%shrimp%' OR meal ILIKE '%fish%' THEN 'Main Meal'
      WHEN meal ILIKE '%oatmeal%' OR meal ILIKE '%eggs%' THEN 'Breakfast Item'
      WHEN meal ILIKE '%coffee%' OR meal ILIKE '%milk%' OR meal ILIKE '%tea%' OR meal ILIKE '%water%' OR meal ILIKE '%coke%' OR meal ILIKE '%dr pepper%' THEN 'Drink'
      WHEN meal ILIKE '%soup%' OR meal ILIKE '%cheese%' THEN 'Starter/Side'
      ELSE 'Other'
    END AS meal_category
  FROM death_row_meal
),

-- Count how many times each category appears per year
category_counts AS (
  SELECT
    year,
    meal_category,
    COUNT(*) AS category_count
  FROM categorised_meals
  GROUP BY year, meal_category
),

-- Total number of meals requested per year (to calculate %)
year_totals AS (
  SELECT
    year,
    COUNT(*) AS total_requests
  FROM categorised_meals
  GROUP BY year
)

-- Combine counts and totals and calculate percentage
SELECT
  c.year,
  c.meal_category,
  c.category_count,
  ROUND(c.category_count * 100.0 / y.total_requests, 1) AS pct_of_year_total
FROM category_counts c
JOIN year_totals y ON c.year = y.year
ORDER BY c.year, c.meal_category;
