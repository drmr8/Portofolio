#1. Mengetahui produk terlaris:
SELECT 
    products.product_name, 
    SUM(sales.quantity_sold) AS total_sold
FROM 
    products
JOIN 
    sales ON products.product_id = sales.product_id
GROUP BY 
    products.product_name
ORDER BY 
    total_sold DESC
LIMIT 10;

#2. Mengetahui produk dengan rating tertinggi:
SELECT 
    products.product_name, 
    ROUND(AVG(rating), 1) as average_rating
FROM 
    products
JOIN 
    reviews ON products.product_id = reviews.product_id
GROUP BY 
    products.product_name
ORDER BY 
    average_rating DESC
LIMIT 10;

#3. Mengetahui tren penjualan per kategori produk:
SELECT 
    products.category, 
    COUNT(sales.sale_id) AS total_sales, 
    DATE_FORMAT(sales.sale_date, '%Y-%m') AS sale_month
FROM 
    products
JOIN 
    sales ON products.product_id = sales.product_id
GROUP BY 
    sale_month, 
    products.category
ORDER BY 
    sale_month;

#4. Mengetahui produk dengan review paling banyak:
SELECT 
    products.product_name, 
    COUNT(reviews.review_id) AS total_reviews
FROM 
    products
JOIN 
    reviews ON products.product_id = reviews.product_id
GROUP BY 
    products.product_name
ORDER BY 
    total_reviews DESC
LIMIT 10;

#5. Mengetahui produk dengan review paling sedikit:
SELECT 
    products.product_name, 
    COUNT(reviews.review_id) AS total_reviews
FROM 
    products
JOIN 
    reviews ON products.product_id = reviews.product_id
GROUP BY 
    products.product_name
ORDER BY 
    total_reviews ASC
LIMIT 10;

#6. Mengetahui produk yang memberikan penghasilan penjualan terbesar:
SELECT 
    products.product_name, 
    round(SUM(sales.quantity_sold * products.price)) AS total_revenue
FROM 
    products
JOIN 
    sales ON products.product_id = sales.product_id
GROUP BY 
    products.product_name
ORDER BY 
    total_revenue DESC
LIMIT 10;

#7. Mengetahui total pendapatan per bulan:
SELECT 
    DATE_FORMAT(sales.sale_date, '%Y-%m') AS sale_month, 
    ROUND(SUM(sales.quantity_sold * products.price)) AS total_revenue
FROM 
    products
JOIN 
    sales ON products.product_id = sales.product_id
GROUP BY 
    sale_month
ORDER BY 
    sale_month;

