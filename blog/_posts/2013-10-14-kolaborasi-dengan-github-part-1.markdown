---
type: post
layout: post
title: Kolaborasi dengan Github Part 1
date: 2013-10-14
author:
  name: Glend Maatita
  email: glend@kodetalk.com
  facebook: Your Facebook
  twitter: Your Twitter
  github: Your Github
  signature: Your Signature
categories: Git
---
[Github](http://github.com) cukup fenomenal belakangan ini, terutama di kalangan para programmer dan open source entushiast. Github adalah sebuah website yang memberikan layanan Git Hosting. Mirip seperti Google Code namun dengan fungsionalitas dan fitur yang lebih mumpuni.

Github didirikan oleh trio Chris Wanstrath ([@defunkt](http:/twitter.com/defunkt)), Tom Preston-Werner ([@mojombo](http:/twitter.com/mojombo)), dan PJ Hyett di tahun 2008. Bermula dari acara lokal meetup programmer, Tom Preston-Werner dan Chris Wanstrath bertemu dan kemudian membicarakan ide Tom tentang sebuah git hosting. Ide ini kemudian bergulir dan semakin matang setelah mereka bertemu PJ Hyett dan mempresentasikan ide mereka ini. Di tahun 2008, mereka merilis versi pertama dari Github.

![Alt text](/images/github.png)

Seperti apa Github itu? berikut penuturan Wanstrath mengenai Github

[more]

> *"GitHub is like Wikipedia for programmers. You can edit files, see who changed what, view old versions of files, and access it from anywhere in the world – except you’re working with source code instead of encyclopedia data. Companies use it to build software and websites, while hobbyist programmers use it to find and share projects."*

Gampangnya, kita dapat membuat Git repo di Github, kita dapat mengakses repo tersebut kapan dan dimana saja asal terkoneksi internet, melihat history file kita, dan lain sebagainya.

Di jantung Github ada Git, sebuah *version control system* kelas wahid buatan Linus Torvalds. Jika penggunaan Git seperti melihat history file, melihat log, dsb kebanyakan dilakukan di terminal *nix, Github menyediakan visualisasi berbasis web yang menarik dari hanya sekedar penampakan di terminal.

Github mempunyai misi untuk menghilangkan *barrier* kontribusi ke sebuah open source project. Sebelum ada Github, untuk berkontribusi ke suatu project open source adalah gampang-gampang susah. Minimal kita harus aktif di forum, IRC, atau di milis project bersangkutan agar dapat bekontribusi maksimal. Github berusaha untuk menghilangkan kesulitan untuk berkontribusi di open source project seperti ini. Dengan fitur *Fork* dan *Pull Request*, konstribusi ke suatu project open source menjadi sangat mudah dan menyenangkan melalui website berlambang Octocat ini.

Berikut ini akan saya jabarkan beberapa step by step agar kita dapat segera akrab dengan Github.

**1. Membuat Account baru di Github**

Untuk memulai menggunakan Github, terlebih dahulu kita harus membuat account. Arahkan browser ke [http://github.com](http://github.com) dan di halaman depan sudah tersedia form yang mengajak kita untuk *Sign Up* ke Github

![Alt text](/images/signup.png)

Isikan username, email anda, dan password, lalu klik tombol<strong> Sign Up to Github</strong> untuk membuat account Github baru

**2. Verifikasi Email**

Verifikasi email dibutuhkan terutama untuk mengaktifkan protocol SSH yang akan kita gunakan nantinya untuk melakukan push ke Github. Masuk ke menu *Setting*, dan pilih options *Emails*. Kemudian klik tombol **Verify**. Github akan mengirim anda email verifikasi. Silakan buka inbox email anda kemudian klik link yang disertakan di email tersebut

![Alt text](/images/email-verifikasi.png)

**3. Pengaturan SSH**

Github menyediakan 2 cara umum untuk melakukan koneksi ke repository kita. Yaitu dengan protocol *https* dan *SSH*. Memakai protocol SSH lebih aman dan nyaman karena kita tidak perlu memasukkan username dan password Github kita tiap kali kita melakukan Push. Untuk mengaktifkan protocol SSH di Github kita, terlebih dahulu kita harus men-setting SSH di komputer lokal kita. Kita generate dulu public key untuk SSH kita

    ~$ ssh-keygen -t rsa -C [email_anda]

Secara default, key SSH akan digenerate di directory **/home/user_anda/.ssh**. Email anda adalah email yang anda verifikasi di github tadi.

Lakukan juga step berikut ini untuk menghindari *error permission denied*. Biasanya terjadi pada Linux. Lihat [halaman ini](https://help.github.com/articles/error-agent-admitted-failure-to-sign") untuk lebih jelasnya
    
    ~$ ssh-add

Selanjutnya adalah men-setting Git kita. Kita setting nama dan email pada global config Github

    ~$ git config --global user.name [nama_anda]
    ~$ git config --global user.email [eemail_anda]

Langkah terakhir adalah mendaftarkan public key ssh kita ke Github. Caranya adalah masuk ke *Setting*, pilih *SSH Keys* dan masukkan title beserta isi dari public key SSH kita yaitu isi dari file /home/user/.ssh/id_rsa.pub

![Alt text](/images/ssh-register.png)

Klik tombol **Add Key** dan masukkan konfirmasi password. Masukkan password Github anda dan tekan enter. Jika semuanya berjalan lancar, maka kita akan punya akses SSH ke Github, seperti gambar dibawah ini.

![Alt text](/images/ssh-register-success.png)

Untuk memastikan apakah kita sudah punya akses SSH ke Github, kita akan coba melakukan koneksi ke Github via SSH

    ~$ ssh -vT git@github.com
    Hi entung! You've successfully authenticated, but GitHub does not provide shell access.
    debug1: channel 0: free: client-session, nchannels 1
    Transferred: sent 2752, received 2936 bytes, in 1.0 seconds
    Bytes per second: sent 2670.6, received 2849.2
    debug1: Exit status 1

**4. Membuat Repository baru**

Selanjutnya kita akan membuat repository baru di Github. Github menyediakan dua opsi repostitory. Yaitu *public* dan *private*. Public Repository is free sedangkan private berbayar. Kita akan membuat free public repository.

Klik tombol **New Repository** seperti gambar dibawah ini. Kemudian isikan nama repository dan description, terakhir klik tombol Create Repository untuk membuat repo baru di Gihub

![Alt text](/images/new-repo.png)

![Alt text](/images/new-repo-2.png)

Jika berhasil anda akan menuju ke halaman seperti dibawah ini

![Alt text](/images/new-repo-3.png)

Pada artikel berikutnya kita akan menjelajahi Github lebih dalam lagi. Kita akan mengeksplore fitur-fitur Github seperti Forking, Pull Request, Watch Repo, Follow, Bug Tracker dan lain sebagainya
