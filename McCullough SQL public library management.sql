--Aliasing tables
select * wk6_wkshop_patrons as wwp

select * wk6_wkshop_authors as wwa

select * wk6_wkshop_genres as wwg

select * wk6_wkshop_loans as wwl

select * wk6_wkshop_books as wwb

--PART 1
--Excercise 1
select publication_year, title
from wk6_wkshop_books wwb 
where publication_year > 2000
order by publication_year DESC 

--Excercise 2
select title,genre_id,copies_owned
from wk6_wkshop_books wwb
where copies_owned > 5 and genre_id = 1

--Exercise 3
select title
from wk6_wkshop_books wwb 
where title like "%History%"

--Excercise 4
select 
	wwl.loan_id,
	wwl.book_id, 
	wwl.checkout_date,
	wwl.due_date,
	wwl.patron_id,
	wwp.first_name,
	wwp.Last_name,
	wwp.email 
from wk6_wkshop_loans wwl
Join wk6_wkshop_patrons wwp on wwl.patron_id = wwp.patron_id
WHERE checkout_date BETWEEN '2023-01-01' AND '2023-01-31';

--Exercise 5
Select
	wwl.loan_id,
	wwl.checkout_date,
	wwl.due_date,
	wwb.title,
	wwb.genre_id,
	wwl.book_id, 
	wwb.book_id,
	wwb.author_id,
	wwa.author_id,
	wwa.first_name,
	wwa.last_name
from wk6_wkshop_loans wwl
Join wk6_wkshop_books wwb on wwl.book_id = wwb.book_id 
Join wk6_wkshop_authors wwa on wwb.author_id = wwa.author_id 


--Exercise 6
SELECT 
  p1.patron_id AS patron1_id,
  p1.first_name AS patron1_first,
  p1.last_name AS patron1_last,
  p2.patron_id AS patron2_id,
  p2.first_name AS patron2_first,
  p2.last_name AS patron2_last,
  p1.city
FROM wk6_wkshop_patrons p1
JOIN wk6_wkshop_patrons p2 
  ON p1.city = p2.city
  AND p1.patron_id < p2.patron_id
ORDER BY p1.city;


--Exercise 7
SELECT 
	wwl.patron_id,
	wwl.book_id,
	wwl.branch_id,
	wwp.patron_id,
	wwp.first_name,
	wwp.last_name,
	wwp.branch_id,
	wwb.book_id,
	wwb.genre_id,
	wwb.title
from wk6_wkshop_loans wwl
Join wk6_wkshop_patrons wwp on wwl.patron_id = wwp.patron_id 
join wk6_wkshop_books wwb  on wwb.book_id = wwl.book_id 
where wwb.genre_id = 1

--Part 2
--Exercise 8 (note that the exercise says count. However in order to get a total I believe I may have to use the sum function)
Select sum (copies_owned), genre_id
from wk6_wkshop_books wwb 
group by genre_id 

--Exercise 9
SELECT 
  wwl.branch_id 
  checkout_date,
  return_date,
  max(julianday(return_date)-julianday(checkout_date)),
  min(julianday(return_date)-julianday(checkout_date)),
  avg(julianday(return_date)-julianday(checkout_date))
FROM wk6_wkshop_loans wwl
group by wwl.branch_id 

--Exercise 10
SELECT
	count(wwl.return_date) as Number_of_Overdue_Books,
	wwl.patron_id,
	wwp.patron_id,
	wwp.first_name,
	wwp.last_name
FROM wk6_wkshop_loans wwl
join wk6_wkshop_patrons wwp on wwp.patron_id = wwl.patron_id  
where return_date =''
group BY  wwl.patron_id
order by wwl.patron_id Asc

--Exercise 11
select
	count(distinct(wwl.loan_id)) as Number_of_Loans,
	count(distinct(wwl.patron_id)) as Number_of_Unique_Patrons,
	strftime('%Y-%m', checkout_date) AS checkout_month
from wk6_wkshop_loans wwl
GROUP BY checkout_month
ORDER BY checkout_month asc;

--Exercise 12
SELECT 
    m.name AS table_name,
    p.name AS column_name,
    p.type AS data_type,
    CASE WHEN p.pk = 1 THEN 'YES' ELSE 'NO' END AS primary_key
FROM sqlite_master AS m
JOIN pragma_table_info(m.name) AS p
WHERE m.type = 'table'
ORDER BY table_name, p.pk DESC, column_name;
	

--Discussion Question 4
select 
	publication_year,
	title,
	genre_id,
	copies_owned
from wk6_wkshop_books wwb 
where publication_year > 2000 and copies_owned > 5 and title like "%History%"




