---
type: post
layout: post
title: Membangun Aplikasi Python dengan Menggunakan Flask di OpenShift Part 1: Menyiapkan Environment Lokal
date: 2013-11-01
author:
  name: Eko Wibowo
  email: eko@kodetalk.com
  facebook: Your Facebook
  twitter: Your Twitter
  github: Your Github
  signature: Your Signature
categories: Programming, Cloud, Python
---
![Alt text](/images/connect-openshift.png)

Part ini akan menjelaskan bagaimana men-setup environment lokal di PC kita agar kita bisa langsung memulai mendevelop aplikasi Python dengan menggunakan *Flask* di OpenShift. Sebelumnya pastikan anda telah mendaftar (Free Account) di Openshift melalui [**link ini**](https://openshift.redhat.com/app/account/new)

Setelah register, langkah berikutnya adalah [menginstall **Openshift RHC Client Tools**](https://www.openshift.com/developers/rhc-client-tools-install). RCH Client Tools akan memudahkan kita untuk membuat, mengatur, dan memonitor aplikasi kita di OpenShift dengan hanya menggunakan satu perintah. Selain menggunakan RHC, kita juga bisa menggunakan [OpenShift Web Console](https://openshift.redhat.com/app/console/applications) jika kita prefer menggunakan tools yang mempunyai GUI. Tapi saya pribadi jauh lebih nyaman menggunakan command line karena lebih ringan dan to the point. 

[more]

Saat ini saya bekerja di lingkungan OSX yang menjalankan Virtual Box yang berisi Ubuntu dan Windows 7. Ketiga OS tersebut mempunyai RHC Client masing-masing, dan menurut pendapat saya, bekerja dengan Openshift di Ubuntu (Linux) terasa paling natural dan paling mudah dibanding 2 OS lainnya. Tapi tentu saja, saya tidak akan memaksa anda untuk menggunakan Linux, gunakan saja OS pilihanmu yang menurutmu paling nyaman digunakan. Dibawah ini saya akan menjelaskan bagaimana menyiapkan lingkungan kerja Openshift di Linux (Ubuntu) dan juga di Windows

Untuk memulai bekerja dengan Openshift, paling tidak kita akan membutuhkan 3 tools ini yaitu

+ [Ruby](https://www.ruby-lang.org/en/) & [RubyGems](http://rubygems.org/)
+ [Git](http://git-scm.com/)
+ OpenShift RHC Client Tools

Jika anda menggunakan Ubuntu, untuk menginstall 3 tools diatas hanya membutuhkan perintah
    
    ~$ sudo apt-get install ruby-full rubygems git-core 
    ~$ sudo gem install rhc  
    ~$ rhc setup 
    
Selesai :)

Sedangkan, jika anda menggunakan Windows, langkah-langkahnya adalah

+ Download dan Install [Ruby Installer](http://rubyinstaller.org/). Cara tercepat untuk menginstall Ruby di Windows dan semua dependency-nya adalah dengan Ruby Installer. Saat proses instalasi, pastikan anda memilih option *"Add Ruby executables to your PATH"* sehingga anda dapat menggunakan Ruby Command di directory manapun melalui command prompt

+ Download dan install [Git for Windows](https://code.google.com/p/msysgit/downloads/list?q=full+installer+official+git). Git adalah salah elemen dasar jika anda bekerja dengan Openshift. Selain sebagai *version control*, Git juga digunakan untuk mendeploy aplikasimu ke Openshift. Sekali anda melakukan Git Push ke server Openshift, secara otomatis Openshift akan otomatis me-restart servermu dan menjalankan kode aplikasimu yang terbaru
 
+ Buka command prompt, saya sangat merekomendasikan anda menggunakan **Git Bash**, yang sudah disertakan ketika kita menginstall *Git for Windows*. Git bash adalah *bash shell*, jadi anda akan punya tools command line yang hampir menyerupai command line di OS *Nix-based. Ketik perintah berikut untuk menginstall RHC Client tools untuk Windows

    
    ***gem install***
    
+ Terakhir, jalankan perintah dibawah ini, dan ikuti intruksi instlaasinya


    ***rhc setup***
    
Jika ini adalah pertama kali anda bekerja dengan menggunakan Git, berarti kemungkinan besar anda belum mempunyai **shh-key**. Untuk membuatnya ketikkan perintah dibawah ini (berlaku untuk Linux ataupun Windows)

    ~$ ssh-keygen

Perintah diatas akan menggenerate file **id_rsa** (private ssh key), **id_rsa.public** (public ssh key) dan **known_hosts** (list semua remote host git)

Untuk mengetes, apakah kita sudah berhasil men-setup environment lokal kita dengan benar dan siap digunakan, coba jalankan perintah untuk membuat aplikasi bernama **bio** dibawah ini

    ~$ mkdir bio && cd bio
    ~$ rhc app-create bio python-2.7 postgresql-9.2
    
Tunggu sebentar sementara Openshift sedang menyiapkan server environment untuk anda. Dan tampilan dibawah ini mengindikasikan jika kita telah mensetup lokal environment kita dengan tepat dan Openshift juga telah berhasil membuatkan server untuk aplikasi kita

![Alt text](/images/setup-server-openshift.png)

Sekarang, silakan akses aplikasi openshift anda di URL ***http://bio-[YOUR DOMAIN NAME].rhcloud.com***. Nantinya kita juga bisa meng-customize URL ini menjadi URL dengan nama domain anda sendiri. Selain men-setup server untuk aplikasi kita, perintah *rhc app-create* diatas juga meng-clone kode repository ke current directory dimana kita menjalankan perintah tersebut, dalam hal ini folder bernama **bio**.

Part berikutnya akan membahas lebih lanjut aplikasi seperti apa yang akan kita buat nanti untuk belajar, serta teknologi apa saja yang akan kita gunakan.

Stay Tuned!

Sumber dan Referensi asli (English Version) : [http://pythonthusiast.pythonblogs.com](http://pythonthusiast.pythonblogs.com/230_pythonthusiast/archive/1306_building_python_flask_application_in_openshiftheroku_replacement_part_i__preparing_your_local_environment.html)