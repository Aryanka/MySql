# A
SELECT 
    sales_rep_id, (COUNT(i.id) / COUNT(o.id)) AS conversion_rate
FROM
    orders AS o
        INNER JOIN
    item_details AS i ON o.item_id = i.item_id
        JOIN
    sales_rep AS s ON o.sales_rep_id = s.sales_rep_id
GROUP BY region , conversion_rate DESC;

# B
SELECT 
    city
FROM
    customers AS c
        JOIN
    orders AS o ON c.id = o.cust_id
WHERE
    MONTH(o.date) = 10
GROUP BY state;

# C
SELECT 
     city
FROM
    orders AS o
        JOIN
    customers AS c ON c.id = o.cust_id
        JOIN
    item_details AS i ON o.sales_rep_id = i.id
GROUP BY item_id , mode
ORDER BY COUNT(i.id) DESC;

# D
SELECT 
    i.name, i.id
FROM
    item_details AS i
        JOIN
    orders AS o ON i.id = o.item_id
ORDER BY (i.mrp - o.selling_price) DESC;

# E
SELECT 
    *
FROM
    customers,
    item_details AS i
WHERE
    COUNT(DISTINCT i.type) > 5;
    
    
