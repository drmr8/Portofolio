#1. Mengetahui total penjualan dan jumlah item terjual untuk setiap produk:
SELECT 
    product_id,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(quantity * price)) AS total_sales
FROM
    transactions
GROUP BY product_id;

#2. Mengidentifikasi 10 produk dengan penjualan terbanyak:
SELECT 
    product_id,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(quantity * price)) AS total_sales
FROM
    transactions
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;

#3. Mengetahui preferensi pembelian berdasarkan jenis kelamin pelanggan:
SELECT 
    customers.gender,
    transactions.product_id,
    COUNT(*) AS total_transactions
FROM 
    customers
JOIN 
    transactions ON customers.customer_id = transactions.customer_id
GROUP BY
    customers.gender,
    transactions.product_id;
    
#4. Menemukan 10 pelanggan dengan total pembelian terbesar:
SELECT 
    customers.name,
    ROUND(SUM(transactions.quantity * transactions.price)) AS total_spent
FROM 
    customers
JOIN 
    transactions ON customers.customer_id = transactions.customer_id
GROUP BY
    customers.name
ORDER BY
    total_spent DESC
LIMIT 10;

#5. Analisis penjualan berdasarkan kota:
SELECT 
    customers.city,
    COUNT(transactions.transaction_id) AS total_transactions,
    SUM(transactions.quantity) AS total_quantity,
    ROUND(SUM(transactions.quantity * transactions.price)) AS total_sales
FROM 
    customers
JOIN 
    transactions ON customers.customer_id = transactions.customer_id
GROUP BY
    customers.city;

