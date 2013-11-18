---
type: post
layout: post
title: Pengenalan Silex Part 3 - CRUD dengan Doctrine DBAL
date: 2013-10-30
author: glend
categories: PHP, Framework, Silex
---
[Doctrine DBAL](http://www.doctrine-project.org/projects/dbal.html) atau Database Access Layer adalah bagian dari project Doctrine ORM yang hanya menyediakan abstraksi ke database dengan memanfaatkan PDO. Tidak seperti induk project nya, yaitu Doctrine ORM yang menyediakan berbagai macam fitur dan memakai arsitektur yang canggih yaitu Data Mapper, Doctrine DBAL lebih simple dan menyediakan hanya beberapa fungsionalitas dasar operasi database seperti database retrieval & manipulation dengan memanfaatkan PDO, plus beberapa fitur tambahan seperti Query Builder untuk mempermudah kita menulis Query SQL.

Kita akan menggunakan DBAL yang sederhana ini untuk membuat aplikasi CRUD sederhana. Kita sudah membuat beberapa routing dan sekarang saatnya kita menulis code untuk menghandle masing-masing routing yang telah kita buat sebelumnya..

[more]

**Get All Users**

Kita akan menulis query untuk me-retrieve seluruh data user yang ada di database. Hasil query tersebut kita inject-an ke variable **$app**. Mekanisme detail tentang bagaimana kita bisa menginject-kan suatu value atau object ke variable **$app** ini akan kita bahas di artikel berikutnya

    $app->get('/users', function(Request $request) use($app) {
        $app['users'] = $app['db']->fetchAll('SELECT * FROM user');
        return $app['twig']->render('users/index.tpl', $app['data']);
    });

Kita memanfaatkan method **fetchAll** yang terdapat pada Dbal dan mengisinya dengan query untuk meretrieve semua record dari table *user*. Perintah *fetchAll* dipanggil melalui **$app['db']** yang otomatis tersedia ketika me-register DBAL (lihat Part 2). Ini yang dinamakan **Service Provider** yang akan kita bahas di part berikutnya. Untuk sekarang, kita cukup tahu bahwa untuk menggunakan method2 dari DBAL, kita dapat memanggilnya via **$app['db']**

Selain itu, kita juga memanggil Twig untuk merender view yaitu **index.tpl**. Ini juga menggunakan service provider

**New User**

Di routing ini, kita hanya akan merender form untuk memasukkan data user. Form yang akan kita gunakan adalah **new.tpl**

    $app->get('/user/new', function(Request $request) use($app) {
        $app['form_title'] = 'New User';
        $app['form_action'] = '/users';
        $app['form'] = array(
            'nama' => '',
            'gender' => '',
            'email' => '',
            'telepon' => '',
            'alamat' => ''
        );
        return $app['twig']->render('user/new.tpl', $app['data']);
    });
    
**Save User**

Kita akan simpan data user di routing ini

    $app->post('/admin/users', function(Request $request) use($app) {
        $app['db']->insert('user', array(
            'nama' => $request->request->get('nama'),
            'gender' => $request->request->get('gender'),
            'email' => $request->request->get('email'),
            'telepon' => $request->request->get('telepon'),
            'alamat' => $request->request->get('alamat')
            );
        return $app->redirect('//users');
    });
    
Terlihat diatas, setelah kita simpan dengan menggunakan method dari Dbal yaitu **insert**, kita redirect ke halaman list users

**Show User**

Routing untuk ini akan me-retrieve data user dengan suatu ID dan menampilkan data user tersebut

    $app->get('/user/{id}/edit', function(Request $request, $id) use($app) {
        $app['user'] = $app['db']->fetchAssoc('SELECT * FROM user where id = ?', array($id));
        return $app['twig']->render('user/show.tpl', $app['data']);
    });
    
**Edit User**

Routing untuk edit user akan me-retrieve data user dengan ID tertentu dan menampilkannya ke dalam form agar bisa diedit

    $app->get('/user/{id}/edit', function(Request $request, $id) use($app) {
        $user = $app['db']->fetchAssoc('SELECT * FROM user where id = ?', array($id));
        $app['form_title'] = 'Edit User';
        $app['form_action'] = '/user/' . $id;
        $app['form'] = array(
            'nama' => $user['nama'],
            'gender' => $$user['gender'],
            'email' => $user['email'],
            'telepon' => $user['telepon'],
            'alamat' => $user['alamat'],
            );
        return $app['twig']->render('user/edit.tpl', $app['data']);
    });

**Update User**

Update user akan mengupdate data user dengan data yang telah diinput didalam form edit, kemudian meredirect routing ke halaman list user

    $app->post('/user/{id}', function(Request $request, $id) use($app) {
        $app['db']->update('user', array(
            'nama' => $request->request->get('nama'),
            'gender' => $request->request->get('gender'),
            'email' => $request->request->get('email'),
            'telepon' => $request->request->get('telepon'),
            'alamat' => $request->request->get('alamat')
            ), array('id' => $id));
        return $app->redirect('/users');
    });
    
**Delete User**

Delete user akan menghapus record user dengan ID tertentu kemudian akan meredirect ke halaman list user

    $app->get('/user/{id}/delete', function(Request $request, $id) use($app) {
        $app['db']->delete('user', array('id' => $id));
        return $app->redirect('/users');
    });
    
Yap, itulah isi routing untuk aplikasi restful sederhana untuk memanage data user. Part berikutnya kita akan mensetup view untuk operasi CRUD diatas dengan menggunakan Twig Template Engine