---
type: post
layout: post
title: Mengapa kamu (masih) harus men-develop website-mu dengan menggunakan PHP
date: 2013-10-11
author: glend
categories: Notes, PHP
---

Banyak sekali pertanyaan, entah dari forum atau chat pribadi yang menanyakan pertanyaan seperti ini?
<blockquote><em>Om, saya ingin membuat website, saya udah belajar HTML &amp; CSS, lalu apalagi yang harus saya pelajari? Pilih PHP atau Java om ?</em></blockquote>
Dan, jawaban saya (hampir) selalu sama, "Go ahead.. with PHP". Dan pertanyaan berikutnya yang sering yang dapatkan adalah <em>"Kenapa?"</em>.

![Alt text](/images/php.png)

Jawabannya sebenarnya simple. PHP adalah Programming Language for Web Development. PHP adalah programming language untuk web development :) . PHP berbeda dengan bahasa pemograman lain, PHP bukanlah <em>Generic programming language</em> seperti Java, Ruby, ataupun Python. PHP adalah bahasa pemograman yang memang khusus dibuat untuk mengembangkan web. Jika diperhatikan, bahasa pemograman lain seperti Java ataupun Ruby memerlukan extended libraries agar bisa menjalankan web based application. PHP ? 

[more]

kita cuma butuh webserver seperti Apache yang memang dapat diintegrasikan dengan sangat mudah dengan PHP untuk menjalankan web based application.  Di Ruby misalnya, kita masih membutuhkan libraries seperti Rack dan framework seperti Ruby on Rails untuk mengembangkan web. Java malah menyediakan stack khusus untuk web developement yang dinamakan Java EE. Di PHP, kita cuma butuh webserver dan dengan hanya 1 file PHP, kita sudah bisa dianggap mempunyai web :D

<a id="more"></a><a id="more-453"></a>

Hal ini menyebabkan sangat mudah mengembangkan website dengan menggunakan PHP, mulai dari starting point, code, hingga proses deployment. Bisa menyebutkan proses deployment yang lebih mudah daripada deploy aplikasi PHP :) ? Lagipula hanya membutuhkan waktu tidak lebih dari 5 menit untuk memulai coding di PHP. Inilah sebenarnya potensi PHP as  a programing language for web development yang mungkin tidak dapat disamai dengan bahasa pemograman lain.

Itu pula yang menyebabkan saya sampai sekarang masih terus mengikuti perkembangan bahasa pemograman ini, terlepas dari beberapa <a href="http://me.veekun.com/blog/2012/04/09/php-a-fractal-of-bad-design/">komentar miring</a> mengenai PHP, walaupun saat ini lebih banyak bekerja dengan menggunakan Ruby On Rails. Harus saya akui, Rails adalah web framework nomor satu saat ini, setidaknya menurut pendapat saya. Rails menyediakan development flow yang sangat smooth mulai coding hingga proses deployment. Rails juga 'memaksa' kita untuk mengikuti best practices yang dianutnya seperti ReSTful, TDD, hingga Database Migration. Kesemuanya begitu smooth dan sepertinya sudah menjadi nyawa dari Rails itu sendiri.

Bagaimana dengan PHP ? Jika membandingkan PHP sekarang (2013 - saat tulisan dipost) dengan PHP jaman tahun 2005-an, PHP sudah banyak sekali mengalami kemajuan semenjak PHP versi 5.x dirilis. Berbagai best practices dari bahasa pemograman lain sudah diadopsi dengan sangat baik sampai pada hal yang dulu saya anggap tidak mungkin seperti teknik AOP (Aspect Oriented Programming) ternyata sudah bisa <a href="https://github.com/AOP-PHP/AOP">diadopsi di PHP</a> #facepalm. Hal ini juga membuktikan fleksibilitas dan kedinamisan PHP sebagai bahasa pemograman. Framework-framework enterprise level seperti Symfony dan Zend juga berhasil bring PHP to the next level.

Berikut ini sedikit saya paparkan beberapa adopsi yang luar biasa dari PHP yang dapat menjadikannya pilihan Nomor 1 untuk mengembangkan web based application

<strong>1. TDD</strong>

TDD pertama kali diperkenalkan oleh Kent Beck pada tahun 2003. Jika dapat digeneralisasi, inti dari TDD adalah Unit Test dan Java sudah terlebih dahulu melangkah dalam hal ini dengan JUnit. Ruby juga mempunyai RSpec untuk mendukung teknik development ini sampai mengadopsi teknik lebih lanjut dari TDD  seperti BDD dengan menggunakan <a href="http://cukes.info/">Cucumber</a>. PHP?

