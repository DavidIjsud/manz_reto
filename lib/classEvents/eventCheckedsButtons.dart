import 'package:manzana_verde_reto/classEvents/eventBase.dart';

class EventCheckeds extends EventBase{

      Map<String , dynamic> _checkedsButtons = new Map();

      static final EventCheckeds  _singleTonHeartedEvent = EventCheckeds._internal();

      factory EventCheckeds(){
         return _singleTonHeartedEvent;
      }

      EventCheckeds._internal(){
           _checkedsButtons.addAll({
               "Camote" : false
           });
           _checkedsButtons.addAll({
               "Papa" : false
           });
           _checkedsButtons.addAll({
               "Arroz" : false
           });
           _checkedsButtons.addAll({
               "Incluir picante" : false
           });
      }

      Map<String,  dynamic > get checkedsButtons => this._checkedsButtons;

      void changeCheckedsButtons(  String keyx , bool  v  ){

                this._checkedsButtons.forEach((key, value) {

                       if( keyx == key  ){
                      this._checkedsButtons.update( key , (value) {
                             return v;
                      });
                   }
                     
                 });

      }

      bool  statusCheckedListTile( String keyx ){

            bool b = false;

            this._checkedsButtons.forEach((key, value) {
                 
                  if( keyx == key  ){
                      b = value;
                  }

             });

             return b;

         
      }

}