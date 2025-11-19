drop table if exists zepto;

create table zepto(
sku_id serial primary key,
category varchar(120),
name varchar(150) not null,
mrp numeric(8,2),
dicountpercent numeric(5,2),
avilablequantity integer,
discountedsellingprice numeric(8,2),
weightingms integer,
outofstock boolean,
quantity integer
);

drop table if exists zepto;




create table zepto(
sku_id serial primary key,
category varchar(120),
name varchar(150) not null,
mrp numeric(8,2),
dicountpercent numeric(5,2),
avilablequantity integer,
discountedsellingprice numeric(8,2),
weightingms integer,
outofstock boolean,
quantity integer

);

--data exploration

--count of rows
select count(*)from zepto;

--sample data
select * from zepto
limit 10;

--null values
where name is null
or
category is null
or
mrp is null
or
dicountpercent is null
or
discountedsellingprice is null
or
avilablequantity is null
or
outofstock is null
or
quantity is null;

--diffrent product category
select distinct category from zepto
order by category;

--product in stock vs out of stock

select outofstock, count(sku_id)
from zepto
group by outofstock;

--product names present multiple times
select name,count(sku_id) as "number of SKUs"
from zepto
group by name 
having count(sku_id) > 1
order by count(sku_id) desc;

--data cleaning

--product with price = 0
select*from zepto
where mrp = 0 or discountedsellingprice = 0;

delete from zepto
where mrp = 0;

--convert paise to rupees
update zepto
set mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

select mrp,discountedsellingprice from zepto
ALTER TABLE zepto
RENAME COLUMN dicountpercent TO discountpercent;

--Q1. find the top 10 best value products based on the discount percentage
select distinct name, mrp, discountpercent 
from zepto
order by discountpercent desc
limit 10;

--Q2. what are the products with high mrp but out of stocks
SELECT distinct name, mrp
FROM zepto
WHERE outofstock = true and mrp > 300
ORDER BY mrp DESC
LIMIT 10;

--Q3. calculate estimated revenue for each catgory
SELECT category,
SUM(discountedsellingprice * avilablequantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--Q4. find all products where MRP is greater than 500 and discount is less than 10%
SELECT DISTINCT name, mrp, discountpercent
FROM zepto
WHERE mrp > 500 AND discountpercent < 10
ORDER BY mrp DESC, discountpercent DESC;

--Q5. identify the top 5 categoties offering the highest average discount percentage
select category,
round(avg(discountpercent),2)as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

--Q6. find the price per gram for product above 100 gram and sort by best value
select distinct name, weightingms, discountedsellingprice,
round(discountedsellingprice/weightingms,2)as price_per_gram
from zepto
where weightingms >= 100
order by price_per_gram;

--Q7. group the products into categories like low,medium,bulk
SELECT distinct
name, weightingms,
case WHEN weightingms < 1000 THEN 'Low'
        WHEN weightingms <5000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category
FROM zepto;

--Q8. what is the total inventory weight per category
select category,
sum(weightingms * avilablequantity) as total_weight
from zepto
group by category
order by total_weight




