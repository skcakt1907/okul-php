-- ============================================
-- EĞİTİM / KURS / AKADEMİ TEMASI — Kurulum SQL
-- Tema Master (Kurumsal/Hizmet arketipi) tabanlı.
-- Kullanım: phpMyAdmin > okul_db > Import  (veya: mysql -u root < kurulum.sql)
-- ============================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `okul_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `okul_db`;

-- ============ AYARLAR ============
DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE `ayarlar` (
  `anahtar` VARCHAR(80) NOT NULL PRIMARY KEY,
  `deger` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ayarlar` (`anahtar`,`deger`) VALUES
('site_adi','Akademi Adınız'),
('site_baslik','Akademi Adınız — Başarıya Giden Yolda Yanınızda'),
('site_aciklama','Üniversite ve lise sınavlarına hazırlık, yabancı dil, kodlama ve kişisel gelişim kurslarıyla öğrencilerimizi hedeflerine ulaştıran eğitim kurumu. Uzman eğitmen kadrosu ve kanıtlanmış başarı.'),
('telefon','+90 555 000 00 00'),
('telefon2','+90 532 000 00 00'),
('mail','info@akademiadiniz.com'),
('adres','Merkez Mah. Bilgi Cad. No:1, İlçe / İl'),
('calisma_saati','Pzt - Cmt: 09:00 - 21:00'),
('hakkimizda_kisa','Her öğrencinin potansiyelini ortaya çıkaran, sonuç odaklı ve öğrenci merkezli bir eğitim anlayışıyla hedeflerinize giden yolda yanınızdayız. Başarımızın sırrı: doğru rehberlik ve uzman kadro.'),
('hakkimizda_uzun','Akademimiz, 16 yılı aşkın deneyimiyle binlerce öğrenciyi hayallerindeki üniversitelere ve okullara hazırladı. Sınav odaklı müfredatımız, düzenli deneme sınavları, birebir etüt ve koçluk sistemimiz, az mevcutlu sınıflarımız ve ölçme-değerlendirme altyapımızla her öğrencinin gelişimini bireysel olarak takip ediyoruz. Üniversite (YKS) ve lise (LGS) hazırlık programlarımızın yanı sıra İngilizce ve yabancı dil kurslarımız, kodlama-robotik atölyelerimiz ve kişisel gelişim eğitimlerimizle öğrencilerimizi sadece sınava değil, geleceğe hazırlıyoruz. Veli bilgilendirme sistemimizle sürecin her aşamasında ailelerle birlikteyiz.'),
('misyon','Her öğrenciyi bireysel olarak tanıyıp doğru rehberlikle desteklemek; akademik başarıyı, özgüveni ve öğrenme sevgisini bir arada kazandırmak.'),
('vizyon','Eğitimde kalite ve başarının referans kurumu olmak; öğrencilerimizin yalnızca sınavlarda değil hayatta da başarılı bireyler olmasını sağlamak.'),
('yil','16'),
('proje_sayi','8500'),
('musteri_sayi','12000'),
('personel_sayi','45'),
('facebook','#'),('instagram','#'),('twitter','#'),('linkedin','#'),('youtube','#');

-- ============ HİZMETLER (Kurslar / Programlar) ============
DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE `hizmetler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `ikon` VARCHAR(60) DEFAULT 'bi-mortarboard',
  `gorsel` VARCHAR(255),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hizmetler` (`baslik`,`slug`,`ozet`,`icerik`,`ikon`,`gorsel`,`sira`) VALUES
