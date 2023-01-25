--Week 5 - Wednesday Questions

--1. List all customers who live in Texas (use JOINs)
select first_name, last_name, district
from customer
inner join address
on address.address_id = customer.address_id 
where district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from payment
inner join customer 
on customer.customer_id = payment.customer_id 
where amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175.00
);

--4. List all customers that live in Nepal (use the city table)
select first_name, last_name, country
from customer
inner join address
on address.address_id = customer.address_id 
inner join city 
on city.city_id = address.city_id 
inner join country 
on country.country_id = city.country_id 
where country = 'Nepal';

--5. Which staff member had the most transactions?
select COUNT(payment_id), staff_id 
from payment
group by staff_id
order by count(payment_id) DESC
fetch first row ONLY

--6. How many movies of each rating are there?
select COUNT(title), rating 
from film
group by rating 

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    having count(amount) = 1);
  
--8. How many FREE rentals did our store give away?
  select COUNT(amount) 
  from payment 
  where amount = 0.00
  
   