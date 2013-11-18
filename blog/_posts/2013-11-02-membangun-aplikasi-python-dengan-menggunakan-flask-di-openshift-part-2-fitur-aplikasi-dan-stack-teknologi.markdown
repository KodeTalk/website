---
type: post
layout: post
title: Membangun Aplikasi Python dengan Menggunakan Flask di OpenShift Part 2: Fitur Aplikasi dan Stack Teknologi
date: 2013-11-02
author: eko
categories: Programming, Cloud, Python
---

![Alt text](/images/online-cv.jpg)

Jika kamu mengikuti part 1 dari seri tutorial ini, maka saya bisa menganggap anda sudah melakukan step-step mandatory sebelumnya seperti mendaftar di Openshift dan telah sukses menginstall RHC Client Tools. Di part ini, saya akan menjabarkan detail aplikasi seperti apa yang akan kita coba bangun beserta stack teknologi yang digunakan dibelakangnya. 

Aplikasi yang akan kita buat nanti bukan sekedar aplikasi untuk menampilkan tulisan *Hello World!*, sebuah aplikasi yang umum digunakan sebagai awal pengenalan. Tapi kita akan coba buat aplikasi yang sedikit kompleks, minimal cukup sebagai proof of concept dari teknologi yang akan kita gunakan. Terkadang, ketika kita melamar suatu pekerjaan, employer akan bilang,

>*'Oke, saya punya kerjaan Python untuk anda, tapi apa anda mempunyai kualifikasi yang kami cari? Ada portofolio yang bisa anda tunjukkan?'*. 

