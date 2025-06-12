# link to problem - 

# product table, each record represents a product with a certain price from start to end 
# Each unittssold contains a product that was purchased ona a certain date in a unique quantity 

SELECT p.product_id, COALESCE(ROUND((SUM(price * units) / SUM(units)), 2), 0) AS average_price
FROM Prices p 
LEFT JOIN Unitssold u
ON u.product_id = p.product_id 
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY product_id
