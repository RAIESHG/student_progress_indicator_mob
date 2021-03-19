import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:student_progress_indicator_mob/View/daily_activity.dart';
import 'package:student_progress_indicator_mob/View/view_assignment.dart';
import 'package:student_progress_indicator_mob/View/view_result.dart';
import 'package:lottie/lottie.dart';
class DatePick extends StatefulWidget {
  final String choosen;

  const DatePick({Key key, this.choosen}) : super(key: key);
  @override
  _DatePickState createState() => _DatePickState();
}
TextEditingController choosedateController = TextEditingController();

class _DatePickState extends State<DatePick> {
  @override


  Widget build(BuildContext context) {
    String dates;
    return Scaffold(
      appBar: AppBar(title:Text("Choose Date"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Lottie.network(
                'https://assets10.lottiefiles.com/temporary_files/PH5YkW.json'),

            ElevatedButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,

                      theme: DatePickerTheme(
                          headerColor: Colors.white,
                            backgroundColor: Colors.white,
                          itemStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
                          doneStyle: TextStyle(color: Colors.blue, fontSize: 16)),
                    onConfirm: (date) {
                    dates='${date.year}-${date.month}-${date.day}';
                    if(widget.choosen=="assignment"){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewAssignment(date: dates,)),
                      );
                    }
                    else if(widget.choosen=="activity"){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DailyActivity(date: dates,)),
                      );
                    }
                    else if(widget.choosen=="result"){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewResult(date: dates,)),
                      );
                    }

                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Text(
                  'Tap to Select Date',
                  style: TextStyle(color: Colors.white),
                )),


          ],
        ),
      ),
    );
  }
}
