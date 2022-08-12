-- Top 10 movies by revenue

SELECT  A.title AS title, 
		A. rating AS rating,
		C.name AS genre, 
		SUM(E.amount) AS total_movie_revenue
FROM film A
INNER JOIN film_category B ON A.film_id = B.film_id
INNER JOIN category C ON B.category_id = C.category_id
INNER JOIN inventory F ON A.film_id = F.film_id
INNER JOIN rental D ON F.inventory_id = D.inventory_id
INNER JOIN payment E ON D.rental_id = E.rental_id
GROUP BY A.film_id, A.title, A. rating, C.name
ORDER BY total_movie_revenue DESC
LIMIT 10;

-- Top 10 customers by country

SELECT A. customer_id, 
	   A.first_name, 
	   A.last_name, 
	   C.city, 
	   D.country,SUM(amount) AS total_amount_paid
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_ID = D.country_ID
INNER JOIN payment E ON A.customer_id = E.customer_id
GROUP BY A.customer_id, C.city, D. country
ORDER BY total_amount_paid DESC
LIMIT 10;

-- Customers & revenue per country

SELECT country,
       COUNT(A.customer_id) AS customer_count,
       SUM(amount) AS total_revenue
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_ID = D.country_ID
INNER JOIN payment E ON a.customer_id = E.customer_id
GROUP BY country
ORDER BY total_revenue DESC;

-- Number of movies & revenue by genre

SELECT C.name AS genre,
	   COUNT(A.film_id) AS count_of_films,
	   SUM(E.amount) AS total_film_revenue
FROM film A
INNER JOIN film_category B ON A.film_id = B.film_id
INNER JOIN category C ON B.category_id = C.category_id
INNER JOIN inventory F ON A.film_id = F.film_id
INNER JOIN rental D ON F.inventory_id = D.inventory_id
INNER JOIN payment E ON D.rental_id = E.rental_id
GROUP BY C.name
ORDER BY total_film_revenue DESC;

-- Number of movies and revenue by rating

SELECT A.rating AS rating, 
	   COUNT(A.film_id) AS number_of_films, 
	   SUM(E.amount) AS total_film_revenue
FROM film A
INNER JOIN film_category B ON A.film_id = B.film_id
INNER JOIN category C ON B.category_id = C.category_id
INNER JOIN inventory F ON A.film_id = F.film_id
INNER JOIN rental D ON F.inventory_id = D.inventory_id
INNER JOIN payment E ON D.rental_id = E.rental_id
GROUP BY A. rating
ORDER BY total_film_revenue DESC;

-- Bottom 10 movies by revenue

SELECT  A.title AS title, 
		A. rating AS rating,
		C.name AS genre, 
		SUM(E.amount) AS total_movie_revenue
FROM film A
INNER JOIN film_category B ON A.film_id = B.film_id
INNER JOIN category C ON B.category_id = C.category_id
INNER JOIN inventory F ON A.film_id = F.film_id
INNER JOIN rental D ON F.inventory_id = D.inventory_id
INNER JOIN payment E ON D.rental_id = E.rental_id
GROUP BY A.film_id, A.title, A. rating, C.name
ORDER BY total_movie_revenue ASC
LIMIT 10;

-- Descriptive statistics film

SELECT MIN(rental_rate) AS min_renatl_rate,
	   MAX(rental_rate) AS max_rental_rate,
	   AVG(rental_rate) AS avg_renatal_rate,
	   MIN(rental_duration) AS min_rental_duration,
	   MAX(rental_duration) AS max_rental_duration,
	   AVG(rental_duration) AS avg_rental_duration,
	   MIN(length) AS min_length,
	   MAX(length) AS max_length,
	   AVG(length) AS avg_length,
	   MIN(replacement_cost) AS min_replacement_cost,
	   MAX(replacement_cost) AS max_replacement_cost,
	   AVG(replacement_cost) AS avg_replacement_cost
FROM film;
