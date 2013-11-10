---
type: post
layout: post
title: Membangun Aplikasi Python dengan Menggunakan Flask di OpenShift Part 3: Memulai Membangun Aplikasi
date: 2013-11-10
author: eko 
categories: Programming, Cloud, Python
---
Sekarang kita sudah tahu detail aplikasi seperti apa yang akan kita buat di part sebelumnya sehingga kita bisa langsung memulai coding. Saya akan memberi nama project ini dengan *'bio'* sesuai dengan part sebelumnya. Jika anda belum membuatnya, silakan simak part sebelumnya dari tutorial series ini. Jika anda sudah membuatnya, silakan masuk ke folder *'bio'*, dan anda akan menemukan beberapa file dan folder.

[more]

**Setting Remote Server Environment**

Untuk awalnya, buka file yang bernama *setup.py*, isinya harusnya kurang lebih seperti berikut ini

    from setuptools import setup
    setup(name='YourAppName',
        version='1.0',
        description='OpenShift App',
        author='Your Name',
        author_email='example@example.com',
        url='http://www.python.org/sigs/distutils-sig/',
        # install_requires=['Django>=1.3'],
    )
    
Openshift menggunakan *setuptools* untuk mem-package aplikasi dan mengatur dependency dari aplikasi. Di part sebelumnya, kita sudah tahu stack teknologi apa yang akan kita pakai. Stack tersebut akan menjadi **dependency** dari aplikasi kita. So, kita akan edit *setup.py*, dan akan kita tulis semua dependency untuk aplikasi kita

    from setuptools import setup
    setup(name='Bio',
        version='1.0',
        description="Let's you have a fully interactive Curriculum Vitae",
        author='Eko S. Wibowo',
        author_email='swdev.bali@gmail.com',
        url='http://www.python.org/sigs/distutils-sig/',
        install_requires=
        [
            'Flask==0.10.1',
            'Flask-SQLAlchemy==1.0',
            'Flask-Login==0.2.7',
            'Flask-WTF==0.9.2'
        ],
    )
    
Perhatikan, kita menambahkan *description, data author, dan dependency* untuk aplikasi kita. Khusus untuk dependency, kita menuliskannya di section *install_requires* beserta versi-nya. Ini membuat Openshift akan mendownload dependency di versi tertentu, bukan mendownload versi terbaru-nya. Cukup seperti itu sebagai awalnya, sekarang saatnya kita mencoba untuk mendeploy kode yang kita ubah ini ke server Openshift. Untuk melakukannya, gunakan perintah **git push**, sangat mudah !!

    ~$ git add .
    ~$ git commit -am "Initial commit"
    ~$ git push
    
Done!! :)

