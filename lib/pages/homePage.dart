import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/blocs/homePageBloc.dart';
import 'package:manzana_verde_reto/classEvents/selectedDayEvent.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/infoDay.dart';
import 'package:manzana_verde_reto/providers/http_requests.dart';
import 'package:manzana_verde_reto/widgets/homePageWidgets/widgetDeliveryAddress.dart';
import 'package:manzana_verde_reto/widgets/homePageWidgets/widgetHeader.dart';
import 'package:manzana_verde_reto/widgets/homePageWidgets/widgetCalendar.dart';
import 'package:manzana_verde_reto/widgets/homePageWidgets/widgetListOfFood.dart';
import 'package:manzana_verde_reto/widgets/homePageWidgets/widgetSesion.dart';

class MisPedidosPage extends StatefulWidget {
  const MisPedidosPage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MisPedidosPage> {


  final HomePageBloc _homePageBloc = new HomePageBloc();

  @override
  Widget build(BuildContext context) {

    final phoneSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton:FloatingActionButton( 
          onPressed: (){
            
          },
          child: Icon(Icons.add),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar( 
      color:Colors.white,
      shape: CircularNotchedRectangle(), 
      notchMargin: 5, 
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.calendar_today , color: Colores.almostBlackColorManzanaVerde,), onPressed: () {},),
            IconButton(icon: Icon(Icons.blender_outlined, color: Colores.greenColorManzanaVerde,), onPressed: () {},),
            IconButton(icon: Icon(Icons.food_bank_sharp, color: Colores.almostBlackColorManzanaVerde,), onPressed: () {},),
            IconButton(icon: Icon(Icons.person, color: Colores.almostBlackColorManzanaVerde,), onPressed: () {},),
          ],
        ),
      ),
    ),
    body: SafeArea(
      child: Column(
           children: [
          
                Column(
                   children: [
                       Card(child: WidgetHeader(), elevation: 0, ),
                      Card( child:  WidgetCalendar() , elevation: 0,  ),
                      Card( child: WidgetDeliveryInfo(), elevation: 0,  ),
                   ],
                ),
                  
                Expanded(
                  child: StreamBuilder<EventSelectedDay>(
                    initialData:  EventSelectedDay( true, 1 , "Lunes" , 21 , false  ) ,
                    stream: _homePageBloc.streamGetEventedDay,
                    builder: ( _ , AsyncSnapshot<EventSelectedDay> snapshot  ) {
                        
                         if( snapshot.hasError || !snapshot.hasData  ){
                              return Center(
                                  child: CircularProgressIndicator( color:  Colores.greenColorManzanaVerde, )  ,
                              );
                         }
                  
                         return FutureBuilder<Map<String , dynamic>>(
                  
                             future: RequestsHttp.getDataOfDay( snapshot.data!.dayBtnselected ,  snapshot.data!.nroDay   )  ,
                             builder:  ( _ , AsyncSnapshot<Map<String, dynamic >> asyncSnapshot  ) {
                                  if( asyncSnapshot.hasError || !asyncSnapshot.hasData ){
                                        return Center( child:  CircularProgressIndicator( color:  Colores.greenColorManzanaVerde , ) ,   );
                                  }
                  
                                  if( asyncSnapshot.data!.isEmpty ){
                                      return Container( child: Text("Seleccione una fecha")  , );
                                  }
                  
                                  List<InfoOfDay>   info =   infoOfDayFromJson(  jsonEncode(asyncSnapshot.data!["data"]["information"])  )  ;                                
                                  return Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric( horizontal: 15 ),
                                      child: ListView.builder(
                                        itemCount: info.length,
                                        itemBuilder: ( _ , i ) {
                                              
                                              if( info[i].foods.isNotEmpty  ){

                                                  return WidgetListOfFood( snapshot.data!.nroDay , snapshot.data!.dayBtnselected ,  info[i].foods );

                                              }else{
                                                  // return Container( child: Text("Comidas 2"), );
                                                  return WidgetSesion(   snapshot.data!.dayBtnselected , snapshot.data!.nroDay  ,info[i].name  , info[i].porcent, info[i].credits  ,  info[i].image );
                                              }
                                        }
                                      ),
                                    ),
                                  );  
                                  
                  
                             }
                             
                          );
                  
                    }
                  ),
                ),
           ],
      ),
    )  ,
   );
  }
}