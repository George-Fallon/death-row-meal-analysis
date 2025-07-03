WITH categorised_meals AS (
  SELECT
    date,
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
  FROM death_row_meal -- categories 
)

SELECT 
  EXTRACT(YEAR FROM date) AS year, 
  meal_category,
  COUNT(*) AS total_requests -- counts requests per meal category
FROM categorised_meals
GROUP BY year, meal_category
ORDER BY year, total_requests DESC;
