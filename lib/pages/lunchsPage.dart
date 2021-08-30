import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/blocs/lunchsPageBloc.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/lunchs.dart';
import 'package:manzana_verde_reto/providers/http_requests.dart';
import 'package:manzana_verde_reto/widgets/lunchsWidgets/foodElement.dart';
import 'package:manzana_verde_reto/widgets/lunchsWidgets/widgetHeader.dart';

class LunchsPage extends StatefulWidget {

  final String day;
   final int nro;

  const LunchsPage( this.day , this.nro  ,{ Key? key }) : super(key: key);

  @override
  _LunchsPageState createState() => _LunchsPageState();
}

class _LunchsPageState extends State<LunchsPage> {


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
              children: [
                WidgetHeaderLunch( widget.day ,  widget.nro ),
                Expanded(
                  child:WidgetFoodElement( widget.day , widget.nro ) ,
                )
              ],
          ),
        ),
    ); 
  }
}