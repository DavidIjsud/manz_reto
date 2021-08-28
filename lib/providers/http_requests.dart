

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:manzana_verde_reto/models/daysData.dart';

class RequestsHttp{

   static Future<DaysData> getDataDaysOrdered() async {

        DaysData daysData;
        final String response = await rootBundle.loadString('assets/jsons/daysOrdered.json');
       return   await   Future.delayed( Duration( seconds: 3  ), () async {
                daysData = DaysData.fromJson( await  json.decode(response));
                return daysData;
        } );

   }  

}