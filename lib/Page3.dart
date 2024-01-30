import 'package:flutter/material.dart';
import 'package:flutter_application_1/apidio.dart';

class Page3 extends StatefulWidget {
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  Future<List<dynamic>>? _data;
  @override
  void initState() {
    _data = dioapi().getdatas(); // TODO: implement initState
    super.initState();
  }

  bool ganti = false;
  @override
  Widget build(BuildContext context) {
    // List movie = [
    //   {
    //     "img": "assets/img/tbys2.jpg",
    //     "text":
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n"
    //   },
    //   {
    //     "img": "assets/img/tbys5.jpeg",
    //     "text":
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n"
    //   },
    //   {
    //     "img": "assets/img/tbys2.jpg",
    //     "text":
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n"
    //   },
    //   {
    //     "img": "assets/img/tbys5.jpeg",
    //     "text":
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n"
    //   },
    //   {
    //     "img": "assets/img/tbys2.jpg",
    //     "text":
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n"
    //   },
    //   {
    //     "img": "assets/img/tbys5.jpeg",
    //     "text":
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n"
    //   },
    //   {
    //     "img": "assets/img/tbys2.jpg",
    //     "text":
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n"
    //   },
    // ];
    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(backgroundColor: Colors.black),
        body: Center(
          child: Column(
            children: [
              FutureBuilder<List<dynamic>>(
                  future: _data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print('Ini data ${snapshot.data}');
                      return SizedBox(
                        width: 450,
                        height: 497,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListMovie(
                                img:
                                    'https://saiyaapi.site/${snapshot.data![index]["photo"]}',
                                desc: snapshot.data![index]["desc"]);
                          },
                        ),
                      );
                    } else {
                      print(snapshot.error);
                      return Center(child: CircularProgressIndicator());
                    }
                  })
            ],
          ),
        ));
  }

  Padding ListMovie({required img, required desc}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
            color: Colors.lightGreen, borderRadius: BorderRadius.circular(10)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.black,
                    //       blurRadius: 16,
                    //       offset: Offset(0, 0),
                    //       spreadRadius: 6)
                    // ],
                    image: DecorationImage(
                      image: NetworkImage(img),
                    )),
              ),
              InkWell(
                  onTap: () {},
                  splashColor: Colors.red,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        ganti = !ganti;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: !ganti ? Colors.blueAccent : Colors.white),
                      child: Center(
                          child: Text(
                        'Play',
                        style: TextStyle(
                            fontFamily: "serif",
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: !ganti ? Colors.white : Colors.blueAccent),
                      )),
                    ),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Text(
                  desc,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
              ),
            ]),
      ),
    );
  }
}
