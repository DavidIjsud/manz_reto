import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';

class PicturePage extends StatefulWidget {

  final String image;

  const PicturePage( this.image ,{ Key? key }) : super(key: key);

  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return  Scaffold(
       body: Container(
           width: phoneSize.width,
           height:  phoneSize.height ,
           color: Colores.almostBlackColorManzanaVerde  ,
           child: Center(
               child:  Stack(
                  children: [
                    Container(
                        width: phoneSize.width * 0.8,
                        height:  phoneSize.height * 0.5 ,
                        child: Image.asset( widget.image)),
                      IconButton(onPressed: (){
                         print("X");
                          Navigator.of(context).pop();
                      }, icon:  Icon(Icons.close , color:  Colors.white , )  ),
                      
                  ],
               ) ,
           ),
       ),
    ); 
  }
}