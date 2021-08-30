import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/foodDetail.dart';

class WidgetSalads extends StatefulWidget {

  final FoodDetail foodDetail;

  const WidgetSalads( this.foodDetail ,{ Key? key }) : super(key: key);

  @override
  _WidgetSaladState createState() => _WidgetSaladState();
}

class _WidgetSaladState extends State<WidgetSalads> {
  @override
  Widget build(BuildContext context) {

    final phoneSize = MediaQuery.of(context).size;
 
    return Container(
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
                );
  }
}