import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manzana_verde_reto/helpers/constantes.dart';
import 'package:manzana_verde_reto/pages/detailPage.dart';
import 'package:manzana_verde_reto/pages/homePage.dart';
import 'package:manzana_verde_reto/pages/lunchsPage.dart';
import 'package:manzana_verde_reto/pages/pictureFoodPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colores.greenColorManzanaVerde
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.green,
      ),
      initialRoute: "home",
      routes:  {
          "home" : (_) =>  MisPedidosPage(),
          "lunch" : (_) => LunchsPage( "" , 0 ),
          "detailpage" : (_) => DetailPage(false,  0 ),
          "picturepage" : (_) => PicturePage("")
      },
    );
  }
}

