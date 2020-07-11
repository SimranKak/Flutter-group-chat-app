import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'newbutton.dart';
import 'button.dart';
import 'chat.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  static const String id = 'register_window';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool spin = false;
  bool ispressed = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFEAADEA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6CCDA),
        title: Center(
          child: Text(
            '~ Registration ~',
            style: TextStyle(
              fontFamily: 'Pacifico',
              color: Colors.black54,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spin,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(top: 70),
                  width: 10,
                  child: IconButton(
                    icon: Icon(
                      Icons.lightbulb_outline,
                      color: (ispressed) ? Colors.amber : Colors.black54,
                      size: 130,
                    ),
                    onPressed: () {
                      setState(() {
                        if (ispressed == false)
                          ispressed = true;
                        else
                          ispressed = false;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 190.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: key.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: key.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 27,
              ),
              RoundedButton(
                ele: 17,
                b: BorderRadius.circular(20),
                title: 'Register',
                colour: Color(0xFF008B8B),
                onPressed: () async {
                  setState(() {
                    spin = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, Chat.id);
                    }
                    setState(() {
                      spin = false;
                    });
                  } catch (e) {
                    setState(() {
                      spin = false;
                    });
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
