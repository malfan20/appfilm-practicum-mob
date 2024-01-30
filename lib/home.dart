import 'package:flutter/material.dart';
import 'package:flutter_application_1/pin2an.dart';
import 'package:flutter_application_1/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? nbi;
  String? nama;
  String? email;
  String? alamat;
  String? akun;

  void data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _nbi = prefs.getString('nbi');
    final String? _nama = prefs.getString('nama');
    final String? _email = prefs.getString('email');
    final String? _akun = prefs.getString('akun');
    final String? _alamat = prefs.getString('alamat');
    setState(() {
      nbi = _nbi;
      nama = _nama;
      email = _email;
      alamat = _alamat;
      akun = _akun;
    });
  }

  @override
  void initState() {
    super.initState();
    data();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Text(
              'PRAKTIKUM PAB 2023\n',
              style: TextStyle(fontFamily: "roboto", fontSize: 15.0),
            ),
            Text(
              "$nbi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            Image.asset(
              'assets/img/gmbrpab3.png',
              width: 200,
              height: 250,
            ),
            Text(
              "$nama",
              style: TextStyle(
                  fontFamily: "roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (build) {
                      return Pinbruh();
                    },
                  ),
                );
              },
              child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent),
                  child: Center(
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                          fontFamily: "BlackOpsOne-Regular",
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.remove('nbi');
                await prefs.remove('nama');
                await prefs.remove('email');
                await prefs.remove('alamat');
                await prefs.remove('akun');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (build) {
                      return RegisterPage();
                    },
                  ),
                );
              },
              child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent),
                  child: Center(
                    child: Text(
                      'Keluar',
                      style: TextStyle(
                          fontFamily: "BlackOpsOne-Regular",
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
