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
