---
type: post
layout: post
title: Pengenalan Silex Framework Part 1
date: 2013-10-24
author: glend
categories: PHP, Framework, Silex
---

Silex adalah PHP Micro-framework berbasis Symfony2. Karena bentuknya adalah micro-framework, Silex sejatinya hanya menyediakan fungsi dasar suatu framework, yaitu **Routing**. Yup, framework ini hanya menyediakan fungsi routing saja, dan tidak menyediakan berbagai macam fungsionalitas serpti yang disediakan full stack framework lainnya semisal Laravel atau Symfony yang sampai menyertakan fitur ORM atau form-helper. Contoh micro-framework lainnya yang patut anda coba adalah [Slim](http://www.slimframework.com/) atau [Tonic](http://www.peej.co.uk/tonic/). Silex dibuat oleh [Fabien Potencier](http://fabien.potencier.org/) aka Fabpot sebagai bagian dari proyek Symfony.

![Alt text](/images/silex.jpg)

[more]

Walaupun bentuknya adalah Micro-framework, Silex adalah framework yang full support Composer. Artinya, kita dapat menggunakan puluhan ribu [Composer Package](http://packagist.org/) untuk mengscale fungsionalitas dasar bawaan Silex. Selain itu, karena merupakan bagian dari Symfony project, kita dapat dengan mudah mengintegrasikan Silex dengan komponen-komponen Symfony melalui Service Provider. Ini menarik, dan akan kita bahas nanti :)

Mari kita mulai. Disini saya menggunakan Ubuntu 12.04, PHP 5.5.3 (minimal anda menggunakan PHP 5.3), Apache Webserver, dan database MySQL. Pesan terselip saya, bagi anda pengguna non unix based, please dengan sangat, segera install minimal Linux di komputer anda. Sungguh, ini akan sangat berguna untuk proses pembelajaran anda, terutama dalam mengikuti setiap tutorial yang bertebaran di internet, terutama di Kodetalk.com ini :D 

**Instalasi**

Cara termudah untuk install Silex adalah melalui [Composer](http://getcomposer.org). Pertama, buat satu folder kemudian download dan install composer di dalamnya

    ~$ mkdir silex-project && cd silex-project
    ~$ curl -sS https://getcomposer.org/installer | php

Buat file composer.json

    ~$ touch composer.json

yang isinya seperti dibawah ini

    {
        "require": {
            "silex/silex": "~1.1"
        }
    }
    
Jalankan composer install dan silakan minum copy atau menghabiskan sebatang rokok anda untuk menunggu composer melakukan tugasnya :)

    ~$ php composer.phar install
    
**Membuat struktur folder**

Ini adalah optional, bisa anda lakukan atau tidak terserah anda. Ini semata-mata hanya untuk memudahkan saya. Biasanya, saya meniru struktur folder dari framework yang sudah mapan. Kurang lebih, struktur folder kita akan seperti ini nantinya. Sekali lagi, anda bisa punya struktur folder versi anda sendiri

    + silex-project
        + assets
            + images
            + css
            + js
        + app
            + views
            - boostrap.php
        - composer.json
        - index.php
    
Yang utama adalah lokasi **index.php** dan **bootstrap.php**. File index.php nantinya akan kia gunakan sebagai pintu masuk dari semua request. Sedangkan bootstrap.php akan berisi sebagai tempat untuk kode-kode kita nantinya.

**Memulai Silex**

Oke, kita akan brief Silex ini dengan cepat. Buka file **index.php** dan kita isi dengan kode. Index hanyalah pintu gerbang dari tiap request. Dan request itu akan kita match-kan dengan routing yang ada di **bootstrap.php** nantinya. Jadi file index.php kita hanya akan berisi seperti ini

    include 'app/bootstrap.php';

Kita memanggil file boostrap.php yang ada di folder **app**. Cuma segitu? Kita juga bisa menambahkan beberapa konstanta, atau mungkin kita menambahkan beberapa kode untuk mengoverride isi dari **php.ini** seperti misalkan kode dibawah ini

    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    include 'app/bootstrap.php';
    
Sedangkan isi dari file utama kita yaitu boostrap.php akan berisi routing-routing dimana setiap request akan diproses dan dikirim response balik. Karena kita disini menggunakan Composer, hal pertama yang harus dilakukan adalah meng-include-kan file autoload dari Composer

    require_once __DIR__.'/../vendor/autoload.php';
    
selanjutnya adalah mendaftarkan komponen dari Symfony yang dibutuhkan oleh Silex untuk melakukan fungsi dasarnya yaitu Routing

    use Symfony\Component\HttpFoundation\Request;
    use Symfony\Component\HttpFoundation\Response;
    
Langkah berikutnya adalah membuat instance dari Silex App
    
    // initialize
    $app = new  Silex\Application();
    
Dilanjutkan dengan membuat function routing. Kita akan membuat contoh function untuk menangkap routing ke path (/), jadi ketika kita akses project kita di *localhost/silex-project/* , request akan ditangani oleh function ini

    $app->get('/', function(Request $request) use($app) {
        return "Hello Glend!!";
    });
    
Terakhir kode untuk menjalankan Silex

    $app->run();
    
Selesai!! Selanjutnya arahkan browser anda ke *http://localhost/silex-project/* dan anda akan melihat 'Hello Glend!' terpampang manis disana :)

Sekian Part 1 untuk pengenalan Silex ini. Di part berikutnya akan kita bahas konsep routing dengan Restfull di Silex Framework

Happy Coding!!