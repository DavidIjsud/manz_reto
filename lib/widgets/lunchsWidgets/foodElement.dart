import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/blocs/lunchsPageBloc.dart';
import 'package:manzana_verde_reto/classEvents/heartedEvent.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/lunchs.dart';
import 'package:manzana_verde_reto/pages/detailPage.dart';
import 'package:manzana_verde_reto/providers/http_requests.dart';

class WidgetFoodElement extends StatefulWidget {

  final String day;
  final int nro;

  const WidgetFoodElement( this.day , this.nro ,{ Key? key }) : super(key: key);

  @override
  _WidgetFoodElementState createState() => _WidgetFoodElementState();
}

class _WidgetFoodElementState extends State<WidgetFoodElement> {

  LunchPageBloc _lunchPageBloc = new LunchPageBloc();  
  HeartedEvent heartedEvent = new HeartedEvent();

  @override
  Widget build(BuildContext context) {

    final phoneSize = MediaQuery.of(context).size;  

    return FutureBuilder<Map<String, dynamic>>(
                     future:  RequestsHttp.getLunchsPerDate( widget.day ,  widget.nro ) ,
                     builder: ( _ ,  AsyncSnapshot<Map<String, dynamic>> asyncSnapshot  ){

                           if( asyncSnapshot.hasError || !asyncSnapshot.hasData || asyncSnapshot.data == null   ) {
                             return Center( child:  CircularProgressIndicator( color:  Colores.greenColorManzanaVerde , ) , );
                           }

                           Lunchs lunchedFound = lunchsFromJson( jsonEncode( asyncSnapshot.data  )  );

                           return ListView.builder(
                               itemCount:  lunchedFound.data.lunchs.length ,
                               itemBuilder: ( _ , i ) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: GestureDetector(
                                          onDoubleTap: (){
                                              this.heartedEvent.idsImagesHearted.add( lunchedFound.data.lunchs[i].id );
                                              _lunchPageBloc.streamSinkEventedDay.add( this.heartedEvent );
                                          },
                                          onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>  DetailPage(true, lunchedFound.data.lunchs[i].id   ) ),
                                                );
                                          },
                                          child: Container(
                                          width:   phoneSize.width ,
                                          height:  phoneSize.height * 0.33 ,
                                          decoration: BoxDecoration(
                                               border:  Border.all( color: Colores.almostBlackColorManzanaVerde ),
                                               borderRadius:  BorderRadius.all( Radius.circular(10) )  
                                          ),
                                          child:  Column(
                                               children: [
                                                    Stack(
                                                      children: [ Container(
                                                          width: phoneSize.width,
                                                          height:  phoneSize.height * 0.25  ,
                                                          child:  ClipRRect(
                                                            borderRadius:  BorderRadius.only( topLeft: Radius.circular(10) , topRight: Radius.circular(10) ) ,
                                                            child: Image.asset( lunchedFound.data.lunchs[i].img,
                                                                fit: BoxFit.cover,
                                                              ),
                                                          ) ,
                                                      ),

                                                        StreamBuilder<HeartedEvent>(
                                                          initialData: HeartedEvent() ,
                                                          stream:  _lunchPageBloc.streamGetEventedDay ,
                                                          builder: (context, snapshot) {

                                                            return  snapshot.data!.idsImagesHearted.length == 0  ?   Container()
                                                                 :  snapshot.data!.idsImagesHearted.contains( lunchedFound.data.lunchs[i].id ) ?   Row(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: (){
                                                                       this.heartedEvent.idsImagesHearted.remove(  lunchedFound.data.lunchs[i].id  );
                                                                       _lunchPageBloc.streamSinkEventedDay.add( this.heartedEvent );
                                                                  },
                                                                  child: Container(
                                                                          width:  phoneSize.width * 0.07 ,
                                                                          height:  phoneSize.width * 0.07 ,
                                                                          child:   Image.asset("assets/images/corazon.png")  ,
                                                                      ),
                                                                ),
                                                              ],
                                                            ) : Container() ;
                                                          }
                                                        ), 
                                                    ] 
                                                    ),
                                                    SizedBox( height: 15 ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric( horizontal: 5 ),
                                                      child: Row(
                                                          children: [
                                                             Expanded(child: Text( lunchedFound.data.lunchs[i].nameLunch  )),
                                                             lunchedFound.data.lunchs[i].recomended ? Container( 
                                                               decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                    color: Colores.greenColorManzanaVerdeO
                                                               ),
                                                               child: Padding(
                                                                 padding:  EdgeInsets.all(5) ,
                                                                 child: Text("Recomendado", style: TextStyle( color:  Colores.greenColorManzanaVerde  ) ,  ))  , ) : Container()
                                                          ]
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric( horizontal: 5 ),
                                                      child: Row(
                                                         children: [
                                                             Expanded(child: Text( lunchedFound.data.lunchs[i].calories.toString() + "kCal" )),
                                                             Icon(Icons.ac_unit_rounded, color: Colores.greenColorManzanaVerde, ),
                                                             Icon(Icons.ac_unit_rounded, color: Colores.greenColorManzanaVerde, ),
                                                             Icon(Icons.ac_unit_rounded, color: Colores.greenColorManzanaVerde, ),
                                                             Icon(Icons.ac_unit_rounded, color: Colores.greenColorManzanaVerde, ),
                                                             Icon(Icons.ac_unit_rounded, color: Colores.greenColorManzanaVerde, ),
                                                             
                                                         ],
                                                      ),
                                                    ),
                                               ],
                                          ) ,
                                                                                  ),
                                        ),
                                      ); 
                               }
                              );
                     }
                  );
  }
}