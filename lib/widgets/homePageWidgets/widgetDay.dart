import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/blocs/homePageBloc.dart';
import 'package:manzana_verde_reto/classEvents/selectedDayEvent.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';

class WidgetDay extends StatefulWidget {

   final String day;
   final int number;
   final bool ordened;
   final int idBtn;

  const WidgetDay( this.day ,    this.number  ,  this.ordened  , this.idBtn , { Key? key   }) : super(key: key);

  @override
  _WidgetDayState createState() => _WidgetDayState();
}

class _WidgetDayState extends State<WidgetDay> {


  HomePageBloc _homePageBloc = new HomePageBloc();


  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return Container(
      child: StreamBuilder<EventSelectedDay>(
        stream:  this._homePageBloc.streamGetEventedDay  ,
        builder: (context, AsyncSnapshot<EventSelectedDay>  snapshot) {
          print(snapshot.hasData);
          return Container(
                width: phoneSize.width * 0.15,
                height: phoneSize.width * 0.15,
                decoration: BoxDecoration(
                    color:   verifyColor(snapshot)  ,
                    borderRadius: BorderRadius.all( Radius.circular(10) )
                ),
                child:  Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                           Text(widget.day  ),
                           Text( widget.number.toString() , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 20  ),  ),
                           widget.ordened ?  Container(
                                width: 25,
                                height: 3,
                                color: Colors.green,
                           ) : Container(), 
                     ],
                ) ,
          );
        }
      ),
    );
  }

  Color verifyColor( AsyncSnapshot<EventSelectedDay> snapshot ){
     
      if( snapshot.hasData ){

              if( snapshot.data?.idBtnSelected == widget.idBtn ){
                  return Colores.yellowColorManzanaVerde;
              }

       }

     return Colores.almostBlackColorManzanaVerde;   

  }

}