---
type: post
layout: post
title: Tutorial Emacs untuk Pendatang Baru
date: 2013-10-13
author:
  name: Eko Wibowo
  email: swdev.bali@gmail.com
  facebook: Your Facebook
  twitter: Your Twitter
  github: Your Github
  signature: "One must fully understand the system and all of its intricacies in order to build a computer program"
categories: Emacs, Linux
---
![Alt text](/images/emacs-01.png)

Kenapa Emacs? Jawabannya : Kenapa Tidak? :)

Emacs adalah sejarah Linux itu sendiri. Sama seperti jika Anda melihat kelangit dan menatap alam semesta, maka sejatinya Anda sedang melihat masa lalu dari alam semesta itu sendiri, karena cahaya berbagai objek langit yang Anda lihat, ada yang membutuhkan waktu jutaan Tahun Cahaya untuk bisa mencapai bumi. Maka seperti itulah Emacs : menggunakan Emacs adalah kembali ke awal sejarah awal penciptaan Linux. Isn't that amazing?

Emacs ditulis oleh Richard Matthew Stallman, seorang Atheist yang kebetulan juga adalah Founder GNU, yang dengannya, Anda dan saya saat ini bisa menikmati segala antusiasme, kemudahan dan semangat Open Source. Dengan keinginan kuat untuk mengembangkan Sistem Operasi Unix-nya sendiri, Stallman mulai pelan-pelan mengganti semua tool propietary yang dimiliki Unix dengan tool yang dikembangkan olehnya. Dan, Anda benar, yang pertama kali digantinya adalah Text Editor. Kenapa? Karena Stallman membutuhkan Text Editor untuk mulai menyusun kode. Perkembangan Emacs dimulai dari titik itu sampai ... sekarang. Kurang lebih di tahun 2013 ini Emacs sudah mencapai usia 30 tahun.

[more]

Kunci dari ekstensibilitas Emacs adalah dipergunakannya bahasa Elisp untuk mendefinisikan semua behaviour Emacs. Anda akan terbiasa menemukan Emacs dijejali semua package yang bervariasi mulai dari syntax coloring, shell, project management, email client, calendar (dengan sistem kalendar Masehi, Hijriyah dsb), code completion, error debugger dan seabreg perangkat lainnya. Anda bisa mengembangkan Package Emacs Anda sendiri, dengan terlebih dahulu mempelajari bahas Elisp yang dipergunakan Emacs dan mempelajari titik-titik pengembangan yang disediakan Emacs. Ah, sampai saat ini saya belum berkesempatan menulis package Emacs saya sendiri, namun tentunya itu akan pasti saya lakukan seiring dengan berjalannya waktu.. Insya Allah.

