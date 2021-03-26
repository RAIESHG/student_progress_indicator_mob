import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class DisplayCard extends StatefulWidget {
  @override

  final List<String> upper;
  final List<String> lower;
  final btn1onPressed;
  final String btn1title;
  final btn2onPressed;
  final String btn2title;
  final String title;
  final String imageurl;


  const DisplayCard({Key key, this.upper, this.lower, this.btn1onPressed, this.btn1title, this.title, this.imageurl, this.btn2onPressed, this.btn2title}) : super(key: key);
  _DisplayCardState createState() => _DisplayCardState();
}


class _DisplayCardState extends State<DisplayCard> {
  @override
  Widget build(BuildContext context) {
    List<Widget> text=[ Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Text("${widget.title}",style: TextStyle(color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.bold,fontSize: ResponsiveFlutter.of(context).fontSize(2)),),
      ),
    ),
    ] ;
    var up = widget.upper.length;
    double cardheight = widget.upper.length.toDouble()*1.2/10;
    print(widget.upper.length);
    for(var i=0;i<up-1;i=i+2){
      text.add(Expanded(
          flex: 2,
          child: textColumn(widget.upper[i],widget.lower[i],widget.upper[i+1],widget.lower[i+1])));
    }
    if(widget.btn2title!=null){
      text.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(

              onPressed: widget.btn2onPressed, child: Text("${widget.btn2title}",style: TextStyle(color: Colors.white,fontSize: ResponsiveFlutter.of(context).fontSize(1.8)),),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(

              onPressed: widget.btn1onPressed, child: Text("${widget.btn1title}",style: TextStyle(color: Colors.white,fontSize: ResponsiveFlutter.of(context).fontSize(1.8)),),),
          ),
        ],
      ));
    }
    else{
      text.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: widget.btn1onPressed, child: Text("${widget.btn1title}",style: TextStyle(color: Colors.white,fontSize: ResponsiveFlutter.of(context).fontSize(1.8)),),),
      ));}
    return Padding(
      padding:  EdgeInsets.fromLTRB(30,20,30,20),
      child: Container(
        height: MediaQuery.of(context).size.height*cardheight,
        decoration: BoxDecoration( color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1.3,color:Colors.purple),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child:Column(
          children:text,
        ),
      ),
    );

  }
  Text uppertextstyle(String name){
    return Text("$name");
  }
  Text lowertextstyle(String text){
    return  Text("$text");}
  Row textColumn(String uppertext1, String lowertext1 , String uppertext2, String lowertext2){
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              uppertextstyle("$uppertext1",),
              Expanded(child: lowertextstyle("$lowertext1")),
            ],
          ),
        ),
        Expanded(
          child: Column(

            children: [
              uppertextstyle("$uppertext2"),
              Expanded(child: lowertextstyle("$lowertext2")),
            ],
          ),
        ),
      ],
    );
  }
}
