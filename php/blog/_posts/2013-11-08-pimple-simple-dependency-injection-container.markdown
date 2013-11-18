---
type: post
layout: post
title: Pimple - Simple Dependency Injection Container
date: 2013-11-08
author: glend 
categories: PHP, Review
---
[Pimple](http://pimple.sensiolabs.org/) adalah sebuah library yang digunakan sebagai container untuk melakukan mekanisme Dependency Injection. Pimple sangat simple, hanya terdiri dari sebuah class yang mengextend [ArrayAccess](http://php.net/manual/en/class.arrayaccess.php) dengan panjang kode kurang lebih sekitar 50 baris kode. Sebelum tahu cara kerja Pimple, kita harus mengerti terlebih dahulu apa itu dependency injection.

![Alt text](/images/pimple.png)

**Dependency Injection (DI)**

Sesuai namanya, DI adalah *sebuah mekanisme untuk meng-inject/memasukkan dependency ke dalam suatu object/class*. Lalu, apa itu **Dependency**? secara singkat, dependency merupakan object atau variable yang dibutuhkan suatu object lain agar object lain tersebut bisa berjalan. Ambil contoh sederhana ketika kita membuat sebuah class yang akan kita gunakan untuk mengirim email. Tentu class tersebut memerlukan class lain (library) yang berfungsi untuk mengirim email. Lihat code dibawah ini

[more]

    class KirimEmail {
        private $emailSender;
        
        public function __construct()
        {
            // instantiate lib
            $this->emailSender = new EmailSender();
        }
        
        public function kirim_email()
        {
            // set properties
            $this->emailSender->setSender('glend_maatita@yahoo.com');
            $this->emailSender->setReceiver'anonymous@yahoo.com');
            $this->emailSender->setSubject('Kirim Email');
            $this->emailSender->setMessage('Test kirim email ah !!');
            
            // send
            $this->emailSender->send();
        }
    }
    
    // client
    $kirimEmail = new KirimEmail();

Dari kode diatas kita bisa tahu kalo class yang kita buat yaitu **KirimEmail** membutuhkan class lain agar bisa berjalan, yaitu class **EmailSender** atau dapat dikatakan kalau class KirimEmail *dependent* terhadap EmailSender. Inilah yang dinamakan dependency, dan di contoh code diatas kita melakukan instantiate dependency di constructor. Nah DI sendiri merupakan sebuah mekanisme untuk memasukkan suatu dependency ke dalam suatu class sehingga class tersebut *tidak perlu melakukan instantiate dependency*, class tersebut tinggal *meminta* dependency yang dia butuhkan. Perhatikan perbedaan code diatas dengan code berikut ini

    class KirimEmail {
        private $emailSender;
        public function __construct(EmailSender $emailSender)
        {
            // Dependency Injection !!
            $this->emailSender = $emailSender;
        }
        
        public function kirim_email()
        {
            // set properties
            $this->emailSender->setSender('glend_maatita@yahoo.com');
            $this->emailSender->setReceiver('anonymous@yahoo.com');
            $this->emailSender->setSubject('Kirim EmaiL');
            $this->emailSender->setMessage('Test kirim email ah !!');
            
            // send
            $this->emailSender->send();
        }
    }
    
    // client
    // instantiate dependency here
    $emailSender = new EmailSender();
    // inject dependency !!
    $kirimEmail = new KirimEmail($emailSender);

Pada code diatas, kita tidak melakukan intance EmailSender di dalam class KirimEmail !! Kita melakukan hal tersebut di code di client lalu menginject-kannya ke dalam class KirimEmail melalui contructor karena class KirimEmail *meminta* dependency tersebut melalui contructor nya. Thats it, itulah Dependency Injection ! sesimple itu :D

Cara lainnya untuk melakukan DI adalah melalui **Setter Method**, perhatikan contoh code berikut ini lalu bandingkan dengan code diatas

    class KirimEmail 
    {
        private $emailSender;
        public function __construct(){}
        
        public function kirim_email()
        {
            // set properties
            $this->emailSender->setSender('glend_maatita@yahoo.com');
            $this->emailSender->setReceiver('anonymous@yahoo.com');
            $this->emailSender->setSubject('Kirim Email');
            $this->emailSender->setMessage('Test kirim email ah !!');
            
            // send
            $this->emailSender->send();
        }
        
        // Dependency Injection via setter method !!
        public function setEmailSender(EmailSender $emailSender)
        {
            $this->emailSender = $emailSender;
        }
    }
    // client
    // instantiate dependency here
    $emailSender = new EmailSender();
    
    $kirimEmail = new KirimEmail();
    // inject dependency !!
    $kirimEmail->setEmailSender($emailSender);
    
