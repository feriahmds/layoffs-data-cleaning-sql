select * from cleaning_layoffs;

select
*, 
ROW_NUMBER() over (partition by company, location, industry, total_laid_off, date order by date) as row_num
from cleaning_layoffs;

with dup_cleaning_layoffs as
(
select
*, 
ROW_NUMBER() over (partition by company, location, industry, total_laid_off, date order by date) as row_num
from cleaning_layoffs
)
delete
from dup_cleaning_layoffs
where row_num > 1;

select * from cleaning_layoffs;

select * from cleaning_layoffs;

select
company,
trim(company)
from cleaning_layoffs;

update cleaning_layoffs
set company = TRIM(company);

select
distinct industry
from cleaning_layoffs
order by industry;

select *
from cleaning_layoffs
where industry like 'Crypto%'
order by industry;

update cleaning_layoffs
set industry = 'Crypto'
where industry like 'Crypto%';

select
distinct industry
from cleaning_layoffs
order by industry;

select
distinct country
from cleaning_layoffs
order by country;

select
distinct country,
trim(trailing '.' from country)
from cleaning_layoffs;

update cleaning_layoffs
set country = trim(trailing '.' from country)
where country like 'United States%';

select * from cleaning_layoffs;

update cleaning_layoffs
set industry

select
date,
TRY_CONVERT(date, date, 103)
from cleaning_layoffs;

update cleaning_layoffs
set date = TRY_CONVERT(date, date, 103);

UPDATE cleaning_layoffs
SET layoff_date = NULL
WHERE TRY_CONVERT(DATE, layoff_date, 103) IS NULL;

select * from cleaning_layoffs
where total_laid_off = 'NULL';

update cleaning_layoffs
set total_laid_off = null
where total_laid_off = 'NULL';

select * from cleaning_layoffs
where total_laid_off is null;

update cleaning_layoffs
set percentage_laid_off = null
where percentage_laid_off = 'NULL';

update cleaning_layoffs
set company = null
where company = 'NULL';

select * from cleaning_layoffs
where percentage_laid_off is null;

update cleaning_layoffs
set location= null
where location= 'NULL';

update cleaning_layoffs
set funds_raised_millions = NULL
where funds_raised_millions = 'NULL';

select * from cleaning_layoffs
where industry is null or industry = '';

select * from cleaning_layoffs
where company = 'Airbnb';

select *
from cleaning_layoffs t1
join cleaning_layoffs t2
on t1.company = t2.company 
where (t1.industry is null or t1.industry = '') and t2.industry is not null;

UPDATE t1
SET t1.industry = t2.industry
FROM cleaning_layoffs t1
JOIN cleaning_layoffs t2
    ON t1.company = t2.company
WHERE t1.industry IS NULL
  AND t2.industry IS NOT NULL;

select * from cleaning_layoffs;

select * from cleaning_layoffs
where total_laid_off is null and percentage_laid_off is null;

delete
from cleaning_layoffs
where total_laid_off is null and percentage_laid_off is null;