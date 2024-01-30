import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? nbi = prefs.getString('nbi');
      final String? nama = prefs.getString('nama');
      final String? email = prefs.getString('email');
      final String? alamat = prefs.getString('alamat');
      final String? akun = prefs.getString('akun');

      if (nbi != null &&
          nama != null &&
          email != null &&
          alamat != null &&
          akun != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (build) {
              return MyHomePage();
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (build) {
              return RegisterPage();
            },
          ),
        );
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3987B2),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/gmbrpab8.png'))),
            ),
            Text(
              'PRAKTIKUM PAB',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '2023',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "BlackOpsOne-Regular"),
            ),
          ],
        ),
      ),
    );
  }
}
