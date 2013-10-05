---
type: post
layout: post
title: Setting Environment untuk Ruby Development Part 1
date: 2013-10-05
author:
  name: Glend Maatita
  email: glend@kodetalk.com
  facebook: Your Facebook
  twitter: Your Twitter
  github: glendmaatita
  signature: Your Signature
categories: Programming, Ruby
---

Setting environment untuk memulai development di Ruby memang susah-susah gampang. Tidak seperti di PHP, kita tinggal install XAMPP dan langsung siap untuk coding. Setting Ruby enviroment agak sedikit tricky dan memerlukan beberapa step yang kadang membingungkan. Untuk itu, kita akan bahas tuntas bagaimana cara settting environment yang komplit sehingga kita bisa memulai coding dengan nyaman. Yuk, langsung saja..

Sebelumnya, **FYI**, Windows bukanlah OS yang ideal untuk development Ruby. Ruby tidak jalan secara native di Windows, dan akan membutuhkan semacam virtual runtime agar bisa jalan di Windows sehingga akan membuatnya lemot parah. OS yang cocok adalah yang **Unix-based** semisal Linux atau Mac OS. Dan tulisan ini hanya akan membahas bagaimana setup environment Ruby di Linux. Jika kamu masih tidak bisa lepas dari Windows, kamu bisa coba [Ruby Installer](http://rubyinstaller.org/]), semacam XAMPP untuk Ruby :) . Oke, langsung saja..

[more]

Disini, saya menggunakan Linux Ubuntu 12.04 LTS Desktop version. Rasanya, tidak akan jauh berbeda jika kamu melakukan step-step dibawah ini dengan menggunakan versi Ubuntu yang berbeda. 

Ada beberapa cara untuk me-setup environment Ruby. Bisa dengan cara manual atau menggunakan version manager seperti RVM atau Rbenv.

**Manual**

Cara manual adalah dengan cara koboi, dimana kita langsung mendownload source code dari Ruby, meng-compilenya, dan menginstallnya secara step by step dengan menggunakan GCC. 

Sebelumnya, pastikan GCC sudah terinstall di komputer kita

    ~$ sudo apt-get update
    ~$ sudo apt-get install build-essential


Lalu download Ruby source, jalankan perintah berikut

    ~$ wget http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz

Lalu ekstrak kita ekstrak terlebih dahulu

    ~$ tar xvzf ruby-2.0.0-p247.tar.gz

Masuk ke directory hasil ekstrak, dan jalankan perintah configure, compile (**make**) dan install (**make install**)

    ~$ cd ruby-2.0.0-p247.tar.gz
    ~$ ./configure
    ~$ make
    ~$ sudo make install
    
Done! Cara ini berlaku untuk semua distro Linux, tidak hanya Ubuntu :) . Jika instalasi berjalan sukses, kita akan bisa melihat version dari Ruby yang kita install

    ~$ ruby -v
    ruby 2.0.0p247 (2013-06-27 revision 41674) [i686-linux]
    
**Dengan Menggunakan RVM**

Menggunakan [RVM](https://rvm.io/) atau **Ruby Version Manager** adalah cara yang elegan untuk menginstall Ruby. Tidak hanya menginstall, dengan RVM, kita bisa dengan memudah me-setting versi Ruby yang akan kita gunakan. Akan sangat memudahkan jika kita sedang bekerja di beberapa project yang menggunakan versi Ruby yang berbeda-beda.

Untuk menginstall RVM, kita membutuhkan curl lib

    ~$ sudo apt-get install curl

Jalankan perintah dibawah ini untuk mendownload dan menginstall RVM

    ~$ curl -L https://get.rvm.io | bash -s stable
    
Load RVM ke environment OS kita agar kita dapat menggunakan perintah RVM

    ~$ source ~/.rvm/scripts/rvm

Sampai disini kita hanya telah menginstall RVM, belum menginstall Ruby. Untuk menginstall Ruby dengan menggunakan RVM, jalankan perintah **rvm install [ruby version]**. Jika kita ingin menginstall Ruby versi 2.0.0 maka

    ~$ rvm install 2.0.0

Biarkan RVM menjalankan tugasnya untuk menginstall Ruby. RVM akan menginstall serta menyiapkan semua dependencies dan requirement yang dibutuhkan agar Ruby dengan versi yang kita tentukan tadi dapat berjalan mulus tanpa masalah. Setelah RVM berhasil menginstall Ruby dengan versi tertentu, kita men-set version tersebut untuk kita gunakan

    ~$ rvm use 2.0.0
    ~$ ruby -v
    ruby 2.0.0p247 (2013-06-27 revision 41674) [i686-linux]
    
Kita bisa menginstall beberapa versi dari Ruby yang berbeda-beda dan tinggal menentukan version mana yang akan kita gunakan. Simple. Untuk menjadikan versi ini menjadi default digunakan di sistem kita, kita tinggal menjalankan perintah

    ~$ rvm use 2.0.0 --default

**Dengan menggunakan Rbenv**

[Rbenv](http://rbenv.org/) adalah padanan dari RVM, lebih ringan dan simple (karena selain mengatur versi dari Ruby, RVM juga mengatur Rubygems). Sebelum menginstall Rbenv kita install Git dan GCC terlebih dahulu. Git diperlukan untuk mengclone Rbenv langsung dari Github, sedangkan GCC dibutuhkan untuk mengcompile Ruby Source. Compile ? Tenang, kita akan gunakan plugin dari rbenv untuk otomasi proses compile ini. Kita tidak akan melakukan cara manual seperti diatas :)

    ~$ sudo apt-get install git-core
    ~$ sudo apt-get install build-essential
    
Clone Rbenv di directory .rbenv di home directory dari user kita

    ~$ git clone https://github.com/sstephenson/rbenv.git .rbenv

Masukkan path tempat clone tadi ke bash profile

    ~$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    ~$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    ~$ source .bash_profile

sampai disini, kita telah berhasil menginstall rbenv. Untuk mengetestnya, jalankan

    ~$ rbenv
    rbenv 0.4.0-65-gff23666
    Usage: rbenv <command> [<args>]
    
Saatnya menginstall Ruby. Kita gunakan plugin dari rbenv yaitu [Ruby Build](https://github.com/sstephenson/ruby-build#readme) untuk meng-otomasi proses instalasi Ruby ini.

Clone terlebih dahulu ruby build

    ~$ git clone https://github.com/sstephenson/ruby-build.git

dan install

    ~$ cd ruby-build/
    ~$ sudo ./install.sh
    
Selanjutnya install Ruby dengan menggunakan perintah **rbenv install [version]**. Disini kita akan install Ruby dengan versi 2.0.0 patch 247

    ~$ rbenv install 2.0.0-p247
    ~$ rbenv rehash
    
Done!! Kita telah berhasil menginstall Ruby dengan versi 2.0.0-p247. Untuk membuat versi ini dipakai secara default di sistem kita, tinggal jalankan

    ~$ rbenv global 2.0.0-p247
    
Mudah bukan? Kita tinggal pilih cara yang menurut kita paling nyaman dan fleksibel. Saya sendiri menyarankan agar anda menggunakan RVM atau rbenv untuk men-setup Ruby environment, agar kita dapat memanage berbagai macam versi Ruby di sistem kita. Part selanjutnya akan membahas bagaimana men-setup berbagai tools yang diperlukan untuk segera mulai coding dengan menggunakan Ruby, seperti menyiapkan MySQL, menginstall Rails, dsb.