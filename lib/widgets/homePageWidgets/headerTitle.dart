import 'package:flutter/material.dart';

class WidgetHeaderTitle extends StatefulWidget {
  const WidgetHeaderTitle({ Key? key }) : super(key: key);

  @override
  _WidgetHeaderTitleState createState() => _WidgetHeaderTitleState();
}

class _WidgetHeaderTitleState extends State<WidgetHeaderTitle> {
  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
                Container(
                  width:  phoneSize.width * 0.1   ,
                  height: phoneSize.width * 0.1  ,
                  child: Image.asset(
                       "assets/images/perfil.png",
                       fit:  BoxFit.cover ,
                  ),
                ),
                Text(
                    "Mis pedidos",
                    style:  TextStyle( fontWeight:  FontWeight.bold  ) ,
                ),
                Container(
                   width:  phoneSize.width * 0.1   ,
                  height: phoneSize.width * 0.1  ,
                  child: Image.asset(
                     "assets/images/circular_barra.png",
                     fit: BoxFit.cover ,
                  ),
                ),
                Container(
                   width:  phoneSize.width * 0.22   ,
                  height: phoneSize.width * 0.1  ,
                  child: Image.asset(
                    "assets/images/switch_boton.png",
                     fit: BoxFit.cover ,
                  ),
                ),
                Container(
                   width:  phoneSize.width * 0.15   ,
                  height: phoneSize.width * 0.1  ,
                  child: Image.asset(
                      "assets/images/configuracion.png",
                      fit: BoxFit.cover ,
                  ),
                ),
           ],
      ),
    );
  }
}