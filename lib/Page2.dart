import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page3.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Video Prime',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            InkWell(
                onTap: () {},
                splashColor: Colors.red,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (build) {
                          return Page3();
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: ClipOval(
                        child: Image.asset(
                      'assets/img/tbys.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )),
                  ),
                )),
            Container(
              margin: EdgeInsets.all(10),
              child: ClipOval(
                  child: Image.asset(
                'assets/img/tbys3.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ClipOval(
                  child: Image.asset(
                'assets/img/tbys.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ClipOval(
                  child: Image.asset(
                'assets/img/tbys3.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ClipOval(
                  child: Image.asset(
                'assets/img/tbys.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ClipOval(
                  child: Image.asset(
                'assets/img/tbys3.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )),
            ),
          ],
        ));
  }
}
