import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();
  TextEditingController nbiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController akunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/img/gmbrpab5.png',
                scale: 6,
              ),
              Center(
                  child: Text(
                'WELCOME',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
              Center(
                  child: Text(
                'Praktikum PAB 2023',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
              textFieldCustom('Masukkan NBI', nbiController),
              textFieldCustom('Masukkan Nama', namaController),
              textFieldCustom('Masukkan email', emailController),
              textFieldCustom('Masukkan Alamat', alamatController),
              textFieldCustom('Masukkan Akun Instagram', akunController),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('nbi', nbiController.text);
                      await prefs.setString('nama', namaController.text);
                      await prefs.setString('email', emailController.text);
                      await prefs.setString('alamat', alamatController.text);
                      await prefs.setString('akun', akunController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (build) {
                            return MyHomePage();
                          },
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Text('Daftar'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding textFieldCustom(ttl, ctrl) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ttl,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 300,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: ctrl,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Input Tidak Bisa Kosong';
                }
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.green, width: 2))),
            ),
          )
        ],
      ),
    );
  }
}
