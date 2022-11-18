import 'package:diary_chat/widgets/profile_drawer.dart';
import 'package:diary_chat/screens/screens.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:diary_chat/screens/bookshelf.dart';

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,

        //Background
        body: Container(
          child: Stack(
            children: <Widget>[
              //background gradation feature
              Positioned(
                  top: 0,
                  left: 20,
                  child: Transform.scale(
                    scaleY: -1,
                    child: SvgPicture.asset('assets/icons/vector12.svg'),
                  )),
              //profile picture button that can open the drawer
              Positioned(
                top: 35,
                left: 17,
                child: IconButton(
                    icon: SvgPicture.asset("assets/icons/profile_picture.svg"),
                    iconSize: 49,
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    }),
              ),
              Positioned(
                top: 100,
                left: 97,
                bottom: 10,
                right: 97,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Top prompt: Hello I am Manito.
                    Container(
                      child: Text(
                        "Hello,\n I am Manito.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF535353),
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              height: 1.1),
                        ),
                      ),
                    ),
                    //Manito image at the center
                    Container(
                      child: Image.asset("assets/images/Manito.png",
                          height: 201, width: 201),
                    ),
                    //Middle prompt: I am here to listen to you?
                    Container(
                      child: Text(
                        "I am here to listen to you!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            height: 0.8333333333333334,
                          ),
                        ),
                      ),
                      //'What can I interest you in\n today ? ',
                      //textAlign: TextAlign.center,
                      //style: TextStyle(

                      //),
                    ),
                    //"Let's Chat" Button leads user to the chat room (chat_screen.dart)
                    Container(
                      width: 192,
                      height: 63,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen()));
                          },
                          //FIX THIS
                          style: ButtonStyle(),
                          child: Text(
                            'Let\'s talk',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )),
                    ),
                    //Bottom prompt: Or say "Hey, Manito!"
                    Container(
                      child: Text(
                        "Or say “Hey, Manito!”",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            height: 0.8333333333333334,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        drawer: Profile_Drawer(),

        //Bottom Navigation Bar which connects to diary page and reminder page
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          elevation: 0,
          backgroundColor: Color(0xFFF5F5F5), //rgba(183, 182, 241, 0.03)
          selectedItemColor: Color(0xFFEDA981),
          unselectedItemColor: Color(0xFFBBBBC0),
          showUnselectedLabels: false,
          unselectedFontSize: 0,
          showSelectedLabels: false,
          selectedFontSize: 0,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: new SvgPicture.asset(
                "assets/icons/diary_icon.svg",
              ),
              label: ("diary"),
            ),
            BottomNavigationBarItem(
              icon: new SvgPicture.asset("assets/icons/reminder_icon.svg"),
              label: ("reminder"),
            ),
          ],
        ),
      ),
    );
  }
}
