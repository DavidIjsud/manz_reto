import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/foodDetail.dart';
import 'package:manzana_verde_reto/providers/http_requests.dart';
import 'package:manzana_verde_reto/widgets/detailWidgets/bodyDetailFood.dart';
import 'package:manzana_verde_reto/widgets/detailWidgets/widgetHeader.dart';

class DetailPage extends StatefulWidget {

  final bool fromListLunchs;
  final int idFood; 

  const DetailPage( this.fromListLunchs , this.idFood ,{ Key? key }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  SafeArea(
          child: Column(
        
               children: [
                    WidgetHeaderDetail(),
                    Expanded(
                      child: FutureBuilder<Map<String , dynamic >>(
                        future:  RequestsHttp.getDetailLunchPerId( widget.idFood ) ,
                        builder: ( _  ,  AsyncSnapshot<Map<String, dynamic >>  asyncsnapshot  ) {
                             if( asyncsnapshot.hasError || !asyncsnapshot.hasData  ){
                                  return Center( child:  CircularProgressIndicator( color:  Colores.greenColorManzanaVerde , ) , );
                             }   
        
                            FoodDetail foodDetail = foodDetailFromJson( jsonEncode( asyncsnapshot.data  )  );
        
                            return WidgetBodyDetail( widget.fromListLunchs , foodDetail);
        
                        }
                      ),
                    )
               ],
          ),
        ) ,
    );
  }
}