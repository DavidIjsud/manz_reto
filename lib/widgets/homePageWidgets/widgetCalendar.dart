import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/blocs/homePageBloc.dart';
import 'package:manzana_verde_reto/classEvents/selectedDayEvent.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/daysData.dart';
import 'package:manzana_verde_reto/providers/http_requests.dart';
import 'package:manzana_verde_reto/widgets/homePageWidgets/widgetDay.dart';

class WidgetCalendar extends StatefulWidget {
  const WidgetCalendar({ Key? key }) : super(key: key);

  @override
  _WidgetCalendarState createState() => _WidgetCalendarState();
}

class _WidgetCalendarState extends State<WidgetCalendar> {


   HomePageBloc _homePageBloc = new HomePageBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final phoneSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal : 10.0 ),
      child: Container(
            width: phoneSize.width,
            height: phoneSize.height * 0.1,
            child:  FutureBuilder(
              future: widgetsDays(),
              builder: ( _ , AsyncSnapshot<List<Widget> > asyncSnapshot ){
                    if( asyncSnapshot.hasError ||  !asyncSnapshot.hasData ){
                        return Center(
                            child:  CircularProgressIndicator( color:  Colores.greenColorManzanaVerde  , ) ,
                        );
                    }

                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  asyncSnapshot.data! ,
                    );
              }
            ) 
      ),
    );
  }

   Future<List<Widget> >  widgetsDays() async  {

        List<Widget> listaWidgets = [];
        DaysData daysData   = await  RequestsHttp.getDataDaysOrdered();

        if( daysData.status  ){ 
            daysData.data.forEach( (day) {
                listaWidgets.add( 

                                 GestureDetector(
                                   onTap: (){
                                        _homePageBloc.streamSinkEventedDay.add( new EventSelectedDay(true ,  day.id,  day.day, day.numb    ) );
                                   },
                                   child: WidgetDay( day.day.substring(0,3)  ,  day.numb , day.ordered , day.id   )
                              )
                     
                 );
            });
        }

        return listaWidgets;

    }

}