('Üniversite Hazırlık (YKS)','universite-hazirlik-yks','TYT-AYT odaklı, düzenli deneme ve birebir koçlukla üniversite sınavına tam hazırlık.','YKS hazırlık programımızda TYT ve AYT müfredatı baştan sona, konu eksiği bırakmadan işlenir. Haftalık deneme sınavları, soru çözüm kampları, birebir etüt ve öğrenci koçluğu sistemiyle her öğrencinin net gelişimini takip eder, hedef üniversitesine ulaşması için kişiselleştirilmiş bir yol haritası çıkarırız.','bi-mortarboard','https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800&q=80',1),
('Lise Hazırlık (LGS)','lise-hazirlik-lgs','8. sınıf öğrencilerine özel, LGS odaklı sınav hazırlık ve takip programı.','LGS hazırlık programımız, 8. sınıf öğrencilerini hedefledikleri liselere taşımak için tasarlandı. Az mevcutlu sınıflar, düzenli kazanım testleri, deneme sınavları ve veli bilgilendirme sistemiyle öğrencinin akademik gelişimini sürekli izler, eksikleri zamanında kapatırız.','bi-book','https://images.unsplash.com/photo-1427504494785-3a9ca7044f45?w=800&q=80',2),
('İngilizce Dil Kursu','ingilizce-dil-kursu','Başlangıçtan ileri seviyeye, konuşma odaklı ve seviye gruplu İngilizce eğitimi.','İngilizce kurslarımız A1''den C1''e tüm seviyeleri kapsar. Konuşma (speaking) ağırlıklı, etkileşimli ders işleyişimiz, native/uzman eğitmenlerimiz ve uluslararası sınav (IELTS/TOEFL) hazırlık desteğimizle öğrencilerimiz dili gerçekten kullanmayı öğrenir.','bi-translate','https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=800&q=80',3),
('Yabancı Dil (Almanca/Fransızca)','yabanci-dil','Almanca, Fransızca ve diğer dillerde seviye gruplu kurslar ve sınav hazırlığı.','İngilizce dışında Almanca, Fransızca, İspanyolca ve diğer dillerde seviye gruplu kurslar sunuyoruz. Goethe, DELF gibi uluslararası sertifika sınavlarına hazırlık ve yurt dışı eğitim danışmanlığı da hizmetlerimiz arasındadır.','bi-globe2','https://images.unsplash.com/photo-1546410531-bb4caa6b424d?w=800&q=80',4),
('Kodlama & Robotik','kodlama-robotik','Çocuk ve gençlere yönelik, projeye dayalı kodlama ve robotik atölyeleri.','Geleceğin becerilerini bugünden kazandırıyoruz. Scratch, Python ve robotik setlerle yaş gruplarına uygun, projeye dayalı kodlama atölyelerimizde öğrenciler problem çözme, algoritmik düşünme ve yaratıcılık becerilerini geliştirir.','bi-cpu','https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=800&q=80',5),
('Kişisel Gelişim & Koçluk','kisisel-gelisim-kocluk','Verimli ders çalışma, sınav kaygısı yönetimi ve hedef belirleme koçluğu.','Akademik başarı kadar doğru çalışma alışkanlıkları ve motivasyon da önemlidir. Öğrenci koçluğu, verimli ders çalışma teknikleri, zaman yönetimi ve sınav kaygısıyla başa çıkma eğitimlerimizle öğrencilerimizi bütünsel olarak destekliyoruz.','bi-lightbulb','https://images.unsplash.com/photo-1552664730-d307ca884978?w=800&q=80',6);

-- ============ PROJELER / BAŞARILARIMIZ (Galeri) ============
DROP TABLE IF EXISTS `projeler`;
CREATE TABLE `projeler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `kategori` VARCHAR(60),
  `gorsel` VARCHAR(255),
  `aciklama` TEXT,
  `tarih` VARCHAR(40),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `projeler` (`baslik`,`slug`,`kategori`,`gorsel`,`aciklama`,`tarih`,`sira`) VALUES
('YKS Türkiye Dereceleri','yks-turkiye-dereceleri','Başarı','https://images.unsplash.com/photo-1523580846011-d3a5bc25702b?w=800&q=80','Öğrencilerimizin YKS''de elde ettiği Türkiye derecelerimiz ve ilk 1000 sıralamaları.','2025',1),
('LGS Tam Puan Başarıları','lgs-tam-puan','Başarı','https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?w=800&q=80','LGS''de tam puan ve yüksek yüzdelik dilim elde eden öğrencilerimizle gurur duyuyoruz.','2025',2),
('Modern Dersliklerimiz','modern-dersliklerimiz','Kampüs','https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=800&q=80','Az mevcutlu, teknolojik donanımlı ve öğrenmeye odaklı modern dersliklerimiz.','Kampüs',3),
('Kütüphane & Etüt Salonu','kutuphane-etut-salonu','Kampüs','https://images.unsplash.com/photo-1521587760476-6c12a4b040da?w=800&q=80','Sessiz çalışma ortamı sunan kütüphanemiz ve birebir etüt salonlarımız.','Kampüs',4),
('Mezuniyet & Ödül Töreni','mezuniyet-odul-toreni','Etkinlik','https://images.unsplash.com/photo-1523580494863-6f3031224c94?w=800&q=80','Başarılı öğrencilerimizi ödüllendirdiğimiz coşkulu mezuniyet ve ödül törenimiz.','Etkinlik',5),
('Bilim & Proje Şenliği','bilim-proje-senligi','Etkinlik','https://images.unsplash.com/photo-1564981797816-1043664bf78d?w=800&q=80','Öğrencilerimizin hazırladığı bilim ve kodlama projelerini sergilediği şenliğimiz.','Etkinlik',6);

-- ============ BLOG ============
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(200) NOT NULL,
  `slug` VARCHAR(200),
  `kategori` VARCHAR(60),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `gorsel` VARCHAR(255),
  `tarih` DATE,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog` (`baslik`,`slug`,`kategori`,`ozet`,`icerik`,`gorsel`,`tarih`) VALUES
