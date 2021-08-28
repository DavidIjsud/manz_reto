import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';

class WidgetBarraCalories extends StatefulWidget {
  const WidgetBarraCalories({ Key? key }) : super(key: key);

  @override
  _WidgetBarraCaloriesState createState() => _WidgetBarraCaloriesState();
}

class _WidgetBarraCaloriesState extends State<WidgetBarraCalories> {
  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                children: [
                    Text("0Kcal" , style:  TextStyle( fontWeight:  FontWeight.bold  ) , ),
                    Text("22000Kcal" , style:  TextStyle( fontWeight:  FontWeight.bold  ) ,  )
                ],  
              ),
              Container(
                  width:  phoneSize.width ,
                  height:  phoneSize.height * 0.01 ,
                 
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.all( Radius.circular(10) ),
                     color: Colores.almostBlackColorManzanaVerde,
                  ) ,
              ),
         ],
    );
  }
}