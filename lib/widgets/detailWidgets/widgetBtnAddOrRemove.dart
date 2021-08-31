import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/database_simulation/database.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/foodDetail.dart';

class WidgetBtnAddOrRemove extends StatefulWidget {

  final bool fromMenu;
  final FoodDetail foodDetail;
  final String day;
  final int nroDay;

  const WidgetBtnAddOrRemove(   this.nroDay ,this.day ,this.foodDetail  ,this.fromMenu ,{ Key? key }) : super(key: key);

  @override
  _WidgetBtnAddOrRemoveState createState() => _WidgetBtnAddOrRemoveState();
}

class _WidgetBtnAddOrRemoveState extends State<WidgetBtnAddOrRemove> {


  Database _localDatabase = Database();

  @override
  Widget build(BuildContext context) {

    final phoneSize = MediaQuery.of(context).size;

    return Container(
                    width: phoneSize.width * 0.8,
                    height:  phoneSize.height * 0.07 ,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all( Radius.circular(10) ),
                        color: widget.fromMenu ?  Colores.yellowColorManzanaVerde : Colors.red
                    ) ,
                    child:  widget.fromMenu ?
                      Center(child: Text("Agregar al pedido", style:  TextStyle( fontWeight: FontWeight.bold ) , )) : 
                      GestureDetector(
                        onTap: (){
                               _localDatabase.addNewFoodToRoutine("nameFood", 1, "img");
                        },
                        child: Center(child: Text("Eliminar Pedido" , style:  TextStyle( fontWeight: FontWeight.bold )  )))  ,
                );
  }
}