Anda dapat melihat, Openshift menampilkan beragam system message yang dapat kita baca agar kita dapat lebih memahami bagimana application startup process di Openshift. Sampai disini, kita baru mendeploy kode untuk *setup.py* saja, dan tidak akan ada perubahan apapun jika kita mengakses aplikasi kita sekarang (untuk aplikasi saya, dapat diakses di [http://bio-ekowibowo.rhcloud.com](http://bio-ekowibowo.rhcloud.com)). Yap, persiapan environment di server, Done!! Saat nya menyiapkan environment di komputer lokal kita.

**Setting Local Environment**

Sebelum memulai coding aplikasi dengan menggunakan Flask di lokal, ada baiknya terlebih dahulu kita men-setting **virtual environment** untuk aplikasi flask kita. Apa itu *virtual environment*? Anggap saja virtual environment itu seperti *sandbox* dimana aplikasi kita berjalan. Sandbox ini membuat aplikasi kita terkesan independen. Tidak akan terganggu oleh aplikasi lainnya yang berjalan di server yang sama. Dan sebaliknya, juga tidak akan mengganggu aplikasi atau process lain yang berjalan di server yang sama.  Setiap aplikasi yang berada didalam sandbox-nya masing-masing akan me-mantain sendiri seluruh libraries yang digunakannya. Sehingga jika ada suatu aplikasi yang menggunakan library dengan nama yang sama denga aplikasi lain, kemudian mengupdate library tersebut, aplikasi lainnya tersebut tidak akan terganggu. Selain itu, dengan sandbox kita juga bisa membuat environment yang sama di komputer lokal, dan di remote server.

Jika anda bekerja dengan Windows, simak [artikel ini](w.stuartellis.eu/articles/python-development-windows/) untuk penjelasan lengkap bagaimana men-setting Python virtual environment. Jika anda pengguna Linux, cukup jalankan beberapa perintah berikut ini 

    ~$ sudo apt-get install python-virtualenv
    
Dan dari dalam folder *bio*, buat virtual environment dan aktifkan environment tersebut

		~$ cd bio
    ~$ virtualenv env
    ~$ source env/bin/activate
    
Perintah diatas akan membuatkan anda sebuah virtual environment, dimana semua python packages untuk aplikasi anda akan diinstall. 

Next step adalah menginstall semua libraries dependencies yang akan digunakan untuk aplikasi kita. Apa saja yang harus diinstall? Kita akan menginstall libraries yang sama seperti yang telah kita tulis di file *setup.py*, plus tambahan satu library yaitu [psycopg2](https://pypi.python.org/pypi/psycopg2), driver untuk PostgreSQL. Yup! harus sama karena kita ingin environment aplikasi kita di lokal dan server sama. Kita akan gunakan [pip](https://pypi.python.org/pypi/pip), tools untuk menginstall dan me-manage python packages

    ~$ pip install Flask==0.10.1
    ~$ pip install Flask-SQLAlchemy==1.0
    ~$ pip install Flask-Login==0.2.7
    ~$ pip install Flask-WTF==0.9.2
    ~$ pip install psycopg2
    
Sampai disini, kita sudah mempunyai environment yang sempurna untuk memulai coding. Di lokal kita sudah mempunyai virtual environment, di server openshift kita juga sudah mempunyai environment yang sama seperti virtual environment di lokal kita. Yeayy!! Kita akan lebih bnyak bekerja di lokal. Jika di lokal sudah siap, tinggal kita deploy ke server

**Coding!!**

Seperti yang sudah saya katakan di part sebelumnya, bahwa dengan menggunakan Flask, kita sudah bisa membuat aplikasi web dengan hanya menggunakan satu file *.py,* dan kita akan mempraktekkannya sekarang. Kita hanya akan menggunakan sebuah file bernama *main.py* sebagai tempat seluruh kode aplikasi kita. Setelah aplikasi kita cukup kompleks, barulah kita akan memisahkannya ke dalam beberapa file. Pertanyaannya, dimana kita akan meletakkan file *main.py* ini? Tempatnya adalah di folder **wsgi**. Semua kode untuk aplikasi kita akan berada di folder ini. Berikut ini adalah bentuk kode flask yang paling simple 

    from flask import Flask
    application = Flask(__name__)
    if __name__ == '__main__':
      application.run(debug=True, host="0.0.0.0", port=8888)


Perhatikan kode diatas, pertama kita import dahulu class Flask dari *flask package*. Kemudian kita membuat object instance dari class *Flask*. Kita beri nama object instance ini dengan nama *'application'* agar sesuai dengan aturan dari Openshift. Dan jika kita menjalankan file ini *main.py* ini dari shell, maka berarti kita mengakses aplikasi flask ini di host address di 0.0.0.0 (localhost).

    ~$ python wsqi/main.py
    
Coba buka browser anda, dan arahkan ke *http://localhost:8888*. Apakah anda mendapat error seperti ini : *'The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.'*. Jika iya, tidak masalah. Karena kita memang belum menentukan setting **route** untuk aplikasi kita ini.

**Route** adalah sesuatu yang essensial bagi setiap web application. Route menandakan endpoint, dimana suatu kode dari aplikasi akan dijalankan jika user melakukan request ke suatu URL tertentu. Di aplikasi kita sekarang, kita belum menentukan route sama sekali, so lets start defining our first route

    from flask import Flask
    application = Flask(__name__)
    @application.route('/')
    def index():
      return "Hello World!"
    if __name__ == '__main__':
      application.run(debug=True, host="0.0.0.0", port=8888)

Buka browser anda sekali lagi dan refresh untuk melihat perubahannya. Jika tidak ada masalah, maka tampilan browser anda harusnya kurang lebih seperti ini

![Alt text](/images/first-route-flask.png)
    
Tapi kode kita belum sepenuhnya komplet. Kita harus memberi tahu Openshift bahwa kita mempunyai object application baru. Openshift menggunakan *wsgi/application* script untuk menjalankan aplikasi anda. So kita buat perubahan di file tersebut seperti dibawah ini

    #!/usr/bin/python
    import os
    virtenv = os.environ['OPENSHIFT_PYTHON_DIR'] + '/virtenv/'
    virtualenv = os.path.join(virtenv, 'bin/activate_this.py')
    try:
      execfile(virtualenv, dict(__file__=virtualenv))
    except IOError:
      pass
    from main import application
    
Bandingkan dengan kode script *wsgi/application* sebelumnya. Kita cuma menambah satu baris di akhir script. Yap, selesai! kita tinggal meng-commit dan me-push kode kita ini ke Openshift. Tapi sebelumnya, saya sarankan untuk meng-ignore beberapa file dan folder ke dalam git. Caranya yaitu dengan menggunakan file bernama **.gitignore**. Copy paste [kode ini](https://raw.github.com/github/gitignore/master/Python.gitignore) ke text editor anda, dan save dengan namana **.gitignore**, letakkan di root directory project anda (folder bio). Tambahkan kode berikut di bagian paling atas *.gitigonre*

    env/

Ini akan memastikan folder virtual environment beserta seluruh isinya di komputer lokal kita tidak di-push juga ke server Openshift. Setelah itu, baru kita commit dan push kode kita ini ke Openshift

    ~$ git add .
    ~$ git commit -m "adding routes and application object"
    ~$ git push
    
Done!! 

Kita telah berhasil mendeploy kode pertama kita ke Openshift. Next part, kita akan belajar bagaimana membuat view untuk aplikasi kita ini dengan menggunakan [Jinja](http://jinja.pocoo.org/) template engine. So, stay tune !!

Source : [http://pythonthusiast.pythonblogs.com](http://pythonthusiast.pythonblogs.com/230_pythonthusiast/archive/1308_building_python_flask_application_in_openshiftheroku_replacement_part_iii__application_scratch_and_creating_local_working_environment.html)