# Zepto-SQL-Analysis
A complete SQL project analyzing Zepto product data, including data cleaning, exploration, and business insights such as best-value products, inventory weight, and discount trends.

## Project Overview
This project analyzes product data from Zepto using SQL. It includes data cleaning, exploration, and insights such as best-value products, inventory analysis, and discount trends.

## Technologies Used
- PostgreSQL / pgAdmin
- SQL

## Features / Queries
- Count total products and check for null values
- Identify different product categories
- Analyze in-stock vs out-of-stock products
- Detect products with multiple SKUs
- Clean data by removing products with zero price and converting paise to rupees
- Top 10 best-value products by discount percentage
- High MRP products that are out of stock
- Estimated revenue per category
- Products with MRP > 500 and discount < 10%
- Top 5 categories with highest average discount
- Price per gram for products above 100 grams
- Group products into weight categories (Low / Medium / Bulk)
- Total inventory weight per category

## How to Run
1. Open `zepto_analysis.sql` in pgAdmin or any SQL editor.
2. Execute the queries sequentially to reproduce the analysis.
3. Optional: Import your Zepto dataset CSV if using real data.

## Insights / Observations
- Identified best-value products based on discount percentage and price per gram.
- Calculated total inventory weight and estimated revenue per category.
- Categorized products by weight to understand product distribution.
