import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/widgets/homePageWidgets/headerTitle.dart';
import 'package:manzana_verde_reto/widgets/homePageWidgets/widgetBarraCalories.dart';

class WidgetHeader extends StatefulWidget {
  const WidgetHeader({ Key? key }) : super(key: key);

  @override
  _WidgetHeaderState createState() => _WidgetHeaderState();
}

class _WidgetHeaderState extends State<WidgetHeader> {
  @override
  Widget build(BuildContext context) {

    final phoneSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10.0 ),
      child: Container(
           width: phoneSize.width,
           height:  phoneSize.height * 0.14,
           child:  Column(
               children: [
                       SizedBox( height: 10, ),
                       WidgetHeaderTitle(),
                       SizedBox( height:  20 , ),
                       WidgetBarraCalories(),
               ],
           ) ,
      ),
    );

  }
}