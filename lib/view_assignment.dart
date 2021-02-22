import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/database.dart';

class ViewAssignment extends StatefulWidget {
  @override
  _ViewAssignmentState createState() => _ViewAssignmentState();
}
Database db = Database();
class _ViewAssignmentState extends State<ViewAssignment> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text("View Assignment")),
      ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
            future: db.fetchAssignment("2020-05-08"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return (ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Text(snapshot.data[index].subject),
                            Text(snapshot.data[index].assignment),
                            Text(snapshot.data[index].assigndate),
                            Text(snapshot.data[index].duedate),




                          ],
                        ),
                      );


                    }));
              }else{
                return CircularProgressIndicator();

              }
            }));
  }
}

