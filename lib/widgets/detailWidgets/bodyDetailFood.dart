import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/foodDetail.dart';
import 'package:manzana_verde_reto/pages/pictureFoodPage.dart';

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
                 GestureDetector(
                   onTap: (){
                          Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>   PicturePage( widget.foodDetail.data.img ) ),
                                    );
                   },
                   child: Container(
                           width:   phoneSize.width ,
                           height:  phoneSize.height * 0.27 ,
                           decoration: BoxDecoration(
                              borderRadius:  BorderRadius.all( Radius.circular(10) )  
                            ),
                          child: ClipRRect(
                            borderRadius:  BorderRadius.all( Radius.circular(10) ) ,
                            child: Image.asset( widget.foodDetail.data.img )) 
                   ),
                 ),
                 SizedBox( height: 10, ),
                 Text( widget.foodDetail.data.nameFood , style:  TextStyle( fontSize:  30  ) , ),
                 SizedBox( height: 5, ),
                 widget.foodDetail.data.recomended ? Text("Recomendado" ) : Container(),
                 SizedBox( height: 20, ),
                 Text("Ingredientes: Delicioso plato de pasta con pollo, verduras salteadas y chía."  ),
                 SizedBox( height: 20, ),
                 Container(
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
                 ),
                SizedBox( height: 16, ),
                Wrap(
                    children: [
                         Expanded(child: Icon(Icons.face , color: Colores.greenColorManzanaVerde, )),
                        
                         Expanded(child: Text( widget.foodDetail.data.tags[0] )),
                          SizedBox( width: 6, ),
                          Expanded(child: Icon(Icons.air  , color: Colores.greenColorManzanaVerde, )),
                         Expanded(child: Text( widget.foodDetail.data.tags[1] )),
                         SizedBox( width: 6, ),
                          Expanded(child: Icon(Icons.air_rounded  , color: Colores.greenColorManzanaVerde, )),
                         Expanded(child: Text( widget.foodDetail.data.tags[2] )),
                         SizedBox( width: 6, ),
                          Expanded(child: Icon(Icons.airline_seat_legroom_extra , color: Colores.greenColorManzanaVerde, )),
                         Expanded(child: Text( widget.foodDetail.data.tags[3] ))
                    ],
                ), 
                Container(
                    width:  phoneSize.width * 0.8 ,
                    height:  phoneSize.height * 0.1,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all( Radius.circular(10) ),
                        border:  Border.all( color:  Colores.almostBlackColorManzanaVerde  ) 
                    ) ,
                    child:  Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 5 ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Expanded(child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: Image.asset( widget.foodDetail.data.salads[0].img ))),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric( vertical: 5 ),
                                  child: Column(
                                     children: [
                                         
                                         Expanded(child: Text( "Ensalada Cesar" , style:  TextStyle( fontWeight:  FontWeight.bold  ) ,  )),
                                         widget.foodDetail.data.recomended ?  Expanded(child: Container(
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.all(Radius.circular(5)),
                                               color: Colores.greenColorManzanaVerdeO,
                                           ), 
                                           child: Padding(
                                             padding: const EdgeInsets.all(3.0),
                                             child: Text("Recomendado" , style:  TextStyle( color:  Colores.greenColorManzanaVerde ) , ),
                                           )))  : Container(),
                                         Expanded(
                                           child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("200Kcal"),
                                                Icon(Icons.admin_panel_settings_rounded)
                                              ],
                                           ),
                                         )
                                     ],
                                  ),
                                ),
                              ),
                              Container(
                                 width:  phoneSize.width * 0.25 ,
                                 height: phoneSize.height * 0.06 ,
                                 decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Colores.yellowColorManzanaVerde
                                 ),
                                 child:  Center(child: Text("Agregar")) ,
                              ),
                          ],
                      ),
                    ) ,
                ),
                SizedBox( height: 30, ),
                Container(
                    width: phoneSize.width * 0.8,
                    height:  phoneSize.height * 0.1 ,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all( Radius.circular(10) ),
                        color: widget.fromMenu ?  Colores.yellowColorManzanaVerde : Colors.red
                    ) ,
                    child:  widget.fromMenu ?
                      Center(child: Text("Agregar al pedido", style:  TextStyle( fontWeight: FontWeight.bold ) , )) : 
                      Center(child: Text("Eliminar Pedido" , style:  TextStyle( fontWeight: FontWeight.bold )  ))  ,
                ),


           ],
      ),
    ); 
  }
}