import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/foodDetail.dart';

class WidgetTags extends StatefulWidget {

  final FoodDetail foodDetail;

  const WidgetTags( this.foodDetail ,{ Key? key }) : super(key: key);

  @override
  _WidgetTagsState createState() => _WidgetTagsState();
}

class _WidgetTagsState extends State<WidgetTags> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
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
                );
  }
}