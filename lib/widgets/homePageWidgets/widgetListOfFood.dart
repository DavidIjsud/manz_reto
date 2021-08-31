import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/models/infoDay.dart';
import 'package:manzana_verde_reto/pages/detailPage.dart';
import 'package:manzana_verde_reto/pages/pictureFoodPage.dart';

class WidgetListOfFood extends StatefulWidget {

  final List<Food> listOfFoods;
  final String day ;
  final int nroDay;

  const WidgetListOfFood(  this.nroDay ,this.day  , this.listOfFoods  ,  { Key? key   }) : super(key: key);

  @override
  _WidgetListOfFoodState createState() => _WidgetListOfFoodState();
}

class _WidgetListOfFoodState extends State<WidgetListOfFood> {


  @override
  Widget build(BuildContext context) {

   final phoneSize = MediaQuery.of(context).size;   

    return Container(
               width: phoneSize.width * 0.9,
              height: phoneSize.height * 0.2 ,
              decoration: BoxDecoration(
                 border: Border.all( color:  Colores.almostBlackColorManzanaVerde  ),
                 borderRadius: BorderRadius.all( Radius.circular(10) )
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.listOfFoods.length,
                  itemBuilder: ( _ , i ) {
                      return Column(
                           children: [
                                 ListTile(
                                     leading: GestureDetector(
                                       onTap: (){
                                           Navigator.push(context, 
                                                MaterialPageRoute(builder: (_) => PicturePage(widget.listOfFoods[i].img   )   )
                                               );
                                       },
                                       child: Image.asset( widget.listOfFoods[i].img )) ,
                                     title:  GestureDetector(
                                       onTap: (){
                                           Navigator.push(context, 
                                                MaterialPageRoute(builder: (_) => DetailPage( widget.nroDay , widget.day  ,false, widget.listOfFoods[i].id)   )
                                               );
                                       },
                                       child: Text(  widget.listOfFoods[i].nameFood  )) ,
                                     subtitle:  GestureDetector(
                                       onTap: (){
                                               Navigator.push(context, 
                                                MaterialPageRoute(builder: (_) =>  DetailPage( widget.nroDay , widget.day    ,false ,  widget.listOfFoods[i].id )    )
                                               ); 
                                       },
                                       child: Text ( widget.listOfFoods[i].procentFood.toString() + "Kcal"  )) ,
                                     trailing:  IconButton(onPressed: (){}, icon:  Icon( Icons.delete , color: Colors.red,  )  ) ,
                                 ),
                                 Divider( height: 10, color: Colores.almostBlackColorManzanaVerde,  ),
                           ],
                      );
                  }
              )

    );
  }
}