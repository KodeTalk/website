---
type: post
layout: post
title: Pengenalan OpenShift : Pengganti Heroku untuk Aplikasi Web Python Anda
date: 2013-10-31
author: eko
categories: Review, Cloud, Python
---
![Alt text](/images/openshift.png)

Nb: Versi asli (English Version) tulisan ini dapat anda baca di link dibawah ini:
[http://pythonthusiast.pythonblogs.com](http://pythonthusiast.pythonblogs.com/230_pythonthusiast/archive/1304_introducing_openshift__heroku_replacement_for_your_next_killer_python_web_application.html)

Jika kamu sudah cukup berpengalaman dengan pengembangan aplikasi web dengan PHP, saya yakin, menemukan layanan hosting yang murah sangatlah mudah. Ini memang adalah salah satu poin positif jika kamu mengembangkan websitemu dengan menggunakan PHP. Ini disebabkan PHP, atau lebih spesifik-nya stack development **LAMP** (Linux, Apache, MySQL, & PHP) adalah stack development yang paling populer untuk mengembangkan aplikasi web. Hosting untuk PHP sangat beragam dengan variasi harga yang bermacam-macam pula. Kamu bisa menemukan banyak layanan hosting yang gratis, harga kisaran 100rb rupiah, hingga jutaan. 

[more]

Tapi hal diatas tidak akan berlaku jika kamu membangun aplikasi web mu dengan Technology Stack lain selain LAMP seperti Ruby, Java, atau Python. Menemukan layanan hosting yang murah atau bahkan gratis untuk beberapa stack tadi tidak akan semudah mencari layanan hosting yang murah untuk PHP. Pendekatan tradisional yang paling umum untuk meng-host sebuah website berbasis selain PHP adalah dengan menggunakan layanan **VPS** seperti contonya yang ditawarkan oleh [Digital Ocean](https://www.digitalocean.com/), yang sayangnya, seringkali mereka tidak menyediakan free account. Harga layanannya pun juga tidak bisa dibilang murah. Dari pengalaman saya, promo free account cukup penting, setidaknya kita dapat mencoba terlebih dahulu untuk me-running aplikasi kita secara gratis.

Jika kamu punya pengalaman seperti saya, terutama mencari layanan hosting yang free untuk aplikasi web Python, saya yakin kamu sudah tahu tentang [Heroku](https://www.heroku.com/). Heroku adalah layanan cloud, tepatnya **Platform as a service** (PaaS) yang cukup terkenal dan proven, yang telah meng-host banyak aplikasi web besar. Heroku membuat kamu dapat fokus ke aplikasimu, daripada mengkhawatirkan masalah server seperti instalasi dan maintenance yang kesemuanya sudah dihandle oleh pihak Heroku. Selain itu, kita dapat membuat free account di Heroku. Sebuah free account di Heroku dapat meng-host maksimal 5 aplikasi.

![Alt text](/images/heroku.jpg)

Di samping itu, Heroku mempunyai apa yang dinamakan konsep *Add-ons*, dimana kita dapat menambah berbagai macam teknologi tambahan semisal PostgreSQL, MongoDB, MySQL, Redis, Hadoop, dan masih banyak lagi, ke dalam aplikasi kita yang sedang berjalan secara on the fly. Bahkan beberapa add-ons tersebut ada yang free. Heroku juga mempunyai [**Heroku Toolbelt**](https://toolbelt.heroku.com/), yaitu semacam aplikasi console (CLI) untuk memanage aplikasi yang kamu host di Heroku. Kita dapat menggunakan Heroku Toolbelt untuk login, membuat aplikasi, mendeploy, memasang addons, dll. Intinya adalah kita dapat memanage aplikasi kita secara cepat dan mudah dengan menggunakan Toolbelt. 

Dari sekian banyak kelebihan Heroku yang saya paparkan diatas, Heroku mempunyai batasan yang cukup membuat saya geleng-geleng kepala, diantaranya adalah

+ Free Plan untuk PostgreSQL (atau database lain, saya belum mengecek), adalah 5MB. Apa yang dapat kita lakukan dengan database sebesar 5MB? Walaupun free, kita tentu tidak bermaksud untuk menghost semacam aplikasi untuk mencatat nomor kontak di telepon kita.

+ Aplikasi yang kita host dengan menggunakan free account tidak dapat menyimpan file yang diupload oleh user. Jadi jika kamu berangan-angan untuk membuat aplikasi Facebook killer, lebih baik teruslah berangan-angan, karena user kita bahkan tidak dapat mengupload avatar mereka

+ Terakhir, free account hanya dapat menghost aplikasi dengan size maksimal 100MB, sudah termasuk semua library dan framework pendukung

Sebenarnya saya telah mencoba untuk mendevelop aplikasi di Heroku, mencoba untuk mengalah kepada size database PostgreSQL yang dibatasi sebesar 5MB. Tapi pada akhirnya, saya tidak dapat lagi melanjutkannya. Jadi sekali lagi saya mencoba untuk mencari dan mencari *a great free plan* untuk menghost aplikasi web Python saya, hingga pada akhirnya saya menjatuhkan pilihan ke [**OpenShift**](https://www.openshift.com/).

Untuk kategori sebagai **Platform as a Service** , OpenShift mempunyai semua yang ditawarkan oleh Heroku, tetapi dengan satu kelebihan : *"3 Aplikasi, masing-masing dengan size maksimal sebesar 1 GB, sudah termasuk seluruh library dan framwork pendukung, Database, dan File yang diupload oleh user"*. Menurut pendapat saya, dengan opsi seperti ini, kita bisa berharap untuk menghost aplikasi real kita ke OpenShift dengan free account. 

Seperti yang sudah saya katakan sebelumnya, bahwa OpenShift datang dengan (mungkin) segala fitur yang dimiliki oleh Heroku, OpenShift juga mempunyai apa yang disebut **Gear** (padanan Dyno di Heroku) atau Cartridge (Add-ons). OpenShift juga mempunyai semacam Heroku Toolbelt agar kita dapat dengan mudah memanage aplikasi yang kita host di OpenShift. 

Di artikel berikutnya tentang Python dan OpenShift, kita akan membahas bagaimana membuat sebuah functional application di OpenShift dengan menggunakan [Python Flask](http://flask.pocoo.org/), [SQL Alchemy](http://www.sqlalchemy.org/), PostgreSQL, dan Bootstrap. Stay Tune !