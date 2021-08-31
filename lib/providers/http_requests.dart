

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:manzana_verde_reto/database_simulation/database.dart';
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

   static Future<Map<String,dynamic>> getLunchsPerDate( String day , int nro ) async  {

        Database database = new Database();
        return await Future.delayed( Duration( seconds: 3 ), (){
               return database.lunchsPerDate(day, nro);
        } );

   }

   static Future<Map<String,  dynamic >> getDetailLunchPerId( int id )  async {

        Database database = new Database();
        return await Future.delayed( Duration( seconds: 3 ), (){

                return database.lunchDetailPerId( id);
        } );

   }

   static Future<Map<String , dynamic>> getDataOfDay( String day , int nro  ) async {
        Database database = new Database();
        return await Future.delayed( Duration( milliseconds: 600 ), ()   {
               
                  return database.objetDay(day, nro);

         }  );

   }  

}