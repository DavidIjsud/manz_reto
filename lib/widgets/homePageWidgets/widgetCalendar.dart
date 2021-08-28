import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/widgets/homePageWidgets/widgetDay.dart';

class WidgetCalendar extends StatefulWidget {
  const WidgetCalendar({ Key? key }) : super(key: key);

  @override
  _WidgetCalendarState createState() => _WidgetCalendarState();
}

class _WidgetCalendarState extends State<WidgetCalendar> {
  @override
  Widget build(BuildContext context) {

    final phoneSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal : 10.0 ),
      child: Container(
            width: phoneSize.width,
            height: phoneSize.height * 0.1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                     Expanded(child: WidgetDay("Lunes", 1)),
                     SizedBox( width:  phoneSize.width * 0.05 , ),
                     Expanded(child: WidgetDay("Lunes", 1)),
                     SizedBox( width:  phoneSize.width * 0.05, ),
                     Expanded(child: WidgetDay("Lunes", 1)),
                     SizedBox( width:  phoneSize.width * 0.05 ),
                     Expanded(child: WidgetDay("Lunes", 1)),
                     SizedBox( width:  phoneSize.width * 0.05, ),
                     Expanded(child: WidgetDay("Lunes", 1))
                ],
            ),
      ),
    );
  }
}