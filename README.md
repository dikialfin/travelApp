Course : 42. Menambahkan Firebase :
Untuk IOS

- Pergi ke console.firebase.google.com
- Pilih create project
- Google analytics opsional boleh di aktifkan atau tidak
- Create project
- Pilih project IOS
- IOS bundle id bisa di temukan pada folder ios/Runner.xcworkspace
- akan otomatis membuka xcode
- pilih runner
- bundle identifier ubah sesuai dengan domain kita
- save
- copy identifier yang sudah di ubah tadi ke IOS bundle id pada firebase
- register app
- download googleService-Info.plist
- pindah kan file hasil download ke folder ios/runner
- Kembali ke xcode pada folder runner double klik "Add Files To 'Runner"
- tambahkan googleService-info.plist
- kembali ke firebase kemudian continue to console

Tambahkan package :

- firebase_auth
- firebase_core
- cloud_firestore

Untuk Android

- pada firebase google create project untuk android
- android package name ada di android/app/buildgradle _package name tidak boleh example ketika aplikasi akan di publish/ di masukan ke playstore_
- debug signing certificate SHA-1 boleh di kosongkan
- register app
- download file google-services.json kemudian pindahkan ke android/app
- edit file buildgradle yang ada pada folder /android dan android/app sesuai petunjuk firebase google
- continue to console

Course : 46 Setting Firebase Authentication & Firestore

Setting Firebase Auth

- tambah kan authentication pada console firebase
- pilih signin method nya (untuk method login menggunakan email, pada bagian Email link (passwordless signin) boleh di disable saja)
- save

Setting Firestore Database

- pada console firebase pergi ke menu firestore database
- create database (bebas mau pilih production mode atau test mode)
- pilih lokasi cloud firestore server yang terdekat saja, kemudian simpan/next
- ubah rules nya
- pada bagian edit rules allow read, write nya ubah jadi true
- selesai

Course 56 : Menambahkan Data Ke Database Firebase, Dan Upload Image Assets Nya
Upload Image Assets Ke Firestore

- Pergi ke console firestore nya
- masuk ke menu storage pada menu Build/Storage
- create new folder
- pilih folder yang tadi kita buat
- pilih upload file
  Menambahkan Data ke Database Firebase
- bikin colection baru
- document id nya kita auto generate aja
- buat field sesuai kebutuhan
- pada kasus ini field imageUrl kita isikan url dari image asset yang sudah kita upload ke storage firestore tadi
- jika sudah, save
