import 'package:flutter/material.dart';

class WidgetDeliveryInfo extends StatefulWidget {
  const WidgetDeliveryInfo({ Key? key }) : super(key: key);

  @override
  _WidgetDeliveryInfoState createState() => _WidgetDeliveryInfoState();
}

class _WidgetDeliveryInfoState extends State<WidgetDeliveryInfo> {
  
  

  @override
  Widget build(BuildContext context) {

      final phoneSize = MediaQuery.of(context).size;

    return  Container(
            width: phoneSize.width,
            height: phoneSize.height * 0.09, 
            child: ListTile(
                 title : Text("Entregar en:" , style:  TextStyle( fontSize: 20 ) , ),
                 subtitle: Text( "Av Mariscal Ramon Castilla 1155", style:  TextStyle( fontSize: 15 ) ,  ),
                 trailing: Icon(Icons.arrow_forward_ios),
                 leading: Image.asset( "assets/images/pack.png"),
            ),
    );
  }
}