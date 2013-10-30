---
type: post
layout: post
title: Pengenalan HAML
date: 2013-10-23
author:
  name: Glend Maatita
  email: glend@kodetalk.com
  facebook: Your Facebook
  twitter: Your Twitter
  github: Your Github
  signature: Your Signature
categories: Ruby
---

Erb atau Embedded Ruby adalah template engine default di Rails. Dengan Erb, kita dapat mencampur kode Ruby secara dinamis ke html template kita. Sangat mudah dan simple tapi akan menjadi suatu masalah tersendiri jika kode campuran di Erb kita semakin bloated. 

Baru-baru ini saya banyak mengeksplore beberapa teknologi untuk templating. Alasannya sebenarnya simple, saya sudah mulai dibuat pusing oleh ERB (Embedded Ruby) di project saya yang sudah mulai menunjukkan tanda-tanda akan menjadi bloated. Dan dengan sekali searching, saya sudah bisa tahu apa alternatif yang paling cepat dan mudah untuk me-replace ERB, yaitu <a href="http://haml.info/">HAML</a>.

![Alt text](/images/haml.png)

[more]

HAML (HTML abstraction markup language) sebenarnya tidak dapat dikatakan sebagai template engine, tapi sesuai namanya, HAML adalah abstraksi untuk HTML. HAML sangat mudah digunakan dan dipahami. Ditambah lagi sudah jalan secara native di Ruby sehingga dapat langsung diintegrasikan ke project yang sudah anda kembangkan dengan menggunakan Rails. Untuk menginstall HAML, kita cukup menambahkan baris berikut ini di Gemfile

    # Gemfile
    gem 'haml'

Langkah berikutnya adalah meng-convert file-file ERB menjadi HAML. Langkah pertama adalah mengganti ekstensi **.erb** menjadi **.haml**. Jadi semisal kita mempunyai file *index.html.erb* maka kita harus me-rename-nya menjadi *index.html.haml*.

Langkah selanjutnya adalah mengubah syntax HTML pada file ERB ke syntax HAML. Jangan kuatir, mengubah syntax ke HAML ini bukan mimpi buruk seperti yang pada awalnya saya pikirkan. Justru syntax HAML ini sebenarnya jauh lebih clean, short, dan sangat readable dibanding dengan syntax HTML. Lihat bagaimana kode HTML ini diconvert ke format HAML

    <p>Hello World!</p>

Dengan menggunakan HAML, maka markup diatas akan menjad

    %p Hello World!

Sederhana bukan. Dan terlihat sekali bahwa markup kita menjadi menjadi lebih pendek dan readable.

HAML tidak mengenal tanda **< >** seperti pada html. Sebagai alternatifnya, haml menggunakan tanda **%** diikuti dengan keyword html biasa dan *tidak perlu markup penutup*. Jadi kode seperti

    <div>My name is Glend</div>

akan menjadi

    %div My Name is Glend

Untuk html attributes, haml menggunakan ruby hash untuk menggantikannya sehingga haml ini menjadi sangat readable di mata para programmer Ruby. Lihat contoh dibawah ini

    <div class="large" id="panel-1">
        <p class="name">My Name is Glend</p>
    </div>

akan menjadi

    %div{ class: "large", id: "panel-1" }
        %p{ class: "name" } My Name is Glend

Sekedar info, Ruby hash adalah bentuk simple untuk membuat data collection, yang terdiri dari key dan value. Programmer PHP mengenal hash ini sebagai array. Kita ambil contoh diatas

    { class: "name" } # key = class dan value = "name"

Simple bukan? :D Dan berikut ini adalah beberapa hal yang perlu diperhatikan dalam menggunakan haml, yaitu 

**1. Penggunaan Indentation** 

