import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'button.dart';
import 'login_window.dart';
import 'register_window.dart';
import 'chat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStateful(),
      routes: {
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        Chat.id:(context)=> Chat()
      },
    );
  }
}

class MyStateful extends StatefulWidget {
  @override
  _MyStatefulState createState() => _MyStatefulState();
}

class _MyStatefulState extends State<MyStateful>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 10), vsync: this, upperBound: 100);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcce4ff),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              fontFamily: 'Pacifico',
              color: Colors.black54,
              fontSize: 30,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Colors.black87,
            ),
            title: Text(
              'About',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stay_current_portrait, color: Colors.black87),
            title: Text(
              'More',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 170,
              child: Icon(
                Icons.chat,
                color: Colors.lightBlue,
                size: 130,
              ),
            ),
            Center(
              child: ColorizeAnimatedTextKit(
                text: ["Zoop ", "Chat"],
                textStyle: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                colors: [
                  Colors.purple,
                  Colors.blue,
                  Colors.purpleAccent,
                  Colors.lightBlue,
                  Colors.deepPurple
                ],
              ),
            ),
            RoundedButton(
              title: 'Log  In',
              b: BorderRadius.circular(30),
              ele: 20,
              colour: Color(0xFFd8c5e5),
              onPressed: () {
                Navigator.pushNamed(context, Login.id);
              },
            ),
            RoundedButton(
              ele: 17,
              b: BorderRadius.circular(20),
              title: 'Sign  In',
              colour: Color(0xFF2676ff),
              onPressed: () {
                Navigator.pushNamed(context, Register.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
