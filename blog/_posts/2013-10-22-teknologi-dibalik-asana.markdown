---
type: post
layout: post
title: Teknologi Dibalik Asana
date: 2013-10-22
author:
  name: Glend Maatita
  email: glend@kodetalk.com
  facebook: Your Facebook
  twitter: Your Twitter
  github: Your Github
  signature: Your Signature
categories: Notes, Review
---

Sudah pernah dengar Asana? Asana adalah project management tools and collaboration, yang menawarkan simplicity dan tampilan yang menawan untuk memudahkan kita mengatur task-task di project kita. Asana didirikan oleh salah seorang founder Facebook yaitu, [Dustin Moskovits](http://en.wikipedia.org/wiki/Dustin_Moskovitz). Asana sangat fleksibel dan memudahkan kita untuk men-track seluruh task di project kita. Untuk tahu lebih jelas tentang Asana, silakan langsung menuju website [Asana](https://asana.com/) karena artikel ini tidak membahas step by step cara menggunakan Asana. Anda bisa langsung mencoba sendiri

![Alt text](/images/asana.jpg)

Yang akan kita bahas disini adalah teknologi di balik layar Asana dan tools apa saja yang digunakan untuk mendukung workflow didalam tim internal Asana. Oke langsung saja..

Greg Slovacek, salah seorang developer yang bekerja di Asana membocorkan sedikit beberapa teknologi yang digunakan oleh timnya di Asana untuk membangun project management software yang reliable dan scalable. Berikut rangkuman dari Greg Slovacek seperti yang ditulis di situs tanya jawab [Quora](http://www.quora.com/Asana/What-technologies-is-Asana-built-with)

Asana menggunakan beberapa teknologi yang sudah proven untuk membangun software yang handal, diantaranya adalah 

[more]

**1. Amazon Web Services**

Asana menggunakan AWS sebagai platform cloud computing mereka. Alasannya sederhana, AWS dianggap sebagai platform cloud computing yang paling solid saat ini. Sampai saat ini, semua production services Asana berjalan diatas Amazon EC2 instances.

**2. MySQL** 

Asana menggunakan MySQL untuk databasenya. Tepatnya Mysql dengan InnoDB yang berjalan diatas *Amazon Relational Database Service (Amazon RDS)*

**3.Memcache** 

Untuk distributed caching, Asana menggunakan *Amazon ElastiCache*

**4. Kraken**

Saya sendiri kurang begitu mengerti kegunaan dari Kraken ini. Yang jelas, tools ini buatan internal dari tim developer Asana dan telah di-opensource-kan. Silakan cek reponya [disini](https://github.com/Asana/kraken)

**5. Elastic Search**

Asana menyediakan fitur untuk pencarian task, dan engine searching dibelakangnya adalah [Elastic Search](http://www.elasticsearch.org/). Sebuah search engine berbasis Apache Lucene

**6. Scribe**

Asana menggunakan [Scribe](https://github.com/facebook/scribe) untuk logging pada sisi backend, yaitu terutama untuk mencatat setiap event dan behaviour yang dilakukan oleh user. Yang nantinya log tersebut akan dianalysis dan digunakan untuk re-indexing data untuk keperluan searching

**7. v8cgi**

v8cgi sekarang lebih dikenal dengan nama [NodeJS](http://nodejs.org/). Bukan sesuatu yang mengejutkan jika Asana memakai NodeJS untuk backendnya. Salah satu concern Asana adalah tentang data real time, dan NodeJS sangat cocok untuk menghandle hal tersebut. Selain itu, dengan menggunakan NodeJS, developer dapat men-share sebagian besar kode untuk sisi server dan client, karena sama-sama menggunakan bahasa pemograman Javascript.

**8. A custom dispatcher ("JSWeb")**

Dibuat dengan menggunakan Erlang, berjalan di semua webserver production Asana, dan bertugas untuk mengirim setiap request ke NodeJS process

**9. Nginx**

Berada tepat didepan Custom dispatcher dan mengurusi semua hal yang berada di level HTTP protocol seperti keepalive, gzip, request logging, dll.

**10. haproxy + stunnel**

Asana menggunakan HAProxy untuk Load Balancer

Teknologi-teknologi diatas sebagian besar adalah teknologi yang sudah dikenal luas dan merupakan hal yang cerdas jika menggunakannya untuk membangun suatu sistem yang stabil dan scalable

> *Often, to do great things we must stand on the shoulders of giants.* , **- Greg Slovacek**

Sedangkan tools untuk mendukung workflow kerja dan kolaborasi tim developer, Asana menggunakan beberapa tools sebagai berikut

**1. Chocolate**

Sepertinya, para developer Asana sangat menyukai coklat sampai-sampai Greg Slovacek memasukkan ini ke perlengkapan wajib saat coding :) 

**2. Asana**

Aneh rasanya jika perusahaan yang membuat tools project management tidak memakai produknya sendiri untuk memanage project di kantornya :) . jadi jangan berharap orang-orang di Asana memakai tools semacam Microsoft Project atau Basecamp

**3. Google Docs**

Google Docs adalah tools kolaborasi kelas wahid untuk mengatur hal-hal yang berkaitan dengan dokumen. Selain Google Docs, Asana juga sempat menggunakan Google Mail, yang sekarang telah di-replace menggunakan fitur Inbox di Asana

**4. Git**

Jaman sekarang, tidak pakai Git justru hal yang aneh. Sepertinya tidak perlu saya jelaskan lagi kenapa tim developer di Asana, dan jutaan tim developer lainnya menggunakan Git

**5. Phabricator**

Code Review tools asli buatan internal Facebook. Cek tools yang amazing ini [disini](http://phabricator.org/)

**6. Jenkins**

[Jenkins](http://jenkins-ci.org/) udah jelas untuk Continous Integration. Topik menarik ini akan dibahas di beberapa artikel berikutnya :)


**7. Minotaur**

Tools buatan internal Asana yang digunakan sebagai error-reporter yang terintegrasi penuh dengan Asana via API. Tiap terjadi crash di sistem milik Asana, Minotaur akan mencatat dan menggenerate report. Bahkan, jika ada developer yang me-push code dan code tersebut menyebabkan problem, Minotaur secara otomatis akan mengeluarkan alert

**8. Desk**

Asana menggunakan [Desk](http://www.desk.com/) untuk helpdesk system

**9. Recurly**

Asana menggunakan [Recurly](http://www.recurly.com/) untuk billing system

Bagiamana? Kita bisa belajar bagaimana perusahaan sekelas Asana memanfaatkan teknologi yang ada untuk mengembangkan aplikasi yang handal. *No reinvent the wheel, stand on the shoulders of giants, and just focus on your product development*. Lain kali akan kita bahas dibalik layar website-website besar lainnya.

Happy Coding :)