Untuk memulai Emacs, Anda bisa mulai dari lingkungan apa saja : Windows, OSX, Linux, BSD, FreeBSD dan bahkan Android. Anda bisa memulainya di linkungan console/terminal atau X-Windows/Windows GUI. Silahkan download dari situs resmi [Emacs](http://www.gnu.org/software/emacs/). Jalankan sesuai dengan lingkungan kerja Anda. Ketikkan emacs jika Anda sedang berada di dalam Terminal/Console. Berikut contoh dari tampilan awal Emacs :
![Alt text](/images/emacs-02.png)

Sesi Emacs ini dijalankan dalam modus TTY/Terminal pada Ubuntu 12.0.4 LTS di dalam Virtual Box yang berjalan di lingkungan OSX (phew...). Ya, benar, saya bukan pemakai murni Linux, namun campuran dari OSX, Windows dan Linux. Karena, menyenangkan sekali bisa mengembangkan solusi untuk berbagai Sistem Operasi yang ada. Jalan yang bisa ditempuh adalah dengan menggunakan aplikasi Virtualisasi, semisal VirtualBox. Pilihan saya untuk mesin yang akan menjalankan lingkungan virtualisasi ini adalah OSX, namun sebaiknya penjelasan lengkapnya saya sisihkan untuk artikel selanjutnya.

Yang mencirikan Emacs dari editor lainnya adalah rangkaian tombol untuk dapat menjalankan perintah-perintah Emacs. Meskipun Emacs versi GUI sudah menyediakan fitur menu pulldown berbasis GUI, namun itu bukan yang utama. Berikut saya tuliskan 3 perintah elementer yang pasti akan Anda jalankan jika mulai bekerja di Emacs :

     * C-x C-f : Membuka file baru
     * C-x C-s : Menyimpan file
     * C-x C-c : Keluar dari Emacs

Jika ini pertama kali Anda melihat anehnya syntax untuk menulis perintah Emacs tersebut, maka Anda bukan sendirian. Awalnya saya pun heran. Apa maksudnya C-x ? C-f?
C adalah tombol Control. C-x senada dengan CTRL+x. Yaitu, tekan tombol Ctrl, jangan dilepas, tekan tombol x, lepaskan. Adapun C-x C-f, berarti tekan tombol CTRL sekali, kemudian tekan tombol x dan f berurutan.

Untuk melengkapi contoh selanjutnya, berikut saya tuliskan perintah yang berkenaan dengan Windowing/Frame :
      * C-x 1 : memaksimalkan frame yang aktif memenuhi seluruh layar
      * C-x 2 : membagi layar menjadi dua frame secara horizontal
      * C-x 3 : membagi layar menjadi dua frame secara vertikal
      * C-x 0 : menghapus frame yang aktif
      * C-x o : pergi ke frame lain yang ada


Perhatikan bahwa saya tidak menuliskan C-x 1 menjadi C-x C-1. Artinya tekan tombol Ctrl, jangan dilepaskan, tekan tombol x, lepaskan dan tekan tombol 1. Yak, betul begitu...
![Alt text](/images/emacs-03.png)

Pada Emacs, Window/Frame tidak selalu adalah file teks yang sedang diedit. Sebagai contoh, pada gambar di atas, saya menggunakan Eshell (Emacs shell, yaitu shell yang berjalan di dalam Emacs) pada suatu Frame tersendiri. Dan jelas, tampilan dari Eshell bukanlah file teks.

Bedakan antara Buffer dan Frame. Buffer adalah isi dari file teks (atau apapun) yang sedang diedit di Emacs. Buffer tidak mesti tampil di dalam Frame yang aktif. Menutup frame tidak akan menutup Buffer, namun jika menutup buffer berarti sekaligus menutup frame yang terkait. Berikut saya tuliskan perintah elementer yang berkenaan dengan operasi pada buffer:
      * C-x k : menutup buffer
      * C-x b : pergi ke buffer tertentu (ketikkan saja nama buffer/nama file, pada command line Emacs)

Saya nyaris tidak pernah melakukan operasi pada buffer lebih dari dua perintah tersebut.

Berikut saya tuliskan shortcut untuk pergerakan dan berbagai fungsi lain yang sering saya pakai
      * M-< : ke awal buffer
      * M-> : ke akhir buffer
      * C-a : ke awal baris. Atau tombol HOME 
      * C-e : ke akhir baris. Atau tombol END (meski di terminal OSX, dua tombol ini berperilaku yang berbeda : pergi ke awal/akhir terminal...)
      * C-s : pencarian teks, yang setelah Anda menekan tombol ENTER, kursor akan bergerak ke lokasi kata tersebut. Saya teramat sering pergunakan teknik ini. Tekan C-s lagi untuk menjadi teks yang sama
      * C-z : undo
      * C-space : memulai tanda untuk melakukan seleksi, gerakkan kursor dengan berbagai teknik pergerakan, dan sekali lagi C-s untuk mengakhiri seleksi, kemudian ...
      * C-c/C-w : untuk mengkopi/cut teks tersebut ke clipboard dan .. 
      * C-y/C-v : untuk mempaste clipboard ke lokasi kursor aktif
      * M-d : menghapus satu kata pada posisi cursor
      * C-g : membatalkan perintah Emacs. Misal Anda ingin membuka file, C-x C-f, namun setelah C-x, Anda ingin membatalkan aksi, maka batalkan saja dengan C-g

M-.. ? M maksudnya adalah META atau ALT :)
             

Terakhir, untuk mengkustomasi Emacs dari sifat bawaannya, Anda bisa membuat file .emacs pada direktori HOME Anda. Bagi Anda yang bekerja pada lingkungan *nix, Anda jelas tahu dimana letak direktori HOME Anda. Namun, tidak demikian bagi pemakai Windows. Pasti Anda kurang jelas yang mana yang direktori HOME : My Documents? Desktop? C:\ ? Jawabannya berbeda-beda tergantung sistem operasi Windows. Membingungkan sekali. Jika di Windows 7, folder C:\Users\<nama login> adalah HOME folder Anda. Namun, agar tidak bingung, buat saja Environment Variabel HOME dan arahkan ke folder yang ingin Anda jadikan sebagai HOME folder bagi Emacs. 
![Alt text](/images/emacs-04.png)

Adapun mengkustomasi Emacs akan bisa membuat Anda semakin mengenali Emacs, dan seringkali file .emacs ini akan membesar dan semakin kompleks (karena file ini sendiri menggunakan bahasa Elisp). Untuk itu Anda akan mudah menemukan file kustomasi .emacs disimpan ke dalam Github secara publik untuk dapat digunakan siapa saja. Atau, dipergunakan perseorangan untuk dapat di-clone ke berbagai sistem operasi yang menggunakannya. Saya sendiri memmiliki repository .emacs dan paket-paket pelengkapnya di [Github](https://github.com/swdevbali/.emacs.d). Clone saja repo tersebut dan letakkan di folder HOME. Kemudian, buat simbolic link dari .emacs.d/.emacs ke folder HOME Anda. Pada kustomasi tersebut, saya setup beberapa package dan shortcut key yang penting :
      * C <left/right arrow> : pindah dari konfigurasi frame satu ke frame lainnya. Misalnya saat ini Anda sedang mengedit satu layar penuh file todo.org, dan kemudian membagi layar menjadi dua, maka Anda bisa kembali ke konfigurasi frame sebelumnya dengan menekan tombol CTRL, lepaskan dan tekan tombol panah kiri. Tekan tombol panah kanan untuk menuju bentuk konfigurasi berikutnya.
      * Paket ido untuk file completion pada command bar Emacs.
      * Mensetup Emacs tanpa scrollbar, menubar 
      * ... dan masih banyak lagi :)

Selamat menikmati Emacs Anda!