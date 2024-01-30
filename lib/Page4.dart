import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

final Uri _url = Uri.parse('https://www.instagram.com/elphant20');

class _Page4State extends State<Page4> {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: "BlackOpsOne-Regular",
                color: Colors.red),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 150,
                  color: Colors.red,
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '$nama',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.vpn_key,
                        size: 20,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '$nbi',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.email_rounded,
                        size: 20,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '$email',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.location_city,
                        size: 20,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '$alamat',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: _launchUrl,
                          child: Text('$akun',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.logout_rounded,
                        size: 20,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (build) {
                                return MyHomePage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Keluar',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
