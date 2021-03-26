import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/information_card.dart';
import 'package:student_progress_indicator_mob/View/main.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}
Database db = Database();
InformationCard ic= InformationCard();
List<Widget> information;
class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(child: Text("Profile")),
        ),
        backgroundColor:Colors.white,
        body: FutureBuilder(
            future: db.fetchstudent(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.data != null) {
                information=[ic.informationcontents("Email:",snapshot.data[0].email,"Phone: ",snapshot.data[0].phonenumber,Icons.email_outlined,Icons.phone,context),
                  SizedBox(height: size.height*0.03,),
                  ic.informationcontents("Class: ",snapshot.data[0].classs,"Section: ",snapshot.data[0].section,Icons.people,Icons.speaker_group_rounded,context),
                ]; return ic.informationcard(context, information,"${snapshot.data[0].studentname}");

  }
              else{
                return CircularProgressIndicator();
              }
}));}

Widget informationrow(String title,String message,IconData icon){
    return Expanded(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: Colors.deepPurpleAccent.withOpacity(0.8),
              size: size.height*0.02,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            SizedBox(
              width: size.width*0.1,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                width: size.width*0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("$title",style: TextStyle(fontSize: size.height*0.01,color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold),)),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("$message",style: TextStyle(color: Colors.black54),)),
                  ],
                ),
              ),
            ),
          ],),
      ),
    );
}
}