('YKS''ye Son 3 Ayda Verimli Çalışma Planı','yks-son-3-ay-calisma-plani','Sınav','Sınava sayılı gün kala netlerinizi yükseltecek, denenmiş ve etkili bir çalışma stratejisi.','Sınava son üç ay, doğru planlandığında netleri ciddi biçimde yükseltebilen kritik bir dönemdir. Bu dönemde yeni konu öğrenmek yerine eksik kapatmaya, düzenli deneme çözüp analiz etmeye ve güçlü olduğunuz derslerden net garantilemeye odaklanmak gerekir. Bu yazıda haftalık örnek bir program ve deneme analizi yöntemini paylaşıyoruz.','https://images.unsplash.com/photo-1434030216411-0b793f4b4173?w=800&q=80','2026-05-14'),
('Sınav Kaygısıyla Başa Çıkmanın 5 Yolu','sinav-kaygisi-basa-cikma','Rehberlik','Sınav kaygısı performansı düşürebilir. İşte öğrencilerimize önerdiğimiz etkili teknikler.','Sınav kaygısı, birçok başarılı öğrencinin bile performansını olumsuz etkileyebilir. Nefes egzersizleri, gerçekçi hedef belirleme, düzenli uyku ve deneme sınavlarıyla sınav ortamına alışmak kaygıyı yönetmenin etkili yollarıdır. Bu yazıda rehberlik servisimizin önerdiği 5 pratik tekniği anlattık.','https://images.unsplash.com/photo-1499209974431-9dddcece7f88?w=800&q=80','2026-04-22'),
('Çocuğunuz İçin Doğru Yabancı Dil Yaşı','dogru-yabanci-dil-yasi','Eğitim','Yabancı dil eğitimine başlamak için ideal yaş ve etkili öğrenme yöntemleri hakkında.','Araştırmalar, yabancı dil öğreniminde erken yaşların avantajlı olduğunu gösterir; ancak her yaşta etkili öğrenme mümkündür. Önemli olan dili oyun, müzik ve gerçek iletişim yoluyla, baskı olmadan sevdirmektir. Bu yazıda yaş gruplarına göre dil öğrenme önerilerimizi bulabilirsiniz.','https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=800&q=80','2026-03-28');

-- ============ REFERANSLAR ============
DROP TABLE IF EXISTS `referanslar`;
CREATE TABLE `referanslar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100) NOT NULL,
  `unvan` VARCHAR(120),
  `yorum` TEXT,
  `foto` VARCHAR(255),
  `yildiz` TINYINT DEFAULT 5,
  `durum` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `referanslar` (`ad`,`unvan`,`yorum`,`foto`,`yildiz`) VALUES
('Berk A.','Tıp Fakültesi Öğrencisi','YKS hazırlık sürecinde koçumun desteği ve düzenli denemeler net farkı yarattı. Hedefim olan tıp fakültesini kazandım. İyi ki buradaydım.','https://i.pravatar.cc/100?img=14',5),
('Zeynep T. (Veli)','8. sınıf velisi','Kızımın LGS sürecinde hem akademik hem motivasyon desteği aldık. Veli bilgilendirme sistemi sayesinde her aşamadan haberdardık. Çok memnunuz.','https://i.pravatar.cc/100?img=44',5),
('Emre Y.','İngilizce Kursu Öğrencisi','Konuşma ağırlıklı dersler sayesinde 6 ayda akıcı İngilizce konuşmaya başladım. Eğitmenler çok ilgili ve dersler keyifli.','https://i.pravatar.cc/100?img=60',5);

-- ============ MESAJLAR ============
DROP TABLE IF EXISTS `mesajlar`;
CREATE TABLE `mesajlar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `konu` VARCHAR(200),
  `mesaj` TEXT,
  `okundu` TINYINT DEFAULT 0,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ TEKLİFLER (Kayıt / Deneme Dersi Talepleri) ============
DROP TABLE IF EXISTS `teklifler`;
CREATE TABLE `teklifler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `hizmet` VARCHAR(120),
  `il` VARCHAR(60),
  `adres` VARCHAR(255),
  `alan` VARCHAR(60),
  `butce` VARCHAR(60),
  `baslangic` VARCHAR(60),
  `detay` TEXT,
  `durum` ENUM('yeni','degerlendiriliyor','teklif_verildi','kazanildi','kaybedildi') DEFAULT 'yeni',
  `notlar` TEXT,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ ADMIN ============
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `kullanici` VARCHAR(60) NOT NULL UNIQUE,
  `sifre_hash` VARCHAR(255) NOT NULL,
  `ad_soyad` VARCHAR(120),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre: admin123  (password_hash bcrypt) — CANLIDA MUTLAKA DEĞİŞTİR
INSERT INTO `admin` (`kullanici`,`sifre_hash`,`ad_soyad`) VALUES
('admin','$2y$10$6gNrpOXRLof.Toy.Ugy.yu4DrKP23OcnJa7UBhKOH1iMxbtH8GK0.','Yönetici');

SET FOREIGN_KEY_CHECKS = 1;
