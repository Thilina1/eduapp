import 'package:flutter/material.dart';

import './landscape_player/landscape_player.dart';

import 'default_player/default_player.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(246, 245, 250, 1),
        body: SafeArea(child: HomeContent()),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<Map<String, dynamic>> samples = [
    {'name': 'Player', 'widget': DefaultPlayer()},
  ];

  int selectedIndex = 0;

  changeSample(int index) {
    if (samples[index]['widget'] is LandscapePlayer) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LandscapePlayer(),
      ));
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: samples[selectedIndex]['widget'],
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: samples.asMap().keys.map((index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      changeSample(index);
                    },
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          samples.asMap()[index]?['name'],
                          style: TextStyle(
                            color: index == selectedIndex
                                ? Color.fromRGBO(100, 109, 236, 1)
                                : Color.fromRGBO(173, 176, 183, 1),
                            fontWeight:
                                index == selectedIndex ? FontWeight.bold : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList()),
        ),
      ],
    );
  }
}
