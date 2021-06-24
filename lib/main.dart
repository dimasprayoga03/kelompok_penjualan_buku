import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kelompok_penjualan_buku/adminpage.dart';

void main() => runApp(new MyApp());

String username = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selamat Datang Di Aplikasi Penjualan Buku Kami',
      home: new MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: <String, WidgetBuilder>{
        '/adminpage': (BuildContext context) => new AdminPage(
              username: username,
            )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _proseslogin() async {
    final response =
        await http.post("http://127.0.0.1/api_buku/proses_login.php", body: {
      "username": user.text,
      "password": pass.text,
    });
    var dataadmin = json.decode(response.body);

    if (dataadmin.length == 1) {
      Navigator.pushReplacementNamed(context, '/adminpage');
      setState(() {
        username = dataadmin[0]['username'];
      });
    } else {
      setState(() {
        msg = "Login Gagal, Silahkan Cek Username & Password";
      });
    }
    return dataadmin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: new Image.asset(
                  "assets/images/social-media.jpg",
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Silahkan Login",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Text(
                "Username",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: user,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Text(
                "Password",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  _proseslogin();
                },
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 15.0, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
