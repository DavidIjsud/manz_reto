


import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:manzana_verde_reto/blocs/homePageBloc.dart';
import 'package:manzana_verde_reto/classEvents/selectedDayEvent.dart';

class Database {

   List<Map<String, dynamic>> _dataInformation = [];
   List<Map<String, dynamic>> _lunchsInformation = [];
   List<Map<String,  dynamic >> _lunchDetail = [];

   HomePageBloc _homePageBloc = HomePageBloc();

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


   void _setStreamData(  String day , int nroDay   ){

      switch (day) {
        case  "Lunes" :
             _homePageBloc.streamSinkEventedDay.add( new EventSelectedDay(true ,  1,  day, nroDay, true    ) );
          break;
        case "Martes":
            _homePageBloc.streamSinkEventedDay.add( new EventSelectedDay(true ,  2,  day, nroDay, true    ) );
          break;
        case "Miercoles":
          _homePageBloc.streamSinkEventedDay.add( new EventSelectedDay(true ,  3,  day, nroDay, true    ) );
          break;

        case "Jueves":
        _homePageBloc.streamSinkEventedDay.add( new EventSelectedDay(true ,  4,  day, nroDay, true    ) );
          break;
        case "Viernes":
        _homePageBloc.streamSinkEventedDay.add( new EventSelectedDay(true ,  5,  day, nroDay, true    ) );
          break;        
        default:
            _homePageBloc.streamSinkEventedDay.add( new EventSelectedDay(true ,  1,  day, nroDay, true    ) );
      }

   } 


  void addNewFoodToRoutine( String nameFood , int porcent  , String img , String day , int nroDay   ){

        this._dataInformation.forEach((element) { 


        Map<String, dynamic>  informationDay = element["data"];

       if( informationDay.containsValue(day) && informationDay.containsValue(nroDay) ){

                   
                    List<dynamic> listOfDaysRoutine = informationDay["information"];
                    Map<String, dynamic> lunchTurn =  listOfDaysRoutine[1];  

                    List<dynamic> lunchs = lunchTurn["foods"];

                    Map<String, dynamic> newFood = {
                         "name_food" :nameFood,
                        "procent_food" :porcent,
                        "img" : img,
                        "id" : 3
                    };
                    lunchs.add(newFood);
                    _setStreamData( day, nroDay );

                }else{
                  print("Nelly");
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