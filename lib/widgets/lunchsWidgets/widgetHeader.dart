import 'package:flutter/material.dart';

class WidgetHeaderLunch extends StatefulWidget {

  final String day;
  final int nro;

  const WidgetHeaderLunch( this.day , this.nro ,{ Key? key }) : super(key: key);

  @override
  _WidgetHeaderLunchState createState() => _WidgetHeaderLunchState();
}

class _WidgetHeaderLunchState extends State<WidgetHeaderLunch> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric( horizontal: 10 ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 GestureDetector(
                   onTap: (){
                       Navigator.of(context).pop();
                   },
                   child: Text("Atras", style:  TextStyle( decoration:  TextDecoration.underline   ) , )),
                 Text("Almuerzo",  style: TextStyle( fontSize:  20  )  ,  ),
                 Column(
                    children: [
                        Text( widget.day ),
                        Text( widget.nro.toString() , style:  TextStyle( fontSize: 18 ) ,   ),
                    ],
                 )
            ],
        ),
      ),
    );
  }
}