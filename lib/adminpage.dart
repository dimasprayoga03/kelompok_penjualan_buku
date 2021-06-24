import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  AdminPage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $username"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Hallo Selamat Datang Di Penjualan Buku Kami, Anda Login Sebagai $username',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          Center(
            child: new Image.asset(
              "assets/images/buku_hacker.jpg",
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Buku Kitab Hacker',
            style: TextStyle(
              fontSize: 15,
              height: 2,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Rp 138.000',
            style: TextStyle(
              fontSize: 12,
              height: 2,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            child: Text("Beli"),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          Center(
            child: new Image.asset(
              "assets/images/buku_hki.jpg",
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Buku Hak Kekayaan Intelektual',
            style: TextStyle(
              fontSize: 15,
              height: 2,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Rp 146.000',
            style: TextStyle(
              fontSize: 12,
              height: 2,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            child: Text("Beli"),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            child: Text("Logout"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/main');
            },
          ),
        ],
      ),
    );
  }
}
