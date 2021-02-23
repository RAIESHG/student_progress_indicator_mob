import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatePick extends StatefulWidget {
  @override
  _DatePickState createState() => _DatePickState();
}
TextEditingController choosedateController = TextEditingController();

class _DatePickState extends State<DatePick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FlatButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2018, 3, 5),
                    maxTime: DateTime(2019, 6, 7),
                    theme: DatePickerTheme(
                        headerColor: Colors.orange,
                        backgroundColor: Colors.blue,
                        itemStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
                    onChanged: (date) {
                      print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                    }, onConfirm: (date) {
                      print('confirm $date');
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Text(
                'show date picker(custom theme &date time range)',
                style: TextStyle(color: Colors.blue),
              )),],
      ),
    );
  }
}
