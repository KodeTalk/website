---
type: post
layout: post
title: Kolaborasi dengan Github Part 2
date: 2013-10-14
author: glend
categories: Git
---
**5. Clone repository**

Setelah kita membuat Repository di Github, saatnya kita menambah file ke dalam repository kita tersebut. Supaya mudah, kita clone terlebih dahulu repository kita di Github ke komputer lokal kita. Git adalah *Distributed Version Control System*, distributed yang dimaksud disini salah satunya adalah distributed repository. Oleh karena itu, untuk mengambil file di server, kita tidak melakukan *checkout* seperti di *Subversion*, tapi kita meng-clone (menggandakan) repo di server ke komputer lokal kita. Sehingga kita akan mempunyai dua repository nantinya, yaitu repository di server dan repository di komputer lokal.

[more]

Kita dapat mengclone melalui protocol https atau SSH. Di artikel sebelumnya kita sudah men-setting SSH key kita di Github, dan kita akan menggunakannya untuk meng-clone repository. Rumusnya sederhana, yaitu **git clone [url repository]**. URL repository dapat kita ambil di halaman repository kita di Github. Lihat gambar dibawah ini

![Alt text](/images/url-clone.png)

    ~$ git@github.com:glendmaatita/Tolkien.git

Git akan meng-clone repo kita di Github ke directory dimana perintah diatas dijalankan. Jika kita menjalankan perintah **git remote -v** Git akan memberitahu URL dari remote repository kita

    ~$ git remote -v
    origin git@github.com:glendmaatita/Tolkien.git (fetch)
    origin git@github.com:glendmaatita/Tolkien.git (push)

*origin* adalah nama dari repo remote kita, yaitu yang ada di Github. Kita juga dapat menambah remote repo kita selain di Github. Ingat, Git bersifat distributed. Kita dapat menambahnya dengan perintah **git remote add [nama] [url]**.

Di repo lokal kita, yaitu di komputer kita dapat menambah file, meng-commit-nya, kemudian melakukan 'push' ke remote repository kita. Perintahnya adalah **git push [nama remote repo] [nama branch]**. Jika kita ingin me-push ke github dan yang akan kita push adalah branch master, berarti kita akan melakukan perintah seperti ini

    ~$ git push origin master
    Counting objects: 3, done.
    Writing objects: 100% (3/3), 230 bytes, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To git@github.com:glendmaatita/Tolkien.git
    * [new branch] master -> master

Begitu juga ketika ingin melakukan update. Git menyediakan dua mekanisme yaitu fetch dan pull. Keduanya mempunyai tujuan yang sama namun beda mekanisme. Sederhananya **pull = fetch + merge**. Simak contoh berikut. Misal ada rekan kerja kita yang melakukan push ke repo kita di Github dan kita ingin mendapatkan update code dari rekan kita tersebut. Maka, kita akan melakukan fetch untuk mendapatkan update tersebut. Perintahnya adalah **git fetch [nama remote repo]**. Nama remote repo disini berarti adalah origin karena kita ingin mendapatkan update dari repo kita di Github

    ~$ git fetch origin
    remote: Counting objects: 5, done.
    remote: Total 3 (delta 0), reused 0 (delta 0)
    Unpacking objects: 100% (3/3), done.
    From github.com:glendmaatita/Tolkien
    d791758..27559c6 master -> origin/master

Git otomatis akan menarik data dari remote repository dengan nama origin (Github) ke repository lokal. Dapat dilihat diatas bahwa data ditarik dari branch master di remote server Github ke di branch origin/master di repository lokal kita.

Yang perlu diperhartikan disini adalah branch origin/master yang merupakan branch khusus. Kita tidak akan melihat branch ini ketika kita menjalankan perintah **git branch**

    ~$ git branch
    * master
    
Tapi kita bisa melihat nya dengan menambahkan parameter 'r' yang berarti kita ingin Git menampilkan remote-tracking branches

    ~$ git branch -r
    origin/master

Remote Tracking branch adalah branch khusus yang dibuat untuk menyamakan kondisi repository lokal dengan repository remote kita. Cara menyamakannya tentunya dengan perintah *fetch* diatas dilanjutkan dengan perintah *merge*. Tiap kali kita melakukan fetch, update dari remote repo akan masuk ke remote tracking branch kita dan tidak serta merta mengupdate branch utama (master) di repo lokal kita. Cara ini sangat efektif untuk menghindari konflik file langsung akibat update yang langsung mengubah branch master kita.

