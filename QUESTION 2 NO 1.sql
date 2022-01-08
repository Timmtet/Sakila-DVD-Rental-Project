--QUESTION 2 NO 1--
SELECT    DATE_PART('MONTH', rentals) AS month,
                 DATE_PART('YEAR', rentals) AS year,
                 store_id,
                COUNT(*),
                month || '-' || year AS date 
FROM (SELECT DATE_PART('MONTH', r.rental_date) AS month,
              	         DATE_PART('YEAR', r.rental_date) AS year,
	         r.rental_date AS rentals,
	         st.store_id AS store_id
FROM rental r
JOIN staff s
ON r.staff_id = s.staff_id
JOIN store st
ON s.store_id = st.store_id )t1
GROUP BY 1,2,3,5
ORDER BY 1,2,4 DESC;