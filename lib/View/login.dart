
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lottie/lottie.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/message_box.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/textstyling.dart';
import 'package:student_progress_indicator_mob/View/dashboard.dart';
import 'package:student_progress_indicator_mob/main.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {


  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String email = '';
  String password = '';
  String error = '';
  String b = "";
  Color purcolor = Colors.deepPurpleAccent;
  Database db = new Database();
  MessageBox mb = new MessageBox();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Container(
            height: size.height*1,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0,size.height*0.1,0,0),
                  child: TextS(
                   text:"Student Progress Indicator",size:3,color:Colors.deepPurple
                    ),
                ),


                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Lottie.asset("assets/students.json"))
                ),

                Expanded(
                  flex: 3,
                  child: Container(
                    height: size.height*0.5,
                    width: size.width*0.9,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Expanded(
                            flex: 2,
                            child: TextFormField(

                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: purcolor,
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  fillColor: Colors.white,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: purcolor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 6.0)),
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextFormField(

                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: purcolor,
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(),
                                  fillColor: Colors.white,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: purcolor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 16.0)),
                              obscureText: true,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                          ),

                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: RaisedButton(

                                color: purcolor,
                                onPressed: () async {
                                  FocusScope.of(context).unfocus();
                                  if (_formKey.currentState.validate()) {
                                    if (email.isEmpty || password.isEmpty) {
                                      mb.Display(
                                          context,
                                          "Email/Password Required!",
                                          "Please Enter Your Email/Password",
                                          Colors.red);
                                    } else {
                                      print("hi");

                                      var jwt =
                                          await db.attemptLogIn(email, password);



                                      if (jwt == 200) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Dashboard()),
                                        );
                                        mb.Display(context, "Login Successful",
                                            "Welcome", Colors.deepPurpleAccent);
                                      } else if (jwt == 401) {
                                        mb.Display(context, "Error",
                                            "Wrong Email/Password", Colors.red);
                                      } else {
                                        mb.Display(context, "Error",
                                            "Login Failure", Colors.red);
                                      }
                                    }
                                  }
                                },
                                elevation: 11,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                child: AutoSizeText("Login",
                                   ),
                              ),
                            ),
                          ),


                          Expanded(
                            flex: 3,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