Kejadian selanjutnya sepertinya sudah bisa diprediksi. Umumnya kita akan mengirim CV kita dalam bentuk PDF atau DOC dengan beberapa link yang merujuk ke portofolio kita (bila kita punya portofolio online). Atau mungkin kita hanya cukup untuk mengirim [public linkedin](http://id.linkedin.com/pub/eko-wibowo/30/32b/503/) kita atau page [about.me](http://about.me/ekowibowo) kita. Tapi.. hey, kenapa kita tidak memberi mereka pengalaman istimewa, yaitu dengan mengajak mereka untuk mengeksplore CV online interaktif kita, yang dibangun dengan stack teknologi Python di belakangnya dan di-host ke Openshift? Saya yakin itu akan menjadi pengalaman yang istimewa bagi calon employer anda hehe :D

Sekarang, mari kita bikin list untuk aplikasi kita yang keren ini. Dari konsep aplikasi yang sudah kita tentukan sebelumnya, yaitu aplikasi untuk CV, online dan interaktif, maka fitur-fitur yang ada nantinya, kira-kira sebagai berikut:

[more]

+ Walaupun awalnya saya ingin aplikasi untuk menampilkan CV personal saya pribadi, tapi saya juga ingin agar orang lain juga bisa **Signup** untuk membuat CV online mereka sendiri, dan punya URL unik untuk menampilkan CV online mereka tersebut. Jadi kira-kira aplikasi ini akan mirip dengan [About.me](http://about.me/) yang mana kita dapat memperoleh URL yang unik untuk page kita yaitu di ***about.me/[YOUR NAME]***. Aplikasi ini akan mempunyai behaviour yang kira-kira sama.

+ User dapat mengisi data dirinya ke personal page mereka, terutama data-data tentang profesionalitas dirinya, seperti *status pekerjaan sekarang, penguasaan teknologi, pendidikan, aktivitas Github, portofolio, dll*. Untuk fitur ini, aplikasi ini akan mirip dengan Linkedin.

+ Visitor aplikasi kita, yaitu mungkin termasuk calon employer, akan bisa me-filter data berdasarkan misalnya Penguasaan Teknologi. Ini akan memudahkan mereka menemukan kandidat employee yang mereka cari-cari selama ini

+ Desain akan dibuat semenarik dan se-interaktif mungkin. Misalnya, setiap page personal user akan mempunyai tag-tag tentang Penguasaan Teknologi (Technologu Mastered) misalnya, dan ketika link tag tersebut diklik, data user akan difilter dengan menggunakan *Ajax request* tanpa perlu me-load ulang halaman tersebut. Konsep yang umum digunakan di era [Web 2.0](http://en.wikipedia.org/wiki/Web_2.0) saat ini

+ User dapat melakukan Signup dan Signin dengan menggunakan Social Media semisal Facebook, Twitter, atau Gmail

+ Page personal user dapat didownload dalam bentuk PDF 

Great, Kita sudah mempunyai daftar fitur yang akan kita realisasikan di aplikasi kita nanti. Sedangkan, stack teknologi yang akan kita gunakan adalah sebagai berikut

**1. Openshift**

Sebagai cloud server & platform tempat aplikasi kita di-host. Kenapa Openshift? tentunya anda tahu kenapa kita pilih Openshift, sudah saya tuangkan uneg-uneg saya [disini](http://kodetalk.com/2013/10/31/pengenalan-openshift-pengganti-heroku-untuk-aplikasi-web-python-anda.html). 

**2. Python (v2.7)**

Python versi 3 memang sudah dirilis, tapi sampai sekarang, saya masih ingin mengeskplore lebih dalam versi 2.x ini. Terutama lebih disebabkan karena saya ingin mengeksplore [Twisted Framework](http://twistedmatrix.com/trac/wiki) yang sampai sekarang masih menggunakan Python v2.x. Saya rasa, migrasi ke versi 3 tidak terlalu susah dan bleeding

**3. Python Flask**

![Alt text](/images/flask.png)

[Flask](http://flask.pocoo.org/) adalah micro-framework untuk membuat web application di Python. Sangat simple dan sederhana tapi fun to use. Kita bisa membuat aplikasi web sederhana yang hanya terdiri dari satu file, sudah termasuk view, model, etc. Meskipun pada saat pertama kali Flask dibuat sang creator ingin agar framework ini menjadi framework yang kecil, sederhana, dan padat, seiring dengan berjalannya waktu, para kontributor berhasil membuat banyak sekali set extension lengkap untuk Flask, sehingga Flask dapat benar-benar dimanfaatkan untuk membuat aplikasi web yang mutakhir dan lengkap. Akan tetapi, kita tetap dapat menggunakan Flask seminimalis mungkin. Jika kita ingin meng-extend fitur basic Flask, kita dapat langsung menggunakan beragam extension mulai dari ORM, Form Handling, OpenID, dan masih banyak lagi lainnya. Sebuah pendekatan yang menurut saya sedikit berbeda dengan apa yang dilakukan oleh [Django](https://www.djangoproject.com/) dimana ia merupakan full-stack framework yang sudah memiliki beragam fitur yang melekat padanya. Dengan Flask, kamu dapat memilih dengan fleksibel stack technology apa yang ingin diintegrasikan ke dalam aplikasimu

**4. SQL Alchemy**

Saat ini, [SQLAlchemy](http://www.sqlalchemy.org/) mungkin adalah ORM de-facto untuk aplikasi di Python. SQLAlchemy juga mempunyai extension untuk Flask, sehingga dapat diintegrasikan dengan mudah ke dalam aplikasi berbasis Flask. Jika kamu tidak menyukai ORM Style dan masih ingin menggunakan plain SQL, well.. you're not alone. Awalnya, saya tidak berpikir bahwa dengan mempelajari ORM, akan memberikan manfaat positif bagi karier saya sebagai software engineer. Tapi semua itu berubah, SQLAlchemy benar-benar bermanfaat bagi saya. Dimulai dari SQL Schema definition, database creation/migration dan database query, semuanya begitu intuitif dan sangat mudah untuk digunakan. Jadi, kamu harus coba ini :)

**5. Bootstrap**

Saya pribadi bukanlah web designer yang handal. Saya tidak expert di bidang layouting, design, atau bahkan CSS. Jika saya diminta untuk untuk mendesign web from scratch, mungkin kepala saya sendiri yang akan saya scratch hehe.. Tapi semua berubah ketika [Bootstrap](http://getbootstrap.com/%E2%80%8E) datang. Bootstrap adalah CSS framework, open sourced, yang memungkinkan kita-kita, yang tidak jago dalam hal design ini, membuat design Web 2.0 yang bagus dengan menggunakan [Web UI element](http://bootsnipp.com/) yang sudah disediakan oleh Bootstrap seperti fluid layout, navbar, search box, form element, header & footer, dsb.

**6. PostgreSQL**

Aplikasi kita nanti akan menggunakan PostgreSQL untuk database relationalnya. Sebenarnya, ketika kita sudah menggunakan SQLAlchemy untuk ORM, perbedaan database tidak akan berpengaruh signifikan di sisi coding. Kita bisa pakai database relational yang lebih ringan semisal SQLite atau MySQL. Beda kasus jika kita menggunakan database model NoSQL seperti Mongo atau Redis

Yap, perlengkapan sudah kita list, saatnya untuk coding, dimulai dari part berikutnya.

Stay tune ya !

Tulisan versi asli (English) dapat dibaca di [http://pythonthusiast.pythonblogs.com/](http://pythonthusiast.pythonblogs.com/230_pythonthusiast/archive/1307_building_python_flask_application_in_openshiftheroku_replacement_part_ii__application_features_and_its_stack_of_technology_about_to_use.html)