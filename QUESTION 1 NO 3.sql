--QUESTION 1 NO 3--
SELECT t1.category_name,
              t1.percentile, 
              COUNT(*) AS film_count
FROM (SELECT  f.title AS title,
	          c.name AS category_name,
	          f.rental_duration AS rentals, 
	          NTILE(4) OVER ( ORDER BY f.rental_duration) AS percentile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON fc.film_id = f.film_id
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')) t1
GROUP BY 1,2
ORDER BY 2,1;