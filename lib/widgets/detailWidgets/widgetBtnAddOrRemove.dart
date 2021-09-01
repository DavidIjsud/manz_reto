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

    return GestureDetector(
      onTap: (){
          if( widget.fromMenu ){
                 _localDatabase.addNewFoodToRoutine( widget.foodDetail.data.nameFood ,  700 , widget.foodDetail.data.img , widget.day, widget.nroDay );  
                 return;
          }

          print("No es from meu");


      },
      child: Container(
                      width: phoneSize.width * 0.8,
                      height:  phoneSize.height * 0.07 ,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.all( Radius.circular(10) ),
                          color: widget.fromMenu ?  Colores.yellowColorManzanaVerde : Colors.red
                      ) ,
                      child:  widget.fromMenu ?
                        Center(child: Text("Agregar al pedido", style:  TextStyle( fontWeight: FontWeight.bold ) , )) : 
                        Center(child: Text("Eliminar Pedido" , style:  TextStyle( fontWeight: FontWeight.bold )  ))  ,
                  ),
    );
  }
}