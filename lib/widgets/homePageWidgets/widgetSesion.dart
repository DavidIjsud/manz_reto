import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';

class WidgetSesion extends StatefulWidget {

  final String turno;
  final int calories;
  final bool credits;
  final String image;

  const WidgetSesion(  this.turno , this.calories , this.credits,  this.image  , { Key? key }) : super(key: key);

  @override
  _WidgetSesionState createState() => _WidgetSesionState();
}

class _WidgetSesionState extends State<WidgetSesion> {
  @override
  Widget build(BuildContext context) {

      final phoneSize = MediaQuery.of(context).size;

    return Container(
            width: phoneSize.width * 0.9,
            decoration: BoxDecoration(
                 border: Border.all(color:  Colores.borderColorManzanaVerde ),
                 borderRadius: BorderRadius.all( Radius.circular(20) ), 
                 color: Colores.cardSeasionColorManzanaVerde  
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 5, vertical: 20),
              child: ListTile(
                   title : Text( widget.turno  , style:  TextStyle( fontSize: 15 ) , ),
                   subtitle: Text(  widget.calories.toString()+"Kcal" , style:  TextStyle( fontSize: 10 ) ,  ),
                   trailing:  widget.credits ? Icon( Icons.check_circle , color: Colors.green , ) : Text("No tienes creditos")  ,
                   leading: Image.asset(  widget.image ),
              ),
            ),
    );
  }
}