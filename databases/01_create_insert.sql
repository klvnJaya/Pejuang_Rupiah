-- =====================================================
-- Database Pejuang Rupiah (marketplace jasa digital)
-- Tugas 5 - Kelvin Wijaya - 2025132026
-- =====================================================

DROP DATABASE IF EXISTS pejuang_rupiah;
CREATE DATABASE pejuang_rupiah
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;
USE pejuang_rupiah;

-- 1) CREATE TABLE ------------------------------------

CREATE TABLE kategori (
  id_kategori   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  kode_kategori VARCHAR(20)  NOT NULL,
  nama_kategori VARCHAR(50)  NOT NULL,
  PRIMARY KEY (id_kategori),
  UNIQUE KEY uq_kode_kategori (kode_kategori)
) ENGINE=InnoDB;

CREATE TABLE freelancer (
  id_freelancer     INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username          VARCHAR(50)  NOT NULL,
  email             VARCHAR(100) NOT NULL,
  tanggal_bergabung DATE         NOT NULL,
  PRIMARY KEY (id_freelancer),
  UNIQUE KEY uq_username (username),
  UNIQUE KEY uq_email_freelancer (email)
) ENGINE=InnoDB;

CREATE TABLE layanan (
  id_layanan    INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  id_kategori   INT UNSIGNED  NOT NULL,
  id_freelancer INT UNSIGNED  NOT NULL,
  judul         VARCHAR(100)  NOT NULL,
  deskripsi     TEXT          NOT NULL,
  rating        DECIMAL(2,1)  NOT NULL DEFAULT 0.0,
  harga_mulai   DECIMAL(10,2) NOT NULL,
  gambar        VARCHAR(100)  DEFAULT NULL,
  PRIMARY KEY (id_layanan),
  CONSTRAINT fk_layanan_kategori
    FOREIGN KEY (id_kategori) REFERENCES kategori (id_kategori)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_layanan_freelancer
    FOREIGN KEY (id_freelancer) REFERENCES freelancer (id_freelancer)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE pesanan (
  id_pesanan      INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  id_kategori     INT UNSIGNED  NOT NULL,
  nama_pelanggan  VARCHAR(100)  NOT NULL,
  email           VARCHAR(100)  NOT NULL,
  telepon         VARCHAR(20)   NOT NULL,
  budget          DECIMAL(10,2) NOT NULL,
  batas_waktu     DATE          NOT NULL,
  deskripsi       TEXT          NOT NULL,
  status          ENUM('menunggu','diproses','selesai','dibatalkan')
                  NOT NULL DEFAULT 'menunggu',
  tanggal_dibuat  DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_pesanan),
  CONSTRAINT fk_pesanan_kategori
    FOREIGN KEY (id_kategori) REFERENCES kategori (id_kategori)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 2) INSERT ------------------------------------------

INSERT INTO kategori (kode_kategori, nama_kategori) VALUES
('graphics',    'Graphics & Design'),
('programming', 'Programming & Tech'),
('marketing',   'Digital Marketing'),
('writing',     'Writing & Translation'),
('video',       'Video & Animation'),
('ai',          'AI Services');

INSERT INTO freelancer (username, email, tanggal_bergabung) VALUES
('CreativeStudio',  'creativestudio@pejuangrupiah.id',  '2025-01-15'),
('WebDeveloperPro', 'webdeveloperpro@pejuangrupiah.id', '2025-02-10'),
('GrowthExpert',    'growthexpert@pejuangrupiah.id',    '2025-03-05'),
('WordCraft',       'wordcraft@pejuangrupiah.id',       '2025-03-20'),
('VideoMaster',     'videomaster@pejuangrupiah.id',     '2025-04-12'),
('AICreator',       'aicreator@pejuangrupiah.id',       '2025-05-01');

INSERT INTO layanan
  (id_kategori, id_freelancer, judul, deskripsi, rating, harga_mulai, gambar) VALUES
(1, 1, 'Professional Logo Design',
 'Jasa pembuatan logo profesional untuk membangun identitas bisnis Anda.',
 4.9, 20.00, 'img/logo.jpg'),
(2, 2, 'Website Development',
 'Jasa pembuatan website modern, responsif, dan sesuai kebutuhan bisnis.',
 4.8, 50.00, 'img/website.jpg'),
(3, 3, 'Social Media Marketing',
 'Strategi konten dan pemasaran media sosial untuk meningkatkan jangkauan bisnis.',
 4.9, 25.00, 'img/beranda.jpg'),
(4, 4, 'Article & Copywriting',
 'Penulisan artikel, caption, dan copywriting yang menarik untuk kebutuhan bisnis.',
 4.8, 15.00, 'img/branda1.jpg'),
(5, 5, 'Video Editing',
 'Jasa editing video untuk media sosial, promosi bisnis, dan konten digital.',
 5.0, 30.00, 'img/video.jpg'),
(6, 6, 'AI Content & Prompt',
 'Pembuatan prompt AI, ide konten, dan solusi berbasis AI untuk produktivitas bisnis.',
 4.9, 20.00, 'img/website.jpg');

INSERT INTO pesanan
  (id_kategori, nama_pelanggan, email, telepon, budget, batas_waktu, deskripsi, status, tanggal_dibuat) VALUES
(1, 'Budi Santoso',  'budi.santoso@email.com',  '081234567890', 40.00,  '2026-11-15',
 'Butuh logo untuk usaha kopi keliling.', 'menunggu',  '2026-10-01 09:15:00'),
(2, 'Siti Rahmawati','siti.rahma@email.com',    '082198765432', 150.00, '2026-12-01',
 'Website toko online baju muslim.',      'menunggu',  '2026-10-03 14:30:00'),
(5, 'Andi Pratama',  'andi.pratama@email.com',  '085712345678', 60.00,  '2026-11-20',
 'Edit video promosi produk durasi 1 menit.', 'diproses','2026-10-05 10:00:00'),
(4, 'Dewi Lestari',  'dewi.lestari@email.com',  '087812345678', 25.00,  '2026-10-30',
 'Artikel blog 5 buah tentang UMKM.',     'dibatalkan','2026-10-06 16:45:00');
