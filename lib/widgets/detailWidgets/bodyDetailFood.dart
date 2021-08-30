import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/foodDetail.dart';
import 'package:manzana_verde_reto/pages/pictureFoodPage.dart';
import 'package:manzana_verde_reto/widgets/detailWidgets/widgetBtnAddOrRemove.dart';
import 'package:manzana_verde_reto/widgets/detailWidgets/widgetCheckeds.dart';
import 'package:manzana_verde_reto/widgets/detailWidgets/widgetImageDetail.dart';
import 'package:manzana_verde_reto/widgets/detailWidgets/widgetNutrition.dart';
import 'package:manzana_verde_reto/widgets/detailWidgets/widgetSalads.dart';
import 'package:manzana_verde_reto/widgets/detailWidgets/widgetTags.dart';

class WidgetBodyDetail extends StatefulWidget {

  final FoodDetail foodDetail;

  final bool fromMenu;

  const WidgetBodyDetail( this.fromMenu ,this.foodDetail  ,{ Key? key }) : super(key: key);

  @override
  _WidgetBodyDetailState createState() => _WidgetBodyDetailState();
}

class _WidgetBodyDetailState extends State<WidgetBodyDetail> {
  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 15 ),
      child: ListView(
           shrinkWrap: true,
           children: [
                 WidgetImageDetail( widget.foodDetail ),
                 SizedBox( height: 10, ),
                 Text( widget.foodDetail.data.nameFood , style:  TextStyle( fontSize:  30  ) , ),
                 SizedBox( height: 5, ),
                 widget.foodDetail.data.recomended ? Padding(
                   padding: const EdgeInsets.only( right: 250  ),
                   child: Container( 
                     decoration: BoxDecoration(
                          borderRadius: BorderRadius.all( Radius.circular(10) ),
                          color:  Colores.greenColorManzanaVerdeO
                     ),
                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("Recomendado", style:  
                                TextStyle( color:  Colores.greenColorManzanaVerde   ) ,  ),
                       ),
                     )),
                 ) : Container(),
                 SizedBox( height: 20, ),
                 Text("Ingredientes: Delicioso plato de pasta con pollo, verduras salteadas y chía."  ),
                 SizedBox( height: 20, ),
                 WidgetNutritionDetail( widget.foodDetail ),
                SizedBox( height: 20, ),
                WidgetTags( widget.foodDetail ), 
                SizedBox( height: 20, ),
                WidgetSalads( widget.foodDetail ),
                SizedBox( height: 30, ),
                WidgetCheckedsButtons(),
                WidgetBtnAddOrRemove( widget.fromMenu ),


           ],
      ),
    ); 
  }
}