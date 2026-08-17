# Kaloritim

**Konsept sahibi: Mehmet Can Özen**

Evcil hayvanlar için akıllı beslenme matı ve vücut analizi uygulamasının
arayüz konsepti. Royal Canin yarışması kapsamında hazırlanmıştır.

**Canlı sürüm:** https://kaloritim.pet

## Nedir

Mat, üzerine çıkan hayvanın ağırlığını; kaplar ise mama ve su tüketimini
tartar. Uygulama bu ölçümlerden vücut kompozisyonu, sıvı dengesi,
metabolizma ve hareket analizini çıkarır — insanlardaki InBody cihazının
evcil hayvan karşılığı gibi çalışır.

## Ekranlar

| Ekran | İçerik |
|---|---|
| Genel Bakış | Obezite derecesi, VKS, günlük kalori, mama kabı durum ışığı, beslenme reçetesi, hareket ve dinlenme |
| Analiz | Vücut kompozisyonu, bölgesel yağsız doku, basınç sensörü yük dağılımı, sıvı dengesi, metabolizma |
| Grafikler | Hafta / ay / yıl aralıklarında ağırlık, mama, su, kas–yağ, kalori, adım, oturup kalkma, yatma süresi |
| Uyarılar | Az yeme, az su içme, hareketsizlik ve kilo değişimi bildirimleri; uyarı eşikleri |
| Ayarlar | Cihaz kalibrasyonu, profil yönetimi, mama tanımı, veteriner paylaşımı, bildirimler |

Ayrıca A4 klinik analiz raporu üretir (tarayıcıdan PDF olarak kaydedilir).

## Çalışan özellikler

- **Barkod / QR okuma.** Chrome ve Edge'de tarayıcının yerleşik `BarcodeDetector`
  arayüzü, iOS Safari'de ZXing kullanılır.
- **Royal Canin kataloğu.** `katalog.js` içinde 257 barkod → ürün adı, kategori,
  paket boyu; 47'sinde kalori değeri de bulunur. Üreticinin site verisinden
  otomatik çıkarılmıştır.
- **Açık veritabanı sorgusu.** Katalogda olmayan kodlar için Open Pet Food Facts.
- **Besin tablosu OCR'ı.** Tesseract ile paketten enerji, protein, yağ, ham kül,
  ham lif ve nem okunur; tüm değerler elle düzeltilebilir.
- **Royal Canin dışı ürün uyarısı.**
- **Çok profil desteği.** Köpek ve kedi profilleri, fotoğraf yükleme ile yeni
  hayvan kaydı.

## Dosyalar

    index.html          Tüm uygulama (tek dosya)
    katalog.js          Royal Canin Türkiye barkod kataloğu
    zxing.js            Barkod çözücü (iOS Safari yedeği)
    tesseract/          OCR motoru ve Türkçe dil modeli
    siluet*.png         Bölgesel analiz siluetleri
    deploy/             nginx yapılandırması ve kurulum betiği

## Kurulum

Statik bir sitedir, derleme gerektirmez. `index.html` doğrudan tarayıcıda
açılabilir; ancak kamera erişimi (barkod ve OCR) yalnızca HTTPS üzerinde
çalışır. Sunucu kurulumu için `deploy/kur.sh` betiğine bakınız.

## Not

Arayüz bir konsept çalışmasıdır; hayvan verileri örnektir ve tıbbi tavsiye
niteliği taşımaz.
