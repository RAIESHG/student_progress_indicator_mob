import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/database.dart';
import 'package:student_progress_indicator_mob/display_card.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

Database db = Database();
class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Profile Page")),
        ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
            future: db.fetchstudent(),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return (ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            DisplayCard(title:"${snapshot.data[index].studentname}",
                              upper: ["Class","Section","Email","PhoneNumber"],btn1title: "Proceed",
                              lower: ["${snapshot.data[index].classs}","${snapshot.data[index].section}",
                                "${snapshot.data[index].email}","${snapshot.data[index].phonenumber}"],),],
                        ),
                      );


                    }));
              }else{
                return CircularProgressIndicator();

              }
            }));
  }
}

