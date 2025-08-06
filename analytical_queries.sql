-- 1 . find the no.of business in each catogories 

with cte as (
select business_id , trim(A.value) as category
from tbl_yelp_business ,
lateral split_to_table(CATEGORIES,',') A
)
select category , count(*) as count
_of_business
from cte
group by category 
order by 2 desc ;

--2 Find the top 10 users who have reviewed the most business in the 'Restaurants' category.

select r.user_id , count(distinct r.business_id ) as A
from tbl_yelp_reviews r 
join tbl_yelp_business b on r.business_id = b.business_id
where b.categories ilike '%restaurants%'
group by r.user_id 
order by A desc 
limit 10 ;

--3 Find the most popular categories of business (based on the no.of.reviews)


with cte as (
select business_id , trim(A.value) as category
from tbl_yelp_business ,
lateral split_to_table(CATEGORIES,',') A
)
select category , count(*) as no_of_reviews 
from cte
join tbl_yelp_reviews r  on cte.business_id = r.business_id
group by 1
order by 2 desc ;

--4 Find the top 3 most recent reviews for each business.

with cte as (
select r.* ,
row_number() over (partition by r.business_id order by review_date desc ) as rn 
from tbl_yelp_reviews r 
join tbl_yelp_business b on r.business_id = b.business_id
)
select * from cte 
where rn <=3 ;

--5 find the month with highest no.of reviews.


select month(review_date) as review_month ,
       count(*) as no_of_reviews 
from tbl_yelp_reviews 
group by review_month
order by no_of_reviews desc  ;


--24/7/25

--6 Find the percentage of 5-star reviews of each business


select distinct b.BUSINESS_ID , 
       count(*) as  total_review ,
       COUNT_IF(r.review_star = 5) AS five_star_reviews ,
       round((five_star_reviews/total_review*100),2)as percentage_5star_reviews

from tbl_yelp_reviews r 
join tbl_yelp_business b on r.business_id = b.business_id
group by 1
order by 2 desc ;

--7 find the top 5 most reviews business in each city .

with cte as (
select b.BUSINESS_ID , 
       count(*) as  total_reviews ,
       b.city 
       
from tbl_yelp_reviews r 
join tbl_yelp_business b on r.business_id = b.business_id
group by 1 , 3
)
select * 
from cte 
qualify  row_number() over(partition by city order by total_reviews desc ) <=5 

--8 Find the avg rating of business that have at least 100 review 


select distinct b.BUSINESS_ID , 
       count(*) as  total_review ,
       round(avg(r.review_star),1) as avg_rating
       

from tbl_yelp_reviews r 
join tbl_yelp_business b on r.business_id = b.business_id
group by 1
having count(*) > 100 ;

--9 List the top 10 users who have written the most reviews , along with the business they reviewed.

with cte as (
select r.user_id , 
       count(*) as  total_review 
       

from tbl_yelp_reviews r 
join tbl_yelp_business b on r.business_id = b.business_id
group by 1
order by 2 desc 
limit 10 
)
select user_id , business_id
from tbl_yelp_reviews
where user_id in (select user_id from cte );

--10 Find top 10 businesses with highest positive sentient reviews  


select r.business_id , 
       count(*) as  total_review ,
       
from tbl_yelp_reviews r 
join tbl_yelp_business b on r.business_id = b.business_id
where SENTIENT = 'positive'
group by 1
order by 2 desc ;
