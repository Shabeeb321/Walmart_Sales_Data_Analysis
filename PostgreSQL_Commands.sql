-- Some Postgres Commands

select count(*) from walmart

select * from walmart

drop table walmart

select distinct payment_method from walmart

select payment_method, count(*) from walmart group by payment_method

select count(distinct Branch) from walmart

select max(quantity) from walmart

select min(quantity) from walmart

-- Business Problems

-- Project Question #01
-- Find the different payment methods, the number of transactions, and the total quantity sold.

select 
	payment_method,
	count(*) as no_of_transactions,
	sum(quantity) as no_of_qty_sold
from walmart group by payment_method

-- Project Question #02
-- Identify the highest-rated category in each branch, displaying the branch, and category.

select * from
		(select 
			branch,	
			category,
			avg(rating) as avg_rating,
			rank() over(partition by branch order by avg(rating) desc) as rank 
		from walmart
		group by 1,2)
		where rank = 1

-- Project Question #03
-- Identify the busiest day for each branch based on the number of transactions done. 

select * from 
			(select 
				branch,
				to_char(to_date(date,'DD/MM/YYYY'),'day') as day_name,
				count(*) as no_of_transactions, 
				rank() over(partition by branch order by count(*) desc) as rank 
			from walmart
			group by 1,2
			)
			where rank = 1

-- Project Question #04
-- Calculate the total quantity of items sold per payment method. List payment_method and total_quantity.
			
			select 
				payment_method,
				sum(quantity) as no_qty_sold
			from walmart
			group by payment_method

-- Project Question #05
-- Determine the average, minimum, and maximum rating of category for each city. List the city, average_rating, min_rating, and max_rating.

			select
					city,
					category,
					avg(rating) as avg_rating,
					max(rating) as max_rating,
					min(rating) as min_rating
			from walmart 
			group by 1,2
			order by avg_rating desc 

-- Project Question #06
-- Calculate the total profit for each category by considering total_profit as 
-- (unit_price * quantity * profit_margin).List category and total_profit, ordered from highest to lowest profit.

		select
			category,
			sum(total) as total_revenue,
			sum(total * profit_margin) as profit
		from walmart
		group by 1

-- Project Question #07
-- Determine the most common payment method for each branch.
-- Display branch and the preferred_payment_method.

with cte as(
	select
		branch,
		payment_method,
		count(*) as total_transactions,
		rank() over(partition by branch order by count(*) desc) as rank
	from walmart
	group by 1,2
	)

	select * 
	from cte
	where rank = 1

-- Project Question #08
-- Categorize sales into 03 groups morning, afternoon, and evening. 
-- Find out each of the shift and number of invoices

	select 
		branch,
	case
		when extract(hour from(time::time)) < 12 then 'morning'
		when extract(hour from(time::time)) between 12 and 17 then 'afternoon'
		else 'evening'
	end day_time,
	count (*)
	from walmart
	group by 1,2
	order by 1,3 desc
	
-- Project Question #09
-- Identify 05 branches with highest decrese ratio in 
-- revevenue compare to last year(current year 2023 and last year 2022)
-- rdr == last_rev-cr_rev/ls_rev*100


		with revenue_2022
		as
		(
			select
				branch,
				sum(total) as revenue
			from walmart
				where extract(year from to_date(date,'dd/mm/yyyy')) = 0022
			group by 1
		) , 
		
		revenue_2023
		as
		(
			select
				branch,
				sum(total) as revenue
			from walmart
				where extract(year from to_date(date,'dd/mm/yyyy')) = 0023
			group by 1
		 )

		select
			ls.branch, 
			ls.revenue as last_year_revenue,
			cs.revenue as current_year_revenue,
			round((ls.revenue-cs.revenue)::numeric/ls.revenue::numeric * 100, 2) as rev_dec_ratio
		from revenue_2022 as ls
		join 
		revenue_2023 as cs
		on ls.branch = cs.branch
		where ls.revenue > cs.revenue
		order by 4 desc
		limit 5