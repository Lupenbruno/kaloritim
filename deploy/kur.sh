#!/usr/bin/env bash
# Kaloritim — sunucu kurulumu (Ubuntu/Debian + nginx)
# Sunucuda root olarak bir kez çalıştırılır:  bash kur.sh
set -euo pipefail

DOMAIN="kaloritim.pet"
WEBROOT="/var/www/kaloritim"

echo "==> nginx kuruluyor"
apt-get update -qq
apt-get install -y -qq nginx

echo "==> web dizini hazırlanıyor: $WEBROOT"
mkdir -p "$WEBROOT"
chown -R www-data:www-data "$WEBROOT"

echo "==> site yapılandırması"
cp kaloritim.nginx.conf /etc/nginx/sites-available/kaloritim
ln -sf /etc/nginx/sites-available/kaloritim /etc/nginx/sites-enabled/kaloritim
rm -f /etc/nginx/sites-enabled/default

echo "==> yapılandırma testi"
nginx -t
systemctl reload nginx
systemctl enable nginx

echo "==> güvenlik duvarı (ufw varsa)"
if command -v ufw >/dev/null 2>&1; then
  ufw allow 'Nginx Full' || true
  ufw allow OpenSSH || true
fi

echo
echo "Kurulum tamam. Şimdi index.html dosyasını $WEBROOT içine yükleyin, sonra:"
echo "  apt-get install -y certbot python3-certbot-nginx"
echo "  certbot --nginx -d $DOMAIN -d www.$DOMAIN --agree-tos -m ADRESINIZ@ornek.com --redirect"
