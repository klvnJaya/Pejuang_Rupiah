USE pejuang_rupiah;

-- 3) SELECT + WHERE ----------------------------------
SELECT id_layanan, judul, rating, harga_mulai
FROM layanan
WHERE rating >= 4.9;

-- SELECT dengan JOIN (membuktikan relasi PK-FK)
SELECT l.judul, k.nama_kategori, f.username AS freelancer, l.harga_mulai
FROM layanan l
JOIN kategori   k ON l.id_kategori   = k.id_kategori
JOIN freelancer f ON l.id_freelancer = f.id_freelancer
WHERE l.harga_mulai <= 30
ORDER BY l.harga_mulai;

-- 4) UPDATE ------------------------------------------
UPDATE layanan
SET harga_mulai = 60.00
WHERE id_layanan = 2;

UPDATE pesanan
SET status = 'diproses'
WHERE id_pesanan = 1;

-- 5) DELETE ------------------------------------------
DELETE FROM pesanan
WHERE status = 'dibatalkan';

SELECT * FROM pesanan;
SELECT id_layanan, judul, harga_mulai FROM layanan WHERE id_layanan = 2;
