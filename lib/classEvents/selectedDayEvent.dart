import 'package:manzana_verde_reto/classEvents/eventBase.dart';

class EventSelectedDay extends EventBase{

      bool _btnSelected;
      int _idBtnSelected;

      EventSelectedDay(this._btnSelected , this._idBtnSelected ) ;   

      int get idBtnSelected => _idBtnSelected;
      void set idBtnSelected( int id ) => idBtnSelected = id; 

      bool get btnSelected => _btnSelected;
      void set btnSelected(bool value) => _btnSelected = value;
    

}