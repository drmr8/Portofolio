1. Menghitung Jumlah Kejahatan berdasarkan Jenis Kejahatan
SQL Query:
SELECT 
  primary_type, COUNT(*) as count
FROM 
  `bigquery-public-data.chicago_crime.crime` 
GROUP BY 
  primary_type
ORDER BY 
  count DESC;

2. Mengidentifikasi Tren Kejahatan Berdasarkan Tahun
SQL Query:
SELECT 
  year, 
  COUNT(*) as count
FROM 
  `bigquery-public-data.chicago_crime.crime` 
GROUP BY 
  year
ORDER BY 
  year;
 
3. Menentukan Lokasi Kejahatan Terbanyak
SQL Query:
SELECT 
  location_description,
  COUNT(*) as count
FROM 
  `bigquery-public-data.chicago_crime.crime` 
WHERE 
  location_description IS NOT NULL
GROUP BY 
  location_description
ORDER BY 
  count DESC
