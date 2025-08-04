#!/bin/bash

PKG="com.tencent.iglite"
GITHUB_URL="https://raw.githubusercontent.com/YarasaTRIO/YarasaPatch/main/hook.so"

FILENAME="hook.so"
TEMP_PATH="/sdcard/$FILENAME"
DEST="/data/user/0/$PKG/lib"

echo "[*] Dosya indiriliyor..."
curl -L -o "$TEMP_PATH" "$GITHUB_URL"
if [ $? -ne 0 ]; then
    echo "[!] Dosya indirilemedi!"
    exit 1
fi

echo "[*] Dosya lib dizinine kopyalanıyor..."
su -c "cp '$TEMP_PATH' '$DEST/$FILENAME' && chmod 777 '$DEST/$FILENAME'"

if [ $? -eq 0 ]; then
    echo "[✓] Dosya başarıyla $DEST konumuna kopyalandı."
else
    echo "[!] Dosya kopyalanamadı! Root izni ve dizin kontrolü yap."
fi

rm -f "$TEMP_PATH"
