import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';

class WidgetBtnAddOrRemove extends StatefulWidget {

  final bool fromMenu;

  const WidgetBtnAddOrRemove( this.fromMenu ,{ Key? key }) : super(key: key);

  @override
  _WidgetBtnAddOrRemoveState createState() => _WidgetBtnAddOrRemoveState();
}

class _WidgetBtnAddOrRemoveState extends State<WidgetBtnAddOrRemove> {
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
                      Center(child: Text("Eliminar Pedido" , style:  TextStyle( fontWeight: FontWeight.bold )  ))  ,
                );
  }
}