Karena haml tidak menggunakan markup penutup seperti html, maka haml sangat mengandalkan **identation** untuk mengatur markup-nya. Anda harus hati-hati dalam penggunaan identation. Untungnya IDE dan text editor seperti Sublime Text 2 sudah mendukung indentation dengan sangat baik. Berikut ini adalah perbedaan markup yang akan dihasilkan haml berdasarkan identation. Kita ambil contoh diatas

    %div{ class: "large", id: "panel-1" }
        %p{ class: "name" } My Name is Glend

akan menghasilkan

    <div class="large" id="panel-1">
        <p class="name">My Name is Glend</p>
    </div>

Tapi...

    %div{ class: "large", id: "panel-1" }
    %p{ class: "name" } My Name is Glend

akan menghasilkan

    <div class="large" id="panel-1"></div>
    <p class="name">My Name is Glend</p>

Dapat dilihat perubahan markup yang akan terjadi jika salah sedikit saja.

**2. Syntax haml adalah [keyword HTML + attributes] [SPASI] Konten**

Perhatikan kata kunci spasi diatas. Selain indentation, yang perlu anda perhatikan adalah spasi saat menulis markup haml. Misalnya, kode dibawah ini adalah kode yang salah

    %div { class: "large", id: "panel-1" }
        %p { class: "name" } My Name is Glend


Kenapa salah? karena ada space antara **%div** dan **hash** :) . Sedangkan kode berikut ini adalah kode yang benar

    %p{ class: "name" } My Name is Glend


Tidak ada space antara **%p** dan **hash**. Dan space terjadi antara keyword HTML + attributes ( %p{ class: "name" } ) dan konten ( My Name is Glend )

**3. Using short syntax**

Anda dapat menggunakan short syntax pada haml agar kode anda menjadi lebih readable. Contohnya adalah attributes class dan id. Dua attributes ini sangat umum digunakan, sehingga jika ada markup html yang hanya menggunakan dua attributes tersebut, kita dapat mengubahnya menjadi lebih pendek. Perhatikan kode berikut

    %div{ class: "large", id: "panel-1" }
        %p{ class: "name" } My Name is Glend
        
dapat disingkat menjadi

    %div.large#panel-1
        %p.name My Name is Glend

atribut class dapat diganti dengan tanda titik ('.') sedangkan id dapat diganti dengan tagar ('#') . Kode diatas akan menjadi sangat readable dimata penggemar CSS dan Javascript :) . Short syntax diatas hanya dapat digunakan ketika suatu markup html hanya menggunakan salah satu atau kedua2nya dari atribut class dan id.

Sangat mudah bukan?

Untuk markup javascript dan css misalnya anda dapat menggunakan :stylesheet dan :javascript seperti pada kode dibawah ini

    <script type="text/javascript">
        !function(d,s,id){var js,fjs=d.getElementsByTagName(s)};
    </script>

dapat diubah menjadi

    :javascript
        !!function(d,s,id){var js,fjs=d.getElementsByTagName(s)};

Jangan lupa identation antara :javascript dan konten dibawahnya

Untuk CSS

    <style>
        .es-carousel ul{
            display:block;
        }
    </style>

dapat diubah menjadi

    :css
        .es-carousel ul{
        display:block;
        }

Lebih simple bukan? Lalu pertanyaannya, bagaimana kalo saya sudah mempunyai ratusan file erb dan saya ingin mengubahnya ke haml? Jika memakai cara manual, yaitu dengan mengubah markup per baris, pasti akan lama sekali baru selesai. Untuk masalah seperti ini, kita dapat memanfaatkan beberapa tools yang dapat mengconvert erb kita secara otomatis ke haml. Kita dapat menggunakan tools bawaan haml yaitu [html2haml](https://github.com/haml/html2haml), atau online tools seperti [htmltohaml](http://htmltohaml.com/).

Nah, sekian dulu pengenalan haml di artikel ini, untuk lebih jelas dan lengkapnya anda dapat melihat reference-nya [HAML Reference](http://haml.info/docs/yardoc/file.REFERENCE.html)

Happy Coding and Enjoy HAML!!