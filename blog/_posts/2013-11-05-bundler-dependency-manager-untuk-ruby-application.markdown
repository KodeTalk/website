---
type: post
layout: post
title: Bundler - Dependency Manager untuk Ruby Application
date: 2013-11-05
author:
  name: Glend Maatita
  email: glend@kodetalk.com
  facebook: Your Facebook
  twitter: Your Twitter
  github: Your Github
  signature: Your Signature
categories: Ruby, Notes
---
Para Rubyst atau Rails developer pasti sudah tidak asing dengan yang namanya [Bundler](http://bundler.io/) ini, karena Bundler secara de-facto telah menjadi dependency manager untuk aplikasi Ruby atau project Rails. Nah, sebenernya apa sih Bundler itu? Setidaknya ada 3 istilah yang berbeda namun saling terkait. 3 term itu adalah **Gem, RubyGems, dan Bundler** itu sendiri. 

![Alt text](/images/gembundler.png)

**Gem**, singkatnya adalah Ruby package, atau package yang berisi code Ruby. Sama seperti *Jar (Java ARchive)*. Jar tak ubahnya file compress-an seperti *.zip* yang jika kita extract, kita akan mendapati file-file berekstensi **.class**, yaitu file-file hasil compile source code Java (.java). Lihat apa isi dari *spring-orm-1.0.2.jar* yang telah diekstrak

[more]

    + spring-orm-1.0.2
        + META-INF
        + org
            + springframework
                + orm
                    + hibernate
                        - HibernateAccessor.class
                          ... file ber-ekstensi .class lainnya
                          
Sekarang bandingkan, dengan isi dari [**grit.gem**](http://rubygems.org/gems/grit)

    + grit-2.5.0.gem_FILES
        + data
            + lib
                - grit.rb
                + grit // berisi file-file kode
                
Tidak jauh beda kan? Jadi dapat kita simpulkan lagi, Gem adalah Ruby package, dapat disamakan dengan file Jar di Java, atau [Phar](http://php.net/manual/en/book.phar.php) di PHP.

Sedangkan RubyGems adalah tools untuk mempermudah kita mendownload sekaligus menginstall Gem di komputer kita. RubyGems ini dapat kita samakan dengan **apt** di Debian atau [Homebrew](http://brew.sh/) di Mac, dimana kita bisa menginstall software dengan satu baris perintah. Perhatikan contoh perintah apt berikut

    ~$ sudo apt-get install git-core
    
*apt* otomatis akan mendownload package git-core beserta seluruh dependency-nya, dilanjutkan dengan menginstall dan men-setting-nya secara otomatis. apt akan mendownload dari repository yang kita tentukan di */etc/apt/source.list* . Berikut sepotong dari list repository untuk apt di source.list komputer saya

    deb http://id.archive.ubuntu.com/ubuntu/ precise main restricted
    deb-src http://id.archive.ubuntu.com/ubuntu/ precise main restricted
    
RubyGems pun sama dengan apt. kita bisa mendownload Gem (Ruby package), menginstall, dan men-setting-nya secara otomatis hanya dengan satu baris perintah. Repostory package dimana RubyGems akan mendownload gem adalah di [**RubyGems.org**](http://rubygems.org/). Perhatikan bagaimana kita menginstall salah satu Gem, yaitu [Jekyll](http://rubygems.org/gems/jekyll) melalui RubyGems

    ~$ gem install jekyll
    
Done!! RubyGems mempunyai perintah **gem** (seperti apt-get) untuk menginstall maupun mengupdate gem yang sudah terinstall. Secara otomatis, RubyGems juga akan men-setting load path **jekyll**, sehingga kita bisa menggunakan Jekyll di directory manapun

    ~$ jekyll install myblog
    
Saat ini, RubyGems adalah bagian integral dari Ruby. jika kita menginstall Ruby, otomatis Rubygems juga akan terinstall.

**Bundler**

Lalu kalau begitu apa yang dimaksud dengan Bundler? Kita quote dulu penjelasan Bundler di [official site-nya](http://bundler.io/)

> Bundler maintains a consistent environment for ruby applications. It tracks an application's code and the rubygems it needs to run, so that an application will always have the exact gems (and versions) that it needs to run.

Bundler merupakan cara cerdas dalam menggunakan RubyGems untuk project kita. Bundler adalah tools untuk memanage dependency Gem (Dependency Manager) dari aplikasi Ruby. Bundler digunakan **spesific** ke suatu project. Padanan Bundler adalah [Composer](http://kodetalk.com/2013/10/10/tentang-composer-dan-pemilihan-framework-php.html) di PHP atau [NPM](https://npmjs.org/) di NodeJS. Bundler sendiri adalah Gem (Ruby package), sama seperti Composer adalah sebuah phar (PHP ARchive). Cara kerja Bundler hampir sama persis dengan Composer dan NPM.

Dengan Bundler, kita bisa menentukan, kita mau pake Gem apa saja untuk project kita, dan Bundler akan mendownload dan menginstall gem yang telah kita tentukan beserta seluruh dependency-nya untuk project kita tersebut. Kunci bagaimana Bundler bisa melakukan itu semua ada di sebuah file penting bernama **Gemfile**

**Gemfile**

Gemfile adalah sebuah file tempat kita menentukan gem apa saja yang akan kita pakai di project kita. Untuk membuatnya, buat saja sebuah file bernama *Gemfile* dan letakkan di root directory dari project anda. Berikut adalah **contoh** bentuk dasar dari isi Gemfile

    source 'https://rubygems.org'
    
    gem 'nokogiri' 
    gem 'rails', '3.0.0.beta3' 
    gem 'rack', '>=1.0' 
    gem 'thin', '~>1.1'

Baris paling atas adalah Gem Repository. Setidaknya, kita perlu menentukan minimal satu Gem repository, dimana Bundler akan mendownload gem-gem yang dibutuhkan. Default dan de-facto dari Gem repository adalah [RubyGems.org](http://rubygems.org/). 

Selanjutnya, kita tulis, gem apa saja yang akan kita gunakan untuk project kita, beserta versinya. Jika kita lihat contoh Gemfile diatas, ada beberapa operator yang digunakan untuk menentukan versi dari Gem.

    gem 'nokogiri' 
    
Contoh diatas adalah saat kita tidak menentukan versi yang spesifik untuk Gem. Oleh karena itu, Bundler akan menginstall latest-version dari gem tersebut

    gem 'rails', '3.0.0.beta3'

Contoh diatas sudah jelas, Bundler akan menginstall rails gem dengan versi yang sudah ditentukan yaitu *3.0.0.beta3*

    gem 'rack', '>=1.0' 

Contoh diatas juga sudah jelas, yaitu Bundler akan menginstall gem *rack* dengan versi terbaru dari versi 1.0 keatas. jadi jika versi 1.5, atau 1.6, atau bahkan versi 2.0 telah rilis, Bundler akan menginstall versi terbaru tersebut

    gem 'thin', '~>1.1'
    
Contoh diatas adalah contoh spesial, yaitu Bundler akan menginstall versi terbaru dari revisi di angka paling akhir. Jadi, jika versi 1.2, 1.3 dst mungkin sampai 1.25 rilis, Bundler akan menginstall versi terbaru tersebut. Tapi jika versi 2.0, 2.5, 3.0 dan seterusnya keluar, Bundler tidak akan menginstall versi tersebut. Jadi bisa diartikan juga dengan *install semua versi terbaru dari 1.x diatas versi 1.1*

    1.1 < install versi < 2.0

Contoh lainnya adalah dari operator spesial (~) ini adalah

    gem 'thin', '~>1.1.5'
    
Bundler akan menginstall versi terbaru diatas 1.1.5 dengan tetap mempertahankan versi 1.1.x. 

Langkah selanjutnya setelah menentukan gem mana saja yang akan kita pakai di project kita, adalah menginstall gem-gem tersebut via bundler command

    ~$ bundle install

**Bundler & Rails**

Rails secara default sudah menggunakan bundler sebagai dependency manager nya. Jika kita membuat project dengan Rails, Rails akan membuat Gemfile, yang sudah berisi dependency minimal agar aplikasi rails kita dapat berjalan, di root directory dari project rails kita, sekaligus mengeksekusi *bundle install* 

    ~$ rails new bloglend
    ...
        create  vendor/assets/stylesheets/.gitkeep
        create  vendor/plugins
        create  vendor/plugins/.gitkeep
        run  bundle install
        
    Fetching gem metadata from https://rubygems.org/...........
    Fetching gem metadata from https://rubygems.org/..
    Resolving dependencies...
    Using rake (10.1.0) 
    Using i18n (0.6.1) 
    Installing multi_json (1.8.2) 
    Using activesupport (3.2.13) 
    ...
    Your bundle is complete!
    Use `bundle show [gemname]` to see where a bundled gem is installed.

Potongan isi dari Gemfile hasi create project dengan Rails adalah sebagai berikut

    source 'https://rubygems.org'
    
    gem 'rails', '3.2.13'
    gem 'sqlite3'
    
    group :assets do
      gem 'sass-rails',   '~> 3.2.3'
      gem 'coffee-rails', '~> 3.2.1'
      gem 'uglifier', '>= 1.0.3'
    end
    
    gem 'jquery-rails'
    
Kita juga dapat mengelompokkan gem di Gemfile kita berdasarkan environtment. Misal, kita hanya ingin menginstall beberapa gem khusus untuk development, beberapa untuk test, dan beberapa hanya untuk production. Kita dapat dengan mudah melakukakannya dengan **grouping**

    source 'https://rubygems.org'

    gem 'rails', '3.2.1'
    gem 'bootstrap-sass', '2.0.0'
    gem 'bcrypt-ruby', '3.0.1'
    
    # gemfile for development 
    group :development do
      gem 'therubyracer', :require => "v8"
    end
    
    # khusus tests
    group :test do
      gem 'capybara', '1.1.2'
      gem 'capybara-webkit'
    end  
    
    # khusus production
    group :production do
      gem "recaptcha", :require => "recaptcha/rails"
    end
    
    # untuk development sekaligus production
    group :development, :production do
      gem 'devise'
    end

List gem yang tidak berada di dalam grouping seperti **rails, bootstrap-sass** akan tersedia di semua environment. Sementara yang berada di dalam grouping, misalnya group **:development**, gem tersebut hanya dapat digunakan di environment development.

Kita juga bisa share environment untuk suatu gem, misalnya pada contoh diatas kita ingin gem **devise** tersedia untuk environment development dan production. Sangat fleksibel.

Selain itu, kita juga bisa *hanya* menginstall gem untuk suatu environment tertentu. Semisal, saat kita masih dalam tahap coding (development) kita tidak ingin menginstall gem untuk production, maka kita bisa jalankan perintah sebagai berikut

    ~$ bundle install --without production
    
Perintah diatas tidak akan menginstall gem yang berada di grouping production (dalam hal ini gem **recaptcha**). 

Atau misal ketika telah mendeploy aplikasi kita ke server production, kita hanya ingin menginstall gem untuk production, yaitu gem yang berada di grouping production, maka kita jalankan perintah berikut

    ~$ bundle install --without test development

**Gemfile.lock**

Ketika kita mengeksekusi **bundle install** dan **sukses**, bundler akan membuat file bernama Gemfile.lock. File ini berisi snapshot dari gem dan semua dependencynya (beserta versi masing-masing gem) yang terinstall. Berikut adalah contoh ketika kita mengeksekusi perintah bundle install dari Gemfile diatas (hasil create project dari Rails)

    GEM
      remote: https://rubygems.org/
      specs:
        actionmailer (3.2.13)
          actionpack (= 3.2.13)
          mail (~> 2.5.3)
        actionpack (3.2.13)
          activemodel (= 3.2.13)
          activesupport (= 3.2.13)
          builder (~> 3.0.0)
        ....

Gemfile.lock ini memberi kepastian aplikasi kita akan berjalan dengan baik jika gem-gem yang di-list di Gemfile.lock berhasil diinstall. Jadi, dipastikan tidak akan terjadi masalah meskipun tiap anggota team developer mempunyai environtment kerja yang berbeda. 

Kita dapat memasukkan Gemfile.lock ini ke version control semisal Git, sehingga file ini bisa dishare ke semua developer. Dan jika developer lain mengeksekusi perintah *bundle install*, Bundler akan melihat ke Gemfile, jika tidak ada perubahan misal penambahan gem atau perubahan versi, maka Bundler akan langsung menginstall gem yang di-list di Gemfile.lock. 

**Mengupdate Gem**

Kita bisa dengan mudah mengupdate gem tertentu dengan perintah *bundler update [nama gem]*. Misal kita ingin mengupdate gem **recaptcha**, maka kita megeksekusi perintah seperti dibawah ini

    ~$ bundle update recaptcha
    
Jika kita ingin mengupdate semua gem di ada di Gemfile, cukup eksekusi *bundle update* tanpa disertai nama gem

    ~$ bundle update
    
Kita juga dapat mengupdate gem dengan cara mengganti versi di Gemfile, misal sebelumnya kita punya Gemfile seperti berikut
    
    #Gemfile
    ...
    gem 'rails', '3.2.1'
    ...
    
Misal kita ingin mengupdate rails ke versi 4, maka kita bisa mengedit Gemfile kita dan menjalankan bundle install lagi

    #Gemfile
    ...
    gem 'rails', ''4.0.0.rc1'
    ...
    
Kemudian jalankan bundle install

    ~$ bundle install
    
Bundler akan mengecek, semua dependency dari gem yang kita upgrade. Yang perlu diingat adalah, Bundler tidak akan mengupdate dependency dari gem yang kita upgrade, dimana ada gem lain yang dependent terhadap gem tersebut. Sebagai contoh misal 

+ gem **rails r.0.0.rc** mempunyai dependency **actionpack 4.0.0.rc**
+ **actionpack 4.0.0.rc** mempunyai dependency ke **rack ~> 1.3.0** . jadi dapat dikatakan bahwa **rails r.0.0.rc** secara tidak langsung mempunyai dependency ke **rack ~> 1.3.0**
+ Sedangkan ada satu gem yaitu **rack-cache** yang mempunyai dependency ke **rack ~> 1.1.0** misalnya

Maka, jika kita mengupdate rails ke versi 4.0.0 dan kita tidak mengupdgrade rack-cache, maka Bundler akan mengeluarkan notfikasi jika terjadi konflik versi. 

Sekian pengenalan Bundler, sebuah tools yang sudah menjadi standar de-facto untuk mengembangkan aplikasi Ruby. Untuk dokumentasi lebih lengkap silakan langsung menuju [official website nya](http://bundler.io/).