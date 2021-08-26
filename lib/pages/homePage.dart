import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/widgets/homePageWidgets/widgetHeader.dart';

class MisPedidosPage extends StatefulWidget {
  const MisPedidosPage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MisPedidosPage> {
  @override
  Widget build(BuildContext context) {

    final phoneSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton:FloatingActionButton( 
          onPressed: (){
            
          },
          child: Icon(Icons.add),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar( 
      color:Colors.white,
      shape: CircularNotchedRectangle(), 
      notchMargin: 5, 
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.calendar_today , color: Colores.almostBlackColorManzanaVerde,), onPressed: () {},),
            IconButton(icon: Icon(Icons.blender_outlined, color: Colores.greenColorManzanaVerde,), onPressed: () {},),
            IconButton(icon: Icon(Icons.food_bank_sharp, color: Colores.almostBlackColorManzanaVerde,), onPressed: () {},),
            IconButton(icon: Icon(Icons.person, color: Colores.almostBlackColorManzanaVerde,), onPressed: () {},),
          ],
        ),
      ),
    ),
    body: SafeArea(
      child: Column(
           children: [
                 Card(child: WidgetHeader(), elevation: 3, ),
           ],
      ),
    )  ,
);
  }
}