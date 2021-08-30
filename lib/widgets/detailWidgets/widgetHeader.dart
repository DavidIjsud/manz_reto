import 'package:flutter/material.dart';

class WidgetHeaderDetail extends StatefulWidget {
  const WidgetHeaderDetail({ Key? key }) : super(key: key);

  @override
  _WidgetHeaderDetailState createState() => _WidgetHeaderDetailState();
}

class _WidgetHeaderDetailState extends State<WidgetHeaderDetail> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric( horizontal: 10 , vertical: 10 ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 GestureDetector(
                   onTap: (){
                       Navigator.of(context).pop();
                   },
                   child: Text("Atras", style:  TextStyle( decoration:  TextDecoration.underline   ) , )),
                 Text("Almuerzo",  style: TextStyle( fontSize:  20  )  ,  ),
                 Icon( Icons.hearing_outlined )
            ],
        ),
      ),
    );
  }
}