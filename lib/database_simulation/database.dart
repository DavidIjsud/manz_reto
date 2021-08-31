


import 'dart:convert';

import 'package:flutter/services.dart';

class Database {

   List<Map<String, dynamic>> _dataInformation = [];
   List<Map<String, dynamic>> _lunchsInformation = [];
   List<Map<String,  dynamic >> _lunchDetail = [];

    static final Database _singleTonDatabase  = Database._internal();

    factory Database(){
         return _singleTonDatabase;
    }

    Database._internal(){
          _fillDataBase();
    }

    void _fillDataBase() async {

        this._dataInformation.add(  json.decode( await  rootBundle.loadString('assets/jsons/routineInformation_monday.json')  )   );
        this._dataInformation.add(  json.decode( await  rootBundle.loadString('assets/jsons/routineInformation_tuesday.json')  )   );
        this._dataInformation.add(  json.decode( await  rootBundle.loadString('assets/jsons/routineInformation_wednesday.json')  )   );
        this._dataInformation.add(  json.decode( await  rootBundle.loadString('assets/jsons/routineInformation_thursday.json')  )   );
        this._dataInformation.add(  json.decode( await  rootBundle.loadString('assets/jsons/routineInformation_friday.json')  )   );

        this._lunchsInformation.add(json.decode( await  rootBundle.loadString('assets/jsons/lunchs_monday.json')  )  );
        this._lunchsInformation.add(json.decode( await  rootBundle.loadString('assets/jsons/lunchs_thursday.json')  )  );

        this._lunchDetail.add( json.decode( await rootBundle.loadString('assets/jsons/foodDetail.json') ) );
        this._lunchDetail.add( json.decode( await rootBundle.loadString('assets/jsons/foodDetail_two.json') ) );
        this._lunchDetail.add( json.decode( await rootBundle.loadString('assets/jsons/foodDetail_three.json') ) );
        this._lunchDetail.add( json.decode( await rootBundle.loadString('assets/jsons/foodDetail_four.json') ) );
   
    }


  void addNewFoodToRoutine( String nameFood , int porcent  , String img   ){

        this._dataInformation.forEach((element) { 
 
                if( element.containsKey("day") ){
                    print("Si contiene day");
                }
           
         });

  }


   void addNewInformation( Map<String, dynamic>  data ){
       this._dataInformation.add(data);
   }

   void addNewLunch( Map<String, dynamic> data ){
       this._lunchsInformation.add(data);
   }

   void addNewLunchDetail ( Map<String, dynamic>  data) {
       this._lunchDetail.add(data);
   }

   Map<String , dynamic> lunchDetailPerId(int id){


      Map<String, dynamic> dataToReturn = {};

        this._lunchDetail.forEach((element) {

                     Map<String , dynamic>  data = element["data"];


                    if( data.containsValue(id) ){
                        dataToReturn = element;
                        return ;
                    } 

         });

         return dataToReturn;

   }

   Map<String, dynamic> lunchsPerDate(String day , int nro){ 

      Map<String, dynamic> dataToReturn = {};

        this._lunchsInformation.forEach((element) {

                     Map<String , dynamic>  data = element["data"];


                    if( data.containsValue(day) && data.containsValue(nro) ){
                    dataToReturn = element;
                    return ;
                    } 

         });

         return dataToReturn;

    }

   Map<String, dynamic > objetDay( String day , int nro  ) {

         Map<String, dynamic> dataToReturn = {};

        this._dataInformation.forEach((element) {

                     Map<String , dynamic>  data = element["data"];


                    if( data.containsValue(day) && data.containsValue(nro) ){
                    dataToReturn = element;
                    return ;
                    } 

         });

         return dataToReturn;

   }

}