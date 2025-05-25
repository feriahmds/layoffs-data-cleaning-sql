# 🧹 Data Cleaning Project - Layoffs Dataset (SQL Server)

Proyek ini berfokus pada pembersihan dataset `layoffs` menggunakan **SQL Server** agar data siap digunakan untuk analisis lebih lanjut dan visualisasi (misalnya dengan Power BI).

## 📊 Dataset

Dataset ini berisi informasi PHK dari berbagai perusahaan global yang diperoleh dari sumber publik. Format awalnya tidak konsisten, banyak data kosong, dan tipe data yang belum terstruktur.

## 🎯 Tujuan Project

- Menghapus duplikasi
- Mengonversi string `'NULL'` menjadi `NULL`
- Membersihkan karakter yang tidak relevan (seperti titik di belakang nama negara)
- Mengonversi tanggal string ke tipe data `DATE`
- Menormalkan teks pada kolom seperti `industry` dan `company`
- Mengisi nilai kosong di kolom `industry` berdasarkan data perusahaan lain
- Menghapus baris yang tidak memiliki nilai penting (PHK = NULL)

## 🛠 Tools & Teknologi

- SQL Server (T-SQL)
- CTE (Common Table Expressions)
- Window Functions (`ROW_NUMBER`)
- TRY_CONVERT untuk penanganan tanggal
- Subquery dan JOIN untuk data enrichment

## 🧪 Output

- Dataset bersih, konsisten, dan siap dianalisis
- Validasi format tanggal, jumlah PHK, dan kategori industri
- Bisa langsung digunakan untuk dashboard atau analisis tren PHK


## 📌 Insight (jika dilanjut)

Dataset yang sudah dibersihkan ini bisa digunakan untuk analisis:
- Industri mana yang paling terdampak PHK
- Pola PHK berdasarkan negara/waktu
- Dampak pendanaan terhadap PHK

---

Made with 💻 by Feri
