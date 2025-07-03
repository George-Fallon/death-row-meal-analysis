-- Categorise each meal into a category
WITH categorised_meals AS (
  SELECT
    EXTRACT(YEAR FROM date) AS year,
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

-- Count total requests and category-specific counts per year
counts AS (
  SELECT 
    year,
    SUM(CASE WHEN meal_category = 'Refused Meal' THEN 1 ELSE 0 END) AS refused_meal_count,
    SUM(CASE WHEN meal_category = 'Dessert' THEN 1 ELSE 0 END) AS dessert_count,
    SUM(CASE WHEN meal_category = 'Side Dish' THEN 1 ELSE 0 END) AS side_dish_count,
    SUM(CASE WHEN meal_category = 'Fast Food' THEN 1 ELSE 0 END) AS fast_food_count,
    SUM(CASE WHEN meal_category = 'Main Meal' THEN 1 ELSE 0 END) AS main_meal_count,
    SUM(CASE WHEN meal_category = 'Breakfast Item' THEN 1 ELSE 0 END) AS breakfast_item_count,
    SUM(CASE WHEN meal_category = 'Drink' THEN 1 ELSE 0 END) AS drink_count,
    SUM(CASE WHEN meal_category = 'Starter/Side' THEN 1 ELSE 0 END) AS starter_side_count,
    SUM(CASE WHEN meal_category = 'Other' THEN 1 ELSE 0 END) AS other_count,
    COUNT(*) AS total_requests
  FROM categorised_meals
  GROUP BY year
)

-- Output year, counts, and percentages for each category
SELECT
  year,
  refused_meal_count,
  ROUND(refused_meal_count * 100.0 / total_requests, 1) AS refused_meal_pct,
  dessert_count,
  ROUND(dessert_count * 100.0 / total_requests, 1) AS dessert_pct,
  side_dish_count,
  ROUND(side_dish_count * 100.0 / total_requests, 1) AS side_dish_pct,
  fast_food_count,
  ROUND(fast_food_count * 100.0 / total_requests, 1) AS fast_food_pct,
  main_meal_count,
  ROUND(main_meal_count * 100.0 / total_requests, 1) AS main_meal_pct,
  breakfast_item_count,
  ROUND(breakfast_item_count * 100.0 / total_requests, 1) AS breakfast_item_pct,
  drink_count,
  ROUND(drink_count * 100.0 / total_requests, 1) AS drink_pct,
  starter_side_count,
  ROUND(starter_side_count * 100.0 / total_requests, 1) AS starter_side_pct,
  other_count,
  ROUND(other_count * 100.0 / total_requests, 1) AS other_pct
FROM counts
ORDER BY year;