Sehingga jika kita melakukan perintah fetch diatas, tidak serta merta branch utama (master) di repo lokal kita berubah, kita harus melanjutkannya dengan perintah merge dengan branch master kita. Sehingga kita harus melakukan perintah berikut

    ~$ git merge origin/master
    Updating d791758..27559c6
    Fast-forward
    README | 2 ++
    1 file changed, 2 insertions(+)

**6. Forking**

Forking adalah murni fitur dari Github. Fitur ini tidak terdapat pada Git. Forking digunakan untuk meng-clone suatu repository milik suatu akun github ke dalam account kita. Jadi, saat kita melakukan forking, sejatinya kita melakukan git clone ke suatu repository di Github dan meletakkan clone repository tersebut ke dalam account kita di Github. Setelah melakukan forking, kita bisa memperlakukan repository hasil forking tersebut selayaknya repository kita sendiri. Kita bisa mengupdate, menambah, atau menghapu file.

Untuk melakukan forking, kita tinggal membuka suatu repository project dan mengklik tombol Forking. Perhatikan gambar dibawah ini

![Alt text](/images/forking.png)

Selanjutnya Github akan otomatis melakukan clone ke account Github anda

Jika proses forking sukses, anda akan melihat repository tersebut di account anda

![Alt text](/images/fork-success.png)

Selanjutnya anda dapat memperlakukan repository ini sebagai repository milik anda sendiri. Anda dapat meng-clone ke komputer lokal anda, melakukan modifikasi, dan melakukan push ke Github.

**7. Pull Request**

Pull Request juga merupakan fitur dari Github. Bersama dengan Forking, Pull Request merupakan fitur yang sangat menarik di Github dan merupakan alat bagi Github untuk melakukan misinya, yaitu menghilangkan barrier atau kesulitan saat seseorang ingin berkontribusi ke suatu project (open source).

Pull Request tidak dapat dipisahkan dari Forking. Bayangkan seperti ini : Anda menemukan suatu project open source yang sangat menarik perhatian anda. Anda tentu ingin berkontribusi ke project tersebut. Langkah awal yang akan anda lakukan adalah melakukan Forking, sehingga anda mempunyai clone dari repository project open source tadi di akun Github anda. Langkah selanjutnya adalah anda melakukan clone dari repo yang telah di-fork tadi ke komputer lokal anda sehingga anda dapat menambah, mengedit, atau menghapus file. Inilah yang nantinya akan menjadi kontribusi anda ke project open source tadi. Kemudian anda melakukan commit dan mem-push perubahan tadi ke Github, tentunya ke repo hasil forking anda di Github.

Sampai disini, perubahan yang anda buat hanya akan terupdate di repo Github anda. Perubahan belum terjadi di repository asli dari project open source tersebut. Dan langkah terakhir yang harus anda lakukan adalah melakukan Pull Request.

Jadi Pull Request dapat diibaratkan, anda mengirim permintaan agar perubahan kode yang telah anda lakukan di-merge ke dalam repository aslinya. Jika Pull Request anda disetujui, dapat dikatakan anda telah menjadi bagian dari kontributor project open source tadi.

Untuk melakukan Pull Request, klik link Pull Request yang ada di halaman repo forking anda

![Alt text](/images/pull-request-1.png)

![Alt text](/images/pull-request-2.png)

Anda selanjutnya akan dibawa ke halaman compare. Halaman Compare ini akan menampilkan perbedaan repo forking anda sebelum dan sesudah anda modifikasi. Terlihat pada gambar dibawah ini saya mengubah beberapa bagian dari file Readme. Jika anda sudah yakin dengan perubahan yang anda buat klik link dengan blok biru diatas

![Alt text](/images/pull-request-3.png)

Anda akan dibawah ke halaman untuk memberi message di Pull Request anda. Klik link Send pull request untuk mengirim perubahan anda ke repository aslinya

![Alt text](/images/pull-request-4.png)

Dengan begini, perubahan yang anda buat sudah terkirim dan pemilik repository asli dari project tersebut akan mendapatkan notifikasi. Jika Pull Request anda di-approve, otomatis repo aslinya akan terupdate dengan perubahan yang anda buat. Gambar dibawah ini memperlihatkan bahwa pemilik repo mendapat notifikasi tentang pull request

![Alt text](/images/pull-request-notif.png)

Pemilik Repo asli juga dapat memberikan comment dan melakukan approval terhadap suatu Pull Request dengan mengklik tombol Merge pull request

![Alt text](/images/pull-request-merged.png)

Sampai disini kita sudah membahas cara berkolaborasi menggunakan Github dengan memanfaatkan fitur Fork dan Pull Request. Part berikutnya akan membahas tentang Watch, Follow, dan Bug Tracker
