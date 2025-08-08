-- Cek data awal
SELECT * 
FROM cleaning_layoffs;

-- Identifikasi duplikasi dengan ROW_NUMBER
SELECT *, 
       ROW_NUMBER() OVER (PARTITION BY company, location, industry, total_laid_off, date ORDER BY date) AS row_num
FROM cleaning_layoffs;

-- Hapus duplikasi data
WITH dup_cleaning_layoffs AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY company, location, industry, total_laid_off, date ORDER BY date) AS row_num
    FROM cleaning_layoffs
)
DELETE
FROM dup_cleaning_layoffs
WHERE row_num > 1;

-- Cek hasil setelah hapus duplikasi
SELECT * 
FROM cleaning_layoffs;

-- Trim spasi pada nama perusahaan
UPDATE cleaning_layoffs
SET company = TRIM(company);

-- Normalisasi nama industri "Crypto%"
UPDATE cleaning_layoffs
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- Bersihkan nama negara (hapus titik di akhir)
UPDATE cleaning_layoffs
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- Ubah format kolom date menjadi tipe DATE
UPDATE cleaning_layoffs
SET date = TRY_CONVERT(date, date, 103);

-- Set kolom total_laid_off menjadi NULL jika 'NULL' string
UPDATE cleaning_layoffs
SET total_laid_off = NULL
WHERE total_laid_off = 'NULL';

-- Set kolom percentage_laid_off menjadi NULL jika 'NULL' string
UPDATE cleaning_layoffs
SET percentage_laid_off = NULL
WHERE percentage_laid_off = 'NULL';

-- Set kolom company menjadi NULL jika 'NULL' string
UPDATE cleaning_layoffs
SET company = NULL
WHERE company = 'NULL';

-- Set kolom location menjadi NULL jika 'NULL' string
UPDATE cleaning_layoffs
SET location = NULL
WHERE location = 'NULL';

-- Set kolom funds_raised_millions menjadi NULL jika 'NULL' string
UPDATE cleaning_layoffs
SET funds_raised_millions = NULL
WHERE funds_raised_millions = 'NULL';

-- Isi kolom industry yang kosong dari record lain yang sama company-nya
UPDATE t1
SET t1.industry = t2.industry
FROM cleaning_layoffs t1
JOIN cleaning_layoffs t2
    ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
  AND t2.industry IS NOT NULL;

-- Hapus baris yang total_laid_off & percentage_laid_off sama-sama NULL
DELETE
FROM cleaning_layoffs
WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;

-- Cek hasil akhir data setelah cleaning
SELECT * 
FROM cleaning_layoffs;
