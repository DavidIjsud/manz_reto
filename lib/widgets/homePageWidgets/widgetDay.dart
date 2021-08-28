import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';

class WidgetDay extends StatefulWidget {

   final String day;
   final int number;

  const WidgetDay( this.day ,    this.number  , { Key? key   }) : super(key: key);

  @override
  _WidgetDayState createState() => _WidgetDayState();
}

class _WidgetDayState extends State<WidgetDay> {
  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return Container(
          width: phoneSize.width * 0.15,
          height: phoneSize.width * 0.15,
          decoration: BoxDecoration(
              color: Colores.yellowColorManzanaVerde,
              borderRadius: BorderRadius.all( Radius.circular(10) )
          ),
          child:  Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                     Text("Lun"),
                     Text( "27" , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 20  ),  ),
                     Container(
                          width: 25,
                          height: 3,
                          color: Colors.green,
                     )
               ],
          ) ,
    );
  }
}