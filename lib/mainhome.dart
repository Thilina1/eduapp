import 'package:eduapp/home.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:eduapp/login.dart';
import 'package:eduapp/screen/login_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home2.dart';

class Mainhome extends StatelessWidget {
  Mainhome({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> subject =
      FirebaseFirestore.instance.collection("subject").snapshots();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'EDU-App',
              style: TextStyle(fontSize: 20.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text('Announcement'),
                      ),
                      Tab(
                        child: Text('Topics'),
                      ),
                      Tab(
                        child: Text('About'),
                      ),
                    ]),
                preferredSize: Size.fromHeight(30.0)),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 19.0),
                child: new IconButton(
                  icon: new Icon(Icons.logout),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LOGIN()),
                    );
                  },
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              MaterialApp(
                debugShowCheckedModeBanner: false,
                home: HomeScreen(),
              ),
              Container(
                child: Center(
                  child: Container(
                    child: ListView(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.arrow_drop_down_circle),
                                title: const Text('Topic 1'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '1.ජීවයේ රසායනික පදනම',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp1()),
                                      );
                                    },
                                    child: const Text('Attend Class'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('View PDF'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Quiz'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.arrow_drop_down_circle),
                                title: const Text('Topic 2'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '2.සරල රේඛීය චලිතය',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Attend Class'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('View PDF'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Quiz'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.arrow_drop_down_circle),
                                title: const Text('Topic 3'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '3.පදාර්ථයේ ව්‍යුහය',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Attend Class'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('View PDF'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Quiz'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.arrow_drop_down_circle),
                                title: const Text('Topic 4'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '4.චලිතය පිළිබඳ නිව්ටන් නියම',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Attend Class'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('View PDF'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Quiz'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.arrow_drop_down_circle),
                                title: const Text('Topic 5'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '5.ඝර්ෂණය',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Attend Class'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('View PDF'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Quiz'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.arrow_drop_down_circle),
                                title: const Text('Topic 6'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '2.සරල රේඛීය චලිතය',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Attend Class'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.arrow_drop_down_circle),
                                title: const Text('Topic 7'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '2.සරල රේඛීය චලිතය',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()),
                                      );
                                    },
                                    child: const Text('Attend Class'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 70, 0, 10),
                          child: Center(
                            child: Text(
                              "About Teacher",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          )),
                      Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://raw.githubusercontent.com/Thilina1/AppImages/main/Profile/profile.jpg")))),
                      Center(
                        child: Text(
                          "Mr Admin",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "BSC(uoc)",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                          child: Center(
                            child: Text(
                              "Developed by",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          )),
                      Container(
                          child: Center(
                        child: Text(
                          "NOON Labs",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
