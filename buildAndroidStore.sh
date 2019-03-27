
# Borra el anterior
rm final.apk

# Se situa en el directorio
cd build

# Empaqueta
cordova -d build android --release

# Mueve a la raíz el apk
mv platforms/android/build/outputs/apk/android-release-unsigned.apk .

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ../app.keystore android-release-unsigned.apk idecrea

# Alinea
zipalign 4 android-release-unsigned.apk android-release-compress-unsigned.apk

# Borra el anterior
rm android-release-unsigned.apk

# Mover al directorio raiz
mv android-release-compress-unsigned.apk ../final.apk

# Te avisa 
echo '-------------------------------------------------'
echo 'Finish :)'