Pada code diatas kita tidak menginject dependency melalui contructor, akan tetapi melalui method setter :) . Lalu, apa manfaatnya DI ini ? Diantaranya, tak lain dan tak bukan adalah membuat code kita jadi loosely coupled.

**Dependency Injection Container**

Nah, udah lihat contoh mekanisme DI diatas. Lalu apa hubungannya dengan Pimple? Pimple adalah **Dependency Injection Container**. Pimple adalah container dari dependency-dependency yang akan kita inject-kan. Kita tidak harus menggunakan pimple sebagai container untuk DI, kita bisa gunakan array biasa seperti

    $container = array(new Dependency1(), new Dependency2(), new Dependency3())

Tapi pimple menawarkan sesuatu yang unik karena Pimple meng-extends apa yang disebut dengan **ArrayAccess**. Dengan ArrayAccess, kita bisa membuat suatu object, dan meng-inject value/object lain dengan cara seperti yang dilakukan oleh array. Terlihat sedikit ajaib. Perhatikan contoh pemakaian pimple berikut

    require_once '/path/to/Pimple.php';
    
    $container = new Pimple();
    $container['cookie_name'] = 'SESSION_ID';
    $container['session_storage_class'] = 'SessionStorage';

Perhatikan, kita mendefinisikan **$container** sebagai object dari Pimple, *bukan* array. Tapi kita bisa memasukkan sembarang object atau value dengan cara yang fleksible seperti pada array. Dengan memanfaatkan Pimple yang men-extends ArrayAccess ini, kita bisa membuat container yang sangat fleksible. Misalnya kita bisa meng-extend lagi Pimple di class kita, atau kita bisa memanfaatkan closure seperti kode dibawah ini

    $container = new Pimple();
    $container['cookie_name'] = 'SESSION_ID';
    $container['session_storage_class'] = 'SessionStorage';
    
    $container['session_storage'] = function ($container) {
        return new $container['session_storage_class']($container['cookie_name']);
    };
    
    $container['session'] = function ($c) {
        return new Session($c['session_storage']);
    };

Perhatikan, kita akan meng-inject-kan sebuah object dengan nama **session_storage**, yang mana session session_storage ini adalah instance dari class bernama **SessionStorage** (nama class ini kita inject terlebih dahulu ke $container['session_storage_class'] ) dan mempunyai dependency SESSION_ID ($container['cookie_name']). Dan saat mendefinisikan $container['session_storage'] kita beri parameter **$container** alias container itu sendiri!! Ini yang membuat fleksible dan tidak bisa dilakukan oleh container yang hanya merupakan array biasa.

Jadi, jika kita menggunakan Pimple untuk kode DI kita diatas, kita akan mendapati kode kita seperti ini

    class KirimEmail {
        private $container;
        public function __construct($container)
        {
            $this->container = $container;
        }
            
        public function kirim_email()
        {   
            // akses object dari Pimple
            $emailSender = $this->container['emailSender'];
            $emailSender->setSender('glend_maatita@yahoo.com');
            $emailSender->setReceiver('anonymous@yahoo.com');
            $emailSender->setSubject('Kirim EmaiL');
            $emailSender->setMessage('Test kirim email ah !!');
            
            // send
            $emailSender->send();
        }
    }
        
    // client
    $container = new Pimple();
    $container['emailSender'] = new EmailSender();
    $kirimEmail = new KirimEmail($container);

Keuntungan lainnya adalah, Pimple *baru akan* men-instance suatu class ketika memanggilnya, di contoh diatas, Pimple baru meng-instance class EmailSender ketika mengakses 

    // akses object dari Pimple
    $emailSender = $this->container['emailSender'];
    
Jadi kita tidak perlu khawatir performa aplikasi kita akan menurun ketika meng-inject kan banyak object ke Pimple (container).

Yap, sekian pengenalan Pimple, DI Container yang paling simple yang pernah saya pake. Untuk dokumentasi (sedikit) lebih lengkapnya, cek [official web Pimple](http://pimple.sensiolabs.org/)

Happy Coding !!