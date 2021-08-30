import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/models/foodDetail.dart';
import 'package:manzana_verde_reto/pages/pictureFoodPage.dart';

class WidgetImageDetail extends StatefulWidget {

  final FoodDetail foodDetail;

  const WidgetImageDetail( this.foodDetail  ,{ Key? key }) : super(key: key);

  @override
  _WidgetImageDetailState createState() => _WidgetImageDetailState();
}

class _WidgetImageDetailState extends State<WidgetImageDetail> {
  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return GestureDetector(
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
                 );
  }
}