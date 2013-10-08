---
type: post
layout: post
title: Memanfaatkan Vbox Secara Out of the Box dengan Vagrant
date: 2013-10-08
author:
  name: Glend Maatita
  email: glend@kodetalk.com
  facebook: Your Facebook
  twitter: Your Twitter
  github: Your Github
  signature: Your Signature
categories: Notes, Ruby 
---

![Alt text](/images/vagrant.png)

[Vagrant](http://www.vagrantup.com/) adalah sebuah tools yang dapat digunakan untuk membuat environment kerja yang portable dan distributable. Environment kerja yang dimaksud adalah OS beserta seluruh library dan software yang diperlukan agar seorang programmer dapat langsung melakukan tugasnya (baca: coding) tanpa harus repot men-setting environment kerja. Intinya, dengan Vagrantm anda akan dapat melakukan skenario seperti ini

*Anda punya project yang akan dideploy ke server milik client anda yang sudah terinstall CentOS didalamnya. Anda ingin agar saat aplikasi telah di-deploy, tidak ada masalah yang berarti karena perbedaan environment. Server pakai CentOS dengan berbagai library yang spesifik, sedangkan tim developer anda memakai OS yang berbeda2. ada yang pake Windows, Mac, atau Ubuntu.*

*Hal ini akan mengakibatkan beberapa macam permasalahan. Misal, programmer A, si maniak Linux Slackware, telah menyelesaikan suatu **fitur X**, mengetest nya dan ternyata running well, kemudian me-push kode nya ke Git Repo. Kemudian programmer B, pengguna Windows, dengan polosnya melakukan pull ke Git Repo untuk mendapatkan update kode fitur terbaru dan ternyata fitur baru tersebut tidak berjalan. Setelah diselidiki, ternyata si programmer A telah menginstall beberapa library spesifik Slackware agar **fitur X** dapat berjalan*. 

[more]

Skenario diatas memang menjengkelkan, dan itu masih terjadi diantara para developer. Bagaimana ketika aplikasi sudah berjalan di server dengan OS yang berbeda lagi? Cara terbaik adalah menyamakan OS untuk development dengan server production

    Operating System untuk Development = Operating System Server Production
    
Tapi cara diatas tidak efektif. Pertama, masing-masing developer harus mensetting environment kerjanya terlebih dahulu. Ini buang-buang waktu, belum lagi jika ada developer yang baru masuk di tengah jalan. Kedua adalah, bagaimana jika developer tidak nyaman jika lingkungan kerjanya harus sesuai dengan server production. 

Vagrant akan mengatasi permasalahan-permasalahan diatas. Dengan memanfaatkan vagrant, environment kerja dapat dibuat dan didistribusikan ke seluruh anggota tim project sehingga tim project tersebut akan mendapat banyak keuntungan, semisal :

* Programmer dapat langsung bekerja, tanpa perlu membuang waktu untuk men-setup komputernya agar siap digunakan. Jangan sepelekan masalah ini, walaupun kecil, waktu yang terbuang akan lumayan besar

* Memastikan seluruh anggota tim project, terutama developer, mempunyai environment kerja yang sama persis. Pernah dengar celetukan seperti ini, *"Woy, di komputerku jalan kok, gak tau juga kalo di tempatmu gak jalan?"* . Tenang, Vagrant akan mengatasi masalah klasik ini. *Jadi,  semua programmer harus menggunakan OS yang sama dunk?* . Tidak. Vagrant menyediakan cara yang unik untuk ini dan akan kita bahas lebih lanjut. Intinya, kita tetap dapat bekerja dengan OS sehari-hari kita dan me-running aplikasi kita di virtual machine milik Vagrant secara *on the fly*.

* Dapat digunakan sebagai staging server yang praktis

**Instalasi**

Vagrant adalah sebuah rubygems. Untuk menginstallnya, pastikan anda telah mempunyai Ruby di komputer anda. Untuk menginstall Ruby, [simak artikel ini](http://kodetalk.com/2013/10/05/setting-environment-untuk-ruby-development-part-1.html). Selain itu, karena Vagrant menggunakan VBox sebagai virtual machine-nya, maka pastikan juga VBox telah terinstall di komputer anda. Anda dapat mendownload VBox secara free di [website resmi Oracle Virtual Box](https://www.virtualbox.org/wiki/Downloads)

Menginstall Vagrant

    ~$ gem install vagrant

**Menambah vagrant box**

Step berikutnya adalah menginstall OS di VBox. Anda dapat memanfaatkan Vagrant Boxes untuk ini. Vagrant Boxes adalah **template virtual machine** yang dapat langsung digunakan oleh Vagrant. Anda dapat melihat list boxes yang tersedia dan mendownload boxes yang sekiranya cocok sebagai environment kerja anda [disini](http://www.vagrantbox.es/). Saya sendiri secara pribadi menggunakan [Ubuntu Precise 32 Bit](http://files.vagrantup.com/precise32.box). Silakan download dan letakkan boxes yang telah terdownload ke suatu directory, misal di **/home/glend/precise32.box**.

Selanjutnya tinggal menambahkan box tadi ke Vagrant dengan perintah **vagrant add [nama box - sembarang nama] [lokasi box]**

    ~$ vagrant box add precise32 /home/glend/precise32
    [vagrant] Downloading with Vagrant::Downloaders::File...
    [vagrant] Copying box to temporary location...
    [vagrant] Extracting box...
    [vagrant] Verifying box...
    [vagrant] Cleaning up downloaded box...
    
Anda dapat menambah sebanyak mungkin box yang anda inginkan. Misal kita mempunyai beberapa project, Project A harus jalan di Debian, Project B harus bisa jalan di BSD, dsb, Vagrant akan membantu kita untuk memanage masing-masing environment kerja setiap project kita. Untuk melihat box apa saja yang telah kita tambahkan ke vagrant, simply run command below

    ~$ vagrant box list
    precise32


**Inisiasi Vagrant**
    
Oke, selanjutnya, saatnya kita gunakan vagrant. Buat suatu directory misal *vagrant-test*, atau kalau anda sudah mempunyai project yang akan memanfaatkan Vagrant ini, silakan menuju ke directory project anda. Saya sendiri sudah mempunyai directory yang berisi suatu project Rails yang terletak di **/opt/sites/myrails**

    ~$ cd /opt/sites/myrails
    
Initialize Vagrant di directory yang telah kita pilih tadi. **Ingat**, directory yang kita pilih tadi sekarang adalah directory tempat Vagrant berjalan. Directory tersebut akan dapat kita akses di dalam virtual machine (VM) milik Vagrant. **Ya !!**, itu adalah directory *sharing* antara komputer anda dengan VM milik vagrant, sehingga kita dapat menambah, mengubah, atau menghapus file melalui komputer kita atau melalui VM Vagrant :) . 

Directory sharing inilah yang memungkinkan kita tetap mengerjakan aplikasi di OS sehari-hari kita (menambah file, mengubah kode, dll) dan me-running nya di virtual machine milik vagrant.

Untuk menginisiasi Vagrant, gunakan perintah

    ~$ vagrant init precise32
    create Vagrantfile
    
*precise32* adalah nama box yang kita tambahkan sebelumnya. Saatnya untuk menjalanakn vagrant, jalan perintah dibawah ini untuk menjalankan vagrant

    ~$ vagrant up
    
Perintah diatas akan menyalakan VM dan menjalankan vagrant. Jika vagrant sudah berjalan anda dapat langsung login ke dalam vagrant virtual machine dengan perintah

    ~$ vagrant ssh
    
Sampai disini, anda telah masuk ke dalam VM dan mendapatkan akses yang sama seperti root. Selanjutnya anda dapat menginstall aplikasi dan seluruh library yang anda butuhkan untuk environment kerja anda seperti menginstall MySQL, apache, PHP, dsb. Setelah jadi, anda dapat mendistribusikan virtual machine ini dengan segala aplikasi yang sudah anda install tadi ke seluruh anggota tim project anda dengan melakukan perintah

    ~$ vagrant package
    
Perintah diatas akan menghasilkan vagrant box dengan nama yang sama saat anda menambah box ke vagrant, dalam kasus diatas, perintah diatas akan membuat file bernama **precise32.box**. 

**Port Forwarding**

Perintah init **(vagrant init)** diatas akan membuat sebuah file konfigurasi yang bernama **Vagrantfile**. Terdapat banyak konfigurasi yang dapat kita atur melalui file ini. Yang terpenting adalah **port forwarding**. Perhatikan konfigurasi port forwading yang terdapat di Vagrant file berikut ini

    # Forward a port from the guest to the host, which allows for outside
    # computers to access the VM, whereas host only networking does not.
    config.vm.forward_port 80, 8080
    
Konfigurasi diatas akan memerintahkan Vagrant untuk memforward setiap request di port 80 pada komputer guest (komputer anda) ke virtual machine milik vagrant di port 8080. 

Lalu, Apa fungsi port forwarding ini? Fungsi port forwarding ini melengkapi fungsi **directory sharing** diatas, yaitu agar kita dapat menjalankan aplikasi yang berjalan di VM Vagrant dan menampilkannya browser komputer anda. *Jadi browser kita hanya akan menampilkan output dari proses di aplikasi kita yang berjalan di VM vagrant!!*

Jadi misalkan saya tadi sudah mempunyai project Rails, saya akan menjalankan webrick **di dalam vagrant**. Webrick berjalan di port 3000, sehingga saya akan mengubah konfigurasi port forwarding seperti ini

    # Forward a port from the guest to the host, which allows for outside
    # computers to access the VM, whereas host only networking does not.
    config.vm.forward_port 3000, 3000

Konfigurasi diatas akan membuat vagrant meneruskan request aplikasi di port 3000 di komputer host ke port 3000 di VM vagrant. Selanjutnya, saya harus mereload vagrant setiap kali kita mengubah Vagrantfile

    ~$ vagrant reload
    
Kemudian saya login ke vagrant dan menjalankan webrick

    ~$ vagrant ssh
    [vagrant]~$ rails s
    
Nah, dengan begitu, ketika kita mengarahkan browser ke *http://localhost:3000*, secara kasat mata, vagrant akan meneruskan request tadi untuk dijalankan di VM dan menampilkan outputnya ke browser kita.

**Memanfaatkan Vagrant sebagai server staging yang praktis**

Kita juga dapat memanfaatkan vagrant sebagai server staging. Kita dapat menyiapkan sebuah OS yang sama dengan production. Lalu dengan tools otomasi seperti [Capistrano](http://www.capistranorb.com/), kita jalankan otomasi mulai dari menginstall library yang diperlukan samapai menjalankan unit test. Jika semua berjalan, kita dapat mengembalikan server VM kita ke kondisi awal dengan perintah

    ~$ vagrant destroy
    
Simple bukan? 

Gunakan vagrant agar masalah klasik seperti "Di tempatku, aplikasi jalan baik, di tempatmu ya masalahmu" tidak terjadi di tim project kita.

Happy Coding :)