import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduapp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;

  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection("users").snapshots();

  final Stream<QuerySnapshot> news =
      FirebaseFirestore.instance.collection("news").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/background.jpg"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: " SCIENCE",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Chamath Dissanayake",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "GCE - Ordinary Level (Grade 10)",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(true),
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Notice",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.textColor1),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              height: 2,
                              width: 55,
                              color: Colors.orange,
                            )
                          ],
                        ),
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(false),
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text("Chamath Dissanayake"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: users,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  final data = snapshot.requireData;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Text("${data.docs[0]['name']} ",
                          style: TextStyle(color: Colors.red, fontSize: 17));
                    },
                  );
                },
              ),
            ),
          ),
          Container(
            child: ImageSlideshow(
              /// Width of the [ImageSlideshow].
              width: double.infinity,

              /// Height of the [ImageSlideshow].
              height: 200,

              /// The page to show when first creating the [ImageSlideshow].
              initialPage: 0,

              /// The color to paint the indicator.
              indicatorColor: Colors.blue,

              /// The color to paint behind th indicator.
              indicatorBackgroundColor: Colors.grey,

              /// The widgets to display in the [ImageSlideshow].
              /// Add the sample image file into the images folder
              children: [
                Image.network(
                  'https://raw.githubusercontent.com/Thilina1/AppImages/main/announcement/ann1.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://raw.githubusercontent.com/Thilina1/AppImages/main/announcement/ann2.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://raw.githubusercontent.com/Thilina1/AppImages/main/announcement/ann3.jpg',
                  fit: BoxFit.cover,
                ),
              ],

              /// Called whenever the page in the center of the viewport changes.
              onPageChanged: (value) {
                print('Page changed: $value');
              },

              /// Auto scroll interval.
              /// Do not auto scroll with null or 0.
              autoPlayInterval: 4000,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: news,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  final data = snapshot.requireData;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Text("${data.docs[0]['name']} ",
                          style: TextStyle(color: Colors.red, fontSize: 17));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 555 : 430,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 70,
          width: 70,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 8,
                  )
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              : Center(),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}