PHP mempunyai <strong><a href="http://phpunit.de/manual/3.7/en/">PHPUnit</a></strong> untuk unit test, thanks to <a href="http://sebastian-bergmann.de/">Sebastian Bergmann</a> - PHPUnit Creator. Masih kurang? PHP juga mengadopsi Cucumber untuk mendukung BDD dalam bentuk <strong><a href="http://behat.org/">Behat</a>. </strong>Kamu juga dapat menggunakan <a href="https://github.com/padraic/mockery">Mockery</a> (padanan <a href="https://github.com/thoughtbot/factory_girl">Factory Girl</a> di Rails) untuk mock object di PHPUnit

<strong>2. Database Migration</strong>

Sederhananya, Migration adalah teknik untuk meng-alter database melalui kode, bukan meng-alter langsung di database. Kita dapat menambah tabel hingga mengubah kolom (DDL Command) melalui  Migration. Lebih jauh lagi, dengan menggunakan Migration kita dapat me-rollback perubahan pada database. Keuntungan lain dari menggunakan Migration adalah, kita tidak perlu memusingkan perbedaan database/DBMS di development environment kita dengan database di server production. Migration secara otomatis akan mendeteksi database apa yang digunakan dan akan mengeksekusi DDL Command yang sesuai.

Teknik ini menjadi populer seiring dengan hype-nya Ruby on Rails - via Active Record. Di PHP, teknik ini dengan sangat baik diadopsi oleh beberapa framework seperti <a href="http://laravel.com/docs/database/migrations">Laravel</a> ataupun <a href="http://www.yiiframework.com/doc/guide/1.1/en/database.migration">Yii</a>

<strong>3. Composer</strong>

Composer adalah fenomena baru di dunia PHP. Saya tidak akan menjelaskan panjang lebar mengenai Composer ini. Anda dapat membacanya di <a href="http://kodetalk.com/2013/10/10/tentang-composer-dan-pemilihan-framework-php.html">artikel saya sebelumnya</a> :)

<strong>4. AOP</strong>

AOP hampir sama dengan teknik Hooks. Dengan AOP, kita bisa mengintercept suatu eksekusi code dengan sama sekali tidak mengubah existing code, ini yang penting :) . Misalnya kita sudah mempunyai kode untuk menghapus User. Sampai suatu saat, kita ingin program kita mencatat log sebelum menghapus User sedangkan kita sendiri ogah untuk mengubah existing code kita karena suatu sebab. Maka jalan satu-satunya adalah dengan menggunakan teknik ini

AOP adalah teknik unik yang sebenarnya hanya bisa dilakukan oleh Compiled Code, karena saat code dicompile, urutan eksekusi kode kembali diurutkan. Saya pertama kali menemukan teknik ini di Java, dan ternyata di PHP sendiri sudah bisa mengadopsi teknik meskipun dengan <a href="https://github.com/AOP-PHP/AOP">cara yang sedikit tricky</a>. Bahkan sudah ada framework yang mengadopsi teknik ini seperti <a href="http://docs.typo3.org/flow/TYPO3FlowDocumentation/TheDefinitiveGuide/PartIII/AspectOrientedProgramming.html">Flow </a>

<em><strong>Whats next ?</strong></em>

Rasanya, tidak akan lama lagi hingga PHP dapat menyamai Rails ataupun web framework sebagai tools nomor satu untuk development web. Saat tulisan ini ditulis, PHP 5.4 dirilis. Terdapat banyak perubahan major yang dilakukan. Yang paling mencolok adalah built-in webserver seperti Webrick di Rails. Development pun semakin dimudahkan dengan adanya built-in webserver ini, tidak ada lagi error konfigurasi apache ataupun hal-hal semacam itu.

Untuk masalah standarisasi code, juga telah dibuat <a href="https://github.com/php-fig/fig-standards">PSR</a>, dengan komite-nya yang disebut FIG yang didalamnya terdapat nama-nama seperti FabPot (Symfony2), Taylor Otwel (Laravel), ataupun Larry Garfield (Drupal).

Di Indonesia sendiri, terdapat groups <a href="http://www.facebook.com/groups/35688476100/">PHP Indonesia (Facebook)</a> dengan 15.000 anggota, yap tepat ketika saya menulis artikel ini, jumlah anggota groups PHP Indonesia genap berjumlah 15.000 :D , suatu jumlah yang sangat besar dan tentu memiliki potensi yang begitu besar.

Edit: Jumlah member PHP Indonesia saat ini sudah hampir mencapai 25rb

So, masih mikir2 buat mulai belajar PHP ? :)
