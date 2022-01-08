--QUESTION 2 NO 2--
SELECT DATE_TRUNC('MONTH', p.payment_date) AS MONTH,
              first_name || ' ' || last_name AS name, 
             COUNT(p.amount) As count,
             SUM(p.amount) total_amt 
FROM customer c
JOIN payment p
ON p.customer_id = c.customer_id
WHERE p.payment_date BETWEEN '2007-01-01' AND '2008-01-01' AND  c.first_name || ' ' || c.last_name in (SELECT full_name from (SELECT c.first_name || ' ' || c.last_name AS full_name, SUM(p.amount)
FROM customer c
JOIN payment p
ON p.customer_id = c.customer_id
GROUP BY 1 ORDER BY 2 DESC LIMIT 10) t1)
GROUP BY 1,2
ORDER BY 2,1,3;

