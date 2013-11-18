---
type: page
layout: page
title: Tolkien
---

[Tolkien](http://github.com/glendmaatita/Tolkien) adalah sebuah tools generator untuk membuat file web static. Static yang dimaksud adalah tanpa database, tanpa backend sistem apapun, dan berbentuk file HTML biasa. Hal ini memungkinkan web menjadi lebih mudah untuk di-deploy dan menjadi lebih cepat untuk diakses, secepat server anda merender file HTML biasa. Lebih tepatnya lagi, Tolkien khusus digunakan untuk membuat web blog. Blog yang sedang anda baca ini dibangun dengan menggunakan Tolkien.

Tolkien membutuhkan setidaknya PHP versi 5.3 keatas (mendukung Namespace) agar dapat berjalan. Dan lebih baik lagi, jika kita menggunakan PHP versi 5.4 karena pada versi tersebut, PHP sudah mempunyai built-in server yang dapat langsung digunakan oleh Tolkien untuk menjalankan perintah 'serve' sehingga kita bisa langsung melihat tampilan web static kita yang telah digenerate oleh Tolkien.

**Instalasi**

Cara termudah untuk menginstall Tolkien adalah melalui Composer. Jika kamu tidak tahu apa itu Composer, silakan langsung me-refer ke [http://getcomposer.org](http://getcomposer.org) untuk lebih jelasnya.

Untuk menginstall Composer, jalankan perintah dibawah ini 

    curl -sS https://getcomposer.org/installer | php
    
Perintah diatas akan mendownload file composer.phar. Selanjutnya, buat sebuah folder dan sebuah file didalamnya yang bernama **composer.json** yang berisi
    
    {
        "require": {
            "tolkien/tolkien": "v0.5.0"
        }
    }
    
Lalu jalankan composer melalui command

    php composer.phar install
    
Biarkan composer melakukan tugasnya, yaitu mendownload semua package yang dibutuhkan dan menggenerate autoload file agar kita bisa langsung menggunakan Tolkien.

**Inisiasi**

Untuk membuat blog dengan memanfaatkan Tolkien, terlebih dahulu kita harus menginisiasi blog kita terlebih dahulu. Untuk itu, kita gunakan perintah *init* seperti dibawah ini

    vendor\bin\tolkien init myblog
    
Anggaplah kita ingin membuat blog dengan nama **myblog**, maka perintah diatas akan menghasilkan sebuah folder bernama **myblog** yaang berisi beberapa directory penting dan sebuah file konfigurasi seperti yang terlihat dibawah ini

    _assets    // tempat image, css, js file untuk blog kita
    _layouts   // berisi layout untuk post atau page pada blog kita
    _drafts    // berisi post atau page yang masih berupa draft
    _posts     // berisi file-file post 
    _pages     // berisi file-file post 
    _sites     // berisi file HTML static hasil generate dari Tolkien
    config.yml // file konfigurasi
    
File konfigurasi **config.yml** berisi beberapa variable global seperti nama blog, tagline, dsb seperti yagn terlihat dibawah ini

    config:
        name: myblog
        url: /
        title: Your Blog Title
        tagline: Your Blog Tagline
        pagination: 10
    dir:
        post: myblog/_posts
        page: myblog/_pages
        draft: myblog/_drafts
        site: myblog/_sites
        asset: myblog/_assets
        layout: myblog/_layouts
        
Isi dari file **config.yml** menggunakan format configurasi YAML. Kita dapat mengganti beberapa value dari variable seperti name, title, atau tagline. Untuk sementara, jangan mengubah value dari variable di dalam section **dir** karena akan mempengaruhi output dari setiap command dari Tolkien

**Penggunaan**

Untuk membuat post, page atau menggenerate file static, kita dapat menggunakan perintah-perintah yang sudah tersedia pada Tolkien. Untuk membuat sebuah post, kita gunakan perintah dibawah ini, anggap kita ingin membuat sebuah post berjudul *Introduction to Rails*

    vendor\bin\tolkien generate myblog post "Introduction to Rails"
    
**myblog** adalah nama blog yang kita tentukan saat inisiasi sebelumnya. Perintah diatas akan menghasilkan sebuah file di dalamnya folder **_posts** seperti terlihat dibawah ini

    ---
    type: post
    layout: post
    title: Introduction to Rails
    date: 2013-09-20
    author:
      name: Your Name
      email: Your Email
      facebook: Your Facebook
      twitter: Your Twitter
      github: Your Github
      signature: Your Signature
    categories: category1
    ---

*type: post* mengindikasikan bahwa file tersebut adalah file untuk post, *layout: post* mengindikasikan bahwa kita akan menggunakakan layout *post.html.tpl* yang berada di folder **_layouts**. Value dari variable dalam section *author* dapat kita ganti dengan data diri kita atau data diri penulis post. Sedangkan untuk **categories**, kita bisa memberikan lebih dari satu category, dipisah oleh tanda koma (,).

Isi dari file seperti diatas masih berupa *header*, ditandai dengan karakter '---' diatas dan dibawah header sebagai pemisah dari *body*. Untuk Body atau isi dari post, kita dapat menggunakan format Markdown (recommended!) atau HTML. Cukup letakkan isi dari body di bawah header. Untuk *excerpt* gunakan variable *[more]* .

**Membuat Page**

Sedangkan untuk membuat page, pada intinya sama dengan membuat post. Page sendiri sebenernya adalah Post tapi tanpa categories, author, dan excerpt. Untuk membuat file page, jalankan perintah seperti dibawah ini

    vendor\bin\tolkien generate myblog page Contact
    
Perintah diatas akan menghasilkan file page yang berada di dalam folder **_pages**, yang berisi

    ---
    type: page
    layout: page
    title: Contact
    ---

Untuk memberi *body* lakukan hal yang sama seperti saat membuat post. Bedanya pada page tidak mengenal variable *[more]* untuk excerpt

**Compile**
Agar file-file post dan page kita dapat menjadi file HTML static, kita perlu meng-compile-nya terlebih dahulu melalui perintah *compile* pada Tolkien, lihat perintah dibawah ini

    vendor\bin\tolkien compile myblog
    
Perintah diatas otomatis akan menghasilkan file-file HTML beserta asset-asset (yang sebelumnya berada di folder **_assets/**) ke dalam folder **_sites** 

Untuk melihat hasilnya, kita dapat menggunakan perintah *serve* yang terdapat pada Tolkien. Perintah *serve* ini memanfaatkan PHP built-in webserver yang tersedia pada PHP versi 5.4 keatas. Jalankan perintah *serve* seperti dibawah ini dan kita dapat langsung melihat web static kita dengan mengarahkan browser ke url **http://localhost:3000**

    vendor\bin\tolkien serve myblog
    
**Layouts**

Seluruh layout pada Tolkien berada didalam folder **_layouts** . Sudah terdapat beberapa layout untuk post, index, page, sidebar, dll. Kita dapat memodifikasi layout yang sudah ada atau membuat sendiri file layout sesuai keinginan kita. Layout dibuat dengan menggunakan [Twig](http://twig.sensiolabs.com) template engine, sehingga kita dapat memanfaatkan seluruh fitur pada Twig seperti Filters, Functions, Control Structure, Expression, dll untuk membuat layout kita sendiri.

**Variable**

Tolkien menyediakan beberapa variable global yang dapat kita *pass* ke dalam layout buatan kita. Variable-variable tersebut diantaranya adalah

**Site Variables**

    site.url        // URL web kita
    site.title      // Judul dari web kita. untuk mengubahnya, lihat file config.yml
    site.tagline    // Tagline dari web kita
    site.posts      // Get all posts
    site.pages      // Get all pages
    site.siteCategories // Get all posts's categories

**Post Variables**

    post.title      // Get Post's title
    post.body       // Body
    post.url        // Post's URL
    post.layout     // Layout
    post.excerpt    // Get post's excerpt
    post.categories // Get post's categories
    post.publishDate    // Publish date
    
**Post's Author**   

    post.author.name    // Name of Post's Author
    post.author.email   // Author's email
    post.author.signature   // Signature
    post.author.facebook
    post.author.twitter
    post.author.github

**Page Variables**

    page.title      // Page's Title
    page.body       // Body
    page.url        // Page's URL

**Pagination Variables**

Pagination sudah tersedia secara built-in di dalam Tolkien (lihat file **config.yml**). Anda dapat menggunakan fitur ini jika anda mau. Jika anda ingin menggunakan fitur pagination, gunakan variabel-variabel sebagai berikut

    pagination.posts    // Get semua posts yang ada di suatu page pagination
    pagination.previousPage // Page sebelumnya pada pagination
    pagination.nextPage // Page berikutnya
    pagination.url      // URL suatu page pada pagination
    pagination.numberPage // Nomor page

Untuk mengatur jumlah post pada setiap page pada pagination, ubah variabel **pagination** di file **config.yml**.

Gunakan variable diatas agar layout kita menjadi lebih dinamis.

**Index HTML**

Index atau halaman depan adalah halaman utama dari web anda. Index sebenarnya adalah sebuah page biasa dengan layout khusus yang berbeda dari page lainnya. Untuk membuat Index page, lakukan cara yang sama ketika kita membuat file page

    vendor\bin\tolkien generate myblog page index

Lalu ubah value dari variable *layout* dengan index (atau layout buatan anda sendiri) seperti yang terlihat dibawah ini
    
    ---
    type: page
    layout: index
    title: Home
    ---
    
**Deployment**

Anda dapat memindahkan file web anda dari komputer lokal ke komputer server dengan berbagai cara yang anda inginkan. Bisa menggunakan ssh, ftp, atau langsung pake flashdisk. Jika anda menggunakan FTP, silakan cek tools saya yang lain yaitu [Heston](http://github.com/glendmaatita/Heston) . Untuk menggunakan Heston, tinggal ketikkan perintah dibawah ini

    vendor\bin\heston ftp://username:password@ftp.domain.tld:port myblog/_sites/ "_your_comment_"
    
Silakan mencoba tools ini dan buat aktivitas blogging anda menjadi lebih geek dan menyenangkan :) . Untuk kontribusi dan penjelasan lebih lanjut, cek langsung repository disini : [https://github.com/glendmaatita/Tolkien](https://github.com/glendmaatita/Tolkien)