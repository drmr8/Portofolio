#Menampilkan Data
SELECT 
  * 
FROM 
  `bigquery-public-data.chicago_crime.crime` 
LIMIT 1000;

#Menghitung Data
SELECT 
  COUNT(*)  
FROM 
  `bigquery-public-data.chicago_crime.crime`;

#Analisis Tren Kejahatan Berdasarkan Type
SELECT 
  primary_type, 
  EXTRACT(YEAR FROM date) AS year, 
  COUNT(*) as crime_count
FROM 
  `bigquery-public-data.chicago_crime.crime`
GROUP BY 
  primary_type, 
  year
ORDER BY 
  primary_type,
  year;

#Analisis Berdasarkan Lokasi
SELECT 
  primary_type, 
  community_area, 
  COUNT(*) as crime_count
FROM 
  `bigquery-public-data.chicago_crime.crime`
GROUP BY 
  primary_type, 
  community_area
ORDER BY 
  primary_type, 
  crime_count DESC;

#Analisis Berdasarkan Waktu
SELECT 
  primary_type, 
  EXTRACT(HOUR FROM date) AS hour, 
  COUNT(*) as crime_count
FROM 
  `bigquery-public-data.chicago_crime.crime`
GROUP BY 
  primary_type, 
  hour
ORDER BY 
  primary_type, 
  hour;

#Analisis Kejahatan Domestik dan Non-Domestik
SELECT 
  domestic,  
  COUNT(*) as crime_count
FROM
  `bigquery-public-data.chicago_crime.crime`
GROUP BY 
  domestic;

#Analisis Efektivitas Penangkapan
SELECT 
  arrest, 
  primary_type, 
  COUNT(*) as crime_count
FROM 
  `bigquery-public-data.chicago_crime.crime`
GROUP BY 
  arrest, 
  primary_type
ORDER BY 
  primary_type, 
  arrest;
