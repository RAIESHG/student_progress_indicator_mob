import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_flutter/responsive_flutter.dart';


class TextS extends StatefulWidget {
  @override
  final String text;
  final double size;
  final Color color;

  const TextS({Key key, this.text, this.size, this.color}) : super(key: key);
  _TextSState createState() => _TextSState();
}

class _TextSState extends State<TextS> {
  @override
  Widget build(BuildContext context) {
    return Text("${widget.text}",style: GoogleFonts.laila(fontSize: ResponsiveFlutter.of(context).fontSize(widget.size),color:widget.color ),);
  }
}
