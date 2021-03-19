import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/Controller/database.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/information_card.dart';



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
          title: Center(child: Text("View Profile")),
        ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
            future: db.fetchstudent(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.data != null) {
                return (ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {

                      information=[ic.informationcontents("Name:"+snapshot.data[index].studentname,"Class: "+snapshot.data[index].classs),
                        ic.informationcontents("Section:"+snapshot.data[index].section,"Email: "+snapshot.data[index].email), ic.informationcontents("Phonenumber:"+snapshot.data[index].phonenumber,"")
                       ];
                      return ic.informationcard(context,information);
                    }));
              }else{
                return CircularProgressIndicator();
              }
            }));
  }
}

