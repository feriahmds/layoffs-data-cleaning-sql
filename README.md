# Layoffs Data Cleaning (SQL Server)

Project ini bertujuan untuk membersihkan dan menyiapkan dataset layoff perusahaan global agar siap digunakan untuk analisis data lebih lanjut menggunakan SQL Server.

## 🧩 Dataset
Dataset berisi informasi PHK global: nama perusahaan, lokasi, industri, tanggal, dan jumlah pegawai yang terdampak.

## 🧼 Proses Data Cleaning
Beberapa tahapan yang dilakukan antara lain:
- Menstandardisasi nilai NULL (mengganti string 'NULL' → NULL asli)
- Menghapus duplikat
- Memperbaiki format tanggal
- Menyeragamkan industri dan negara
- Mengisi kolom kosong menggunakan teknik self-join

## 💻 Tools
- SQL Server
- GitHub (version control)

## 🎯 Output
Dataset bersih yang bisa digunakan untuk:
- Visualisasi tren PHK
- Analisis industri paling terdampak
- Insight lokasi terbanyak terkena PHK

## 📁 File
- `layoffs_cleaning.sql`: seluruh query step-by-step
