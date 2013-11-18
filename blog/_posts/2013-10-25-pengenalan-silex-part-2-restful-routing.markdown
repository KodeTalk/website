---
type: post
layout: post
title: Pengenalan Silex Part 2 - Restful Routing
date: 2013-10-25
author: glend
categories: PHP, Framework, Silex
---
Di part ini kita akan membuat contoh aplikasi Restfull sederhana dengan menggunakan Silex Framework. Disamping itu, kita juga akan mengintegrasikan Silex dengan beberapa komponen Symfony lainnya seperti [Twig Template Engine](http://twig.sensiolabs.org/) dan [Doctrine DBAL](http://www.doctrine-project.org/projects/dbal.html). Here we go..

[more]

Kita buat dulu database nya. Kita akan membuat aplikasi sederhana untuk mengatur User. Terdiri dari Create, Read, Update, Delete atau lebih dikenal dengan singkatan CRUD. Yap, kita akan buat CRUD User. Kita akan punya database **silexproject.db** dengan table user seperti yang terlihat dibawah ini

    +--------------+------------------+
    | Kolom        | Tipe Data        |
    +--------------+------------------+
    | id           | int              |
    | nama         | varchar(255)     |
    | gender       | char(1)          |
    | email        | varchar(255)     |
    | telepon      | varchar(255)     |
    | alamat       | text             |
    +--------------+------------------+

nb: di komputer saya, saya punya rincian database seperti berikut
    
    nama database : silexproject.db
    user : root
    password : password

Silakan sesuaikan dengan komputer anda masing-masing.
    
Untuk routing Restful nya akan kita buat seperti ini

    +-----------------+------------------+---------------------+
    | Method          | Endpoint         | Keterangan          |
    +-----------------+------------------+---------------------+
    | GET             | /users           | Get all users       |
    | GET             | /user/new        | Add new user        |
    | POST            | /users           | Save new user       |
    | GET             | /user/{id}       | Get a user          |
    | GET             | /user/{id}/edit  | Edit user           |
    | PUT             | /user/{id}       | Update user         |
    | DELETE          | /user/{id}       | Delete a user       |
    +-----------------+------------------+---------------------+
    
**Setting Doctrine DBAL dan Twig**

Doctrine dan Twig adalah salah satu komponen ORM dari Symfony. Dan karena Silex juga merupakan bagian dari Symfony, maka integrasi dengan Doctrine DBAL dan Twig akan sangat mudah via service provider. Pertama, kita require dulu Doctrine DBAL dan Twig ke dalam **composer.json** kita

    {
        "require": {
            "silex/silex": "~1.0",
            "twig/twig": "v1.13.2",
            "doctrine/dbal": "2.2.*"
        }
    }
    
Lalu install

    ~$ php composer.phar install
    
Langkah berikutnya adalah men-setting service provider untuk Doctrine dan Twig agar dapat dengan mudah digunakan di dalam Silex Framework. Kita tambahkan dulu namespace untuk dua komponen tersebut

    ...
    use Silex\Provider\DoctrineServiceProvider;
    use Silex\Provider\TwigServiceProvider;
    
Kemudian, daftarkan dua komponen tersebut ke dalam service provider

    /* DOCTRINE DBAL */
    $app->register(new Silex\Provider\DoctrineServiceProvider(), array(
        'dbs.options' => array (
            'mysql_read' => array(
                'driver'    => 'pdo_mysql',
                'host'      => 'localhost',
                'dbname'    => 'silexproject.db',
                'user'      => 'root',
                'password'  => 'password',
                'charset'   => 'utf8'
            )
        )
    ));
    
    /** TWIG */
    $app->register(new TwigServiceProvider(), array(
        'twig.path' => __DIR__.'/views',
    ));

Terlihat di konfigurasi diatas bahwa kita akan meletakkan file-file template untuk Twig pada folder **views**.

**Setting Routing**

Langkah berikutnya adalah membuat routing. Routing di Silex sangat unik dan simple. Dengan memanfaatkan **closure** kita dapat membuat suatu routing dengan cara seperti ini

    $app->get('/', function(Request $request) use($app) {
    
    });
    
variabel **$app** adalah variabel yang bernilai instance dari **Silex\Application**. Sedangkan **$app->get** berarti function tersebut akan menangkan request dengan method *GET*. Dan **('/')**  adalah endpoint. Sehingga routing diatas dapat diterjemahkan menjadi routing yang menangkap setiap Request di URL (/) dengan method GET, serta memasukkan beberapa parameter yaitur $request dan $app. Mudah bukan :) ? 

Jadi, jika kita mempunyai list endpoint seperti diatas, maka harusnya kita akan mempunyai list routing seperti berikut ini

    // Get all users
    $app->get('/users', function(Request $request) use($app) {
    
    });
    
    // new user
    $app->get('/user/new', function(Request $request) use($app) {
    
    });
    
    // save new user
    $app->post('/users', function(Request $request) use($app) {
    
    });
    
    // show a user with ID
    $app->get('/user/{id}', function(Request $request, $id) use($app) {
    
    });
    
    // edit a user
    $app->get('/user/{id}/edit', function(Request $request, $id) use($app) {
    
    });
    
    // update a user 
    $app->put('/user/{id}', function(Request $request, $id) use($app) {
    
    });
    
    // delete a user
    $app->delete('/user/{id}', function(Request $request, $id) use($app) {
    
    });
    
yap, sekian Part 2 ini tentang routing restfull dengan Silex. Part berikutnya kita akan membuat kode production aplikasi dengan menggunakan Silex Framework, Doctrine DBAL, dan Twig Template Engine

Stay tune dan Happy Coding :)