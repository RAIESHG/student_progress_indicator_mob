import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/message_box.dart';
import 'package:student_progress_indicator_mob/View/dashboard.dart';
import 'main.dart';



class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Database db = new Database();
  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );


  @override
  Widget build(BuildContext context) {
    MessageBox mb = new MessageBox();

    return Scaffold(
        appBar: AppBar(title: Text("Log In"),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: 'Username'
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
              ),
              ElevatedButton(
                  onPressed: () async {



                    var username = _usernameController.text;
                    var password = _passwordController.text;

                    if(username.length<4 || password.length<8){
                      mb.Display(context, "Error", "Wrong Email/Password", Colors.red);

                    }
                    else{
                      var jwt = await db.attemptLogIn(username, password);

                    if(jwt==200){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );

                    }
                    else if(jwt==401){
                      mb.Display(context, "Error", "Wrong Email/Password", Colors.red);
                    }

                    else{
                      mb.Display(context, "Error", "Login Failure", Colors.red);
                    }}

                  },
                  child: Text("Log In")
              ),

            ],
          ),
        )
    );
  }
}