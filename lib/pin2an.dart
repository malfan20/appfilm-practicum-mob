import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottombar.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Pinbruh extends StatefulWidget {
  const Pinbruh({super.key});

  @override
  State<Pinbruh> createState() => _PinbruhState();
}

class _PinbruhState extends State<Pinbruh> {
  String inputan = '';
  String pin = '2023';
  TextEditingController pinController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter Your PIN',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please enter your pin that you have been created',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Text(
              'created',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.lock_outline_rounded,
              size: 40,
              color: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    inputan = value;
                  });
                },
                decoration: InputDecoration(
                    fillColor: Colors.green,
                    labelText: '\t\t\t\t\t\tMasukkan PIN',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.green, width: 2))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                if (inputan == pin) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (build) {
                        return Bottombar();
                      },
                    ),
                  );
                } else {
                  showAlertDialog(context);
                }
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue),
                child: Center(
                  child: Icon(
                    Icons.lock_open_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'PIN Salah',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          content: Text(
            'Masukkan PIN yang Benar!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
