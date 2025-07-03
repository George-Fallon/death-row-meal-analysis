SELECT 
  CASE 
    WHEN meal ILIKE '%declined a final meal%' OR meal ILIKE '%no final meal%' OR meal ILIKE '%no meal%' THEN 'No Meal'
    WHEN meal ILIKE '%ice cream%' OR meal ILIKE '%cake%' OR meal ILIKE '%oatmeal%' THEN 'Dessert'
    WHEN meal ILIKE '%fried%' OR meal ILIKE '%fries%' THEN 'Fried Food'
    WHEN meal ILIKE '%chicken%' OR meal ILIKE '%sausage%' OR meal ILIKE '%shrimp%' OR meal ILIKE '%eggs%' THEN 'Poultry/Seafood'
    WHEN meal ILIKE '%steak%' THEN 'Steak'
    WHEN meal ILIKE '%coke%' OR meal ILIKE '%dr pepper%' OR meal ILIKE '%tea%' OR meal ILIKE '%coffee%' OR meal ILIKE '%milk%' THEN 'Soft Drink'
    ELSE 'Other'
  END AS meal_category,
  COUNT(*) AS total_requests
FROM death_row_meal
GROUP BY meal_category
ORDER BY total_requests DESC;
