import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/foodDetail.dart';

class WidgetNutritionDetail extends StatefulWidget {

  final FoodDetail foodDetail;

  const WidgetNutritionDetail(  this.foodDetail ,{ Key? key }) : super(key: key);

  @override
  _WidgetNutritionDetailState createState() => _WidgetNutritionDetailState();
}

class _WidgetNutritionDetailState extends State<WidgetNutritionDetail> {
  @override
  Widget build(BuildContext context) {

    final phoneSize = MediaQuery.of(context).size;

    return Container(
                      width: phoneSize.width * 0.8 ,
                      height:  phoneSize.height * 0.07 ,
                      decoration: BoxDecoration(
                          border: Border.all( color: Colores.almostBlackColorManzanaVerde ),
                          borderRadius: BorderRadius.all( Radius.circular(10) )
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                               Column(
                                   children: [
                                       Text("Kcal"),
                                       Text( widget.foodDetail.data.nutritions.kcal.toString() , style:  TextStyle( fontSize: 20 , color: Colores.greenColorManzanaVerde ) , )
                                   ],
                               ),
                               VerticalDivider( thickness: 3,  color: Colores.almostBlackColorManzanaVerde , ),
                                Column(
                                   children: [
                                       Text("Grasa"),
                                       Text( widget.foodDetail.data.nutritions.grasa.toString() , style:  TextStyle( fontSize: 20 , color: Colores.greenColorManzanaVerde ) , )
                                   ],
                               ),
                               VerticalDivider( thickness: 3,  color: Colores.almostBlackColorManzanaVerde , ),
                                Column(
                                   children: [
                                       Text("Carbo"),
                                       Text( widget.foodDetail.data.nutritions.carbo.toString() , style:  TextStyle( fontSize: 20 , color: Colores.greenColorManzanaVerde ) , )
                                   ],
                               ),
                               VerticalDivider( thickness: 3,  color: Colores.almostBlackColorManzanaVerde , ),
                                Column(
                                   children: [
                                       Text("Prote"),
                                       Text( widget.foodDetail.data.nutritions.prote.toString() , style:  TextStyle( fontSize: 20 , color: Colores.greenColorManzanaVerde ) , )
                                   ],
                               ),
                          ],
                      ),
                 );
  }
}