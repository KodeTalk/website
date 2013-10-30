---
type: post
layout: post
title: Tentang Composer dan Pemilihan Framework PHP
date: 2013-10-10
author:
  name: Glend Maatita
  email: glend@kodetalk.com
  facebook: Your Facebook
  twitter: Your Twitter
  github: Your Github
  signature: Your Signature
categories: Notes, PHP
---

![Alt text](/images/composer.png)

Baru-baru ini saya membuat doc yang ditujukan untuk para member di groups (Facebook) [PHP Indonesia](http://facebook.com/groups/35688476100/). Berikut ini saya copas langsung dari doc saya, versi asli doc beserta diskusi mengenai doc tersebut dapat langsung dilihat [disini](http://www.facebook.com/groups/35688476100/doc/10151630160556101/)

here we go ...

[more]

**Tentang composer dan pemilihan framework**

*19 April 2013*

Salah seorang member dari PHP Indonesia, Primanata Ardhitama membuat thread yang berisi pertanyaan sebagai berikut:
>>"Saya newbie di dunia PHP, mau tanya2 dikit. Framework PHP yang support scaffolding db, admin page generator, form generator dengan built in captcha, dan mungkin ORM ada ga ya?"

Intinya, Om Primanata ini mencari PHP Framework yang support built-in function yang dia cari yaitu Scaffolding DB, admin page generator, form generator dengan captcha dan ORM. Syarat lainnya adalah framework harus dapat meminimalisir kasus *reinvent the wheel*.

Salah seorang member menyarankan untuk mencoba [Yii Framework](http://yiiframework.com/) karena framework ini mendukung scaffolding DB, ORM, serta dilengkapi dengan banyak sekali extension yang siap pakai. Lalu Taufan Aditya memberi komentar sebagai berikut,

>>"Rata-rata semua framework PHP modern, support fitur diatas (kecuali captcha mungkin). Kalau mau lebih fleksibel (Tidak dikungkung satu rule tertentu dari satu framework, yang biasanya berbeda), PHP punya dependency management bernama Composer, yang mirip dengan Gem di Rails dan Maven di Java. Memungkinkan untuk menggunakan komponen cross-platform (DB dari Symfony, Loader/Acl dari Zend, dst) dalam satu project. FW itu cuman tools. Dan pada dasarnya semua punya prinsip yang sama : menyederhanakan persoalan, dengan menyediakan seperangkat alat yang umum, sehingga developer bisa fokus ke tugas dan tujuan yang spesifik. Saya pikir disini banyak yang menggunakan Codeigniter. Ada juga Yii. Ada juga Zend, Cake, Symfony. Beberapa pakai framework yang ndak dikenal kayak Kohana, SLim, Tonic, etc. Semua ini terserah saja. Composer, itu masa depan, buat komunitas PHP developer. Sebab dia memungkinkan komponen-komponen masing2 FW tsb, bisa dipakai secara bersamaan dengan jalan menyediakan standard. Joomla, Drupal dan beberapa CMS bahkan memulai upaya untuk mengekstrak komponen yang support Composer, sebab mereka sadar kedepan developer PHP butuh sesuatu yang ndak lagi dipetak-petakan oleh framework. One code, for all"


Yang menyebabkan diskusi mengalir menuju pembahasan tentang Composer. Seperti yang dikatakan Taufan diatas, composer adalah dependency manager khusus PHP yang memiliki fungsionalitas seperti Gem (Ruby) atau Maven (Java). Composer ini, menurut Taufan adalah tools masa depan untuk developer PHP, karena dengan Composer, memungkinkan komponen-komponen dari masing-masing Framework tsb, bisa dipakai secara bersamaan dengan jalan menyediakan standard, istilahnya 'One code, for all'. Bahkan CMS-CMS mainstream seperti Joomla dan Drupal sudah mengupayakan untuk mengekstrak komponen-komponennya agar support Composer.

Sayangnya, Yii, sebagai salah satu framework PHP yang paling banyak digunakan kemungkinan masih lama sekali agar support Composer, seperti yang dikatakan Peter Jack Kambey (admin Yii Indonesia),

>>"Saya udah pelajari sedikit soal composer dan rasa2nya Yii with composer masih relatif lama. Butuh waktu lama untuk memperbanyak library2 Yii di Composer. Sekian lama dealing dengan Yii 1.x library2 Yii jarang sekali menggunakan library2 yang freely availabe di internet. Sifat library2 di Yii 1.x itu bentuknya extension dimana library2 tersebut di encapsulate ke Yii style."

Taufan Aditya juga menyayangkan hal ini,

>>"Kalau yang sekarang tiap FW punya repo sendiri utk masing-masing plugin (Spark, Gii, Bundle, Zend Module, etc). Semuanya memaksakan idiom/style masing-masing. Yang jadi korban: developer. Kedepan, kalau developer PHP bikin satu library, yang support composer, ini artinya library tsb bisa digunakan dengan Framework apapun yang support composer. Bahkan tanpa Framework."

Dan memang benar, sekarang ini Framework2 PHP seakan membentuk komunitas sendiri untuk memperbanyak Repository Library-nya yang sayangnya library tersebut tidak dapat digunakan di framework yang berbeda. Beberapa diantaranya adalah:

+ CodeIgniter - [Spark](http://getsparks.org)

+ Laravel -  [Bundles](http://bundles.laravel.com/)

+ Yii - [Extensions]((http://www.yiiframework.com/extensions/)

+ Kohana - [Modules](http://kohana-modules.com/)

+ Zend Framework - [Zend Modules](http://modules.zendframework.com)


Bandingkan dengan framework di dunia lain, mereka hanya punya satu repository yang di-support seluruh developer yang pakai language tersebut. Dan seluruh library di repo tersebut dapat dipakai di semua framework di languange tersebut.

+ Java - [Maven](http://mvnrepository.com/)

+ Ruby - [Gems](http://rubygems.org/)

+ NodeJs - [NPM](https://npmjs.org/)

PHP sendiri sudah memulai upaya ini dengan membuat repository yang berisi libray standard yang dapat dipakai semua framework asalkan framework tersebut support Composer. Repository tersebut bernama [Packagist](http://packagist.org). Untuk menggunakan library-library yang terdapat di Packagist itulah digunakan Composer.

Diskusi mengerucut lagi menjadi kesimpulan utama, yaitu jika memilih framework PHP, apapun itu, pastikan framework tersebut support Composer. Hal ini membuat pekerjaan kita menjadi fleksibel, atau bahkan tanpa framework sekalipun, hanya menggunakan Composer, pekerjaan kita jauh lebih mudah tanpa harus selalu ***reinvent the wheel***.

Enjoy the revolution of PHP :)