import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/blocs/homePageBloc.dart';
import 'package:manzana_verde_reto/classEvents/addFoodEvent.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/infoDay.dart';
import 'package:manzana_verde_reto/pages/lunchsPage.dart';

class WidgetSesion extends StatefulWidget {

  final String turno;
  final int calories;
  final bool credits;
  final String image;
  final String day ;
  final int nroday;
 

  const WidgetSesion(  this.day , this.nroday ,this.turno , this.calories , this.credits,  this.image  , { Key? key }) : super(key: key);

  @override
  _WidgetSesionState createState() => _WidgetSesionState();
}

class _WidgetSesionState extends State<WidgetSesion> {

  HomePageBloc _homePageBloc = new HomePageBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

      final phoneSize  = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 6 ),
      child: Container(
              width: phoneSize.width * 0.9,
              height: phoneSize.height * 0.15 ,
              decoration: BoxDecoration(
                   border: Border.all(color:  Colores.borderColorManzanaVerde ),
                   borderRadius: BorderRadius.all( Radius.circular(20) ), 
                   color: Colores.cardSeasionColorManzanaVerde  
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric( horizontal: 5, vertical: 20),
                child:  ListTile(
                         title : Text( widget.turno  , style:  TextStyle( fontSize: 15 ) , ),
                         subtitle: Text(  widget.calories.toString()+"Kcal" , style:  TextStyle( fontSize: 10 ) ,  ),
                         trailing:  GestureDetector(
                           onTap: (){

                           },
                           child: widget.credits ?  GestureDetector(
                             onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  LunchsPage( widget.day , widget.nroday  )),
                                    );
                             },
                             child: Container(
                                 width:  phoneSize.width * 0.2  ,
                                 height:  phoneSize.width * 0.1 ,
                                 decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.all( Radius.circular(10) ),
                                      color:  Colores.yellowColorManzanaVerde 
                                 ) ,
                                 child:  Center(child: Text("Agregar")) ,
                             ),
                           ) : Text("No tiene creditos")
                         ) ,   // _btnAgregarWidget(  snapshot.data!.needAddFood , phoneSize) ,
                         leading: Image.asset(  widget.image ),
                    ),
              ),
      ),
    );
  }

  Widget _btnAgregarWidget( bool ordered , Size phoneSize ){

       return Container(
         width: phoneSize.width * 0.1  ,
         height: phoneSize.width * 0.05  ,
         decoration: BoxDecoration(
              borderRadius:  BorderRadius.all(Radius.circular(10)),
              color: Colores.yellowColorManzanaVerde
         ),
         child: ElevatedButton(
             onPressed: (){
                 
             }, 
             child:  Text( ordered ? "Ver Almuerzo" : "Agregar"  ) 
             ),
       );

  }

}