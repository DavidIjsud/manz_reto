import 'package:manzana_verde_reto/classEvents/eventBase.dart';

class EventSelectedDay extends EventBase{

      bool _btnSelected;
      int _idBtnSelected;
      String _day;
      int _nroDay;

      EventSelectedDay(this._btnSelected , this._idBtnSelected, this._day , this._nroDay ) ;   

      int get idBtnSelected => _idBtnSelected;
       set idBtnSelected( int id ) => idBtnSelected = id; 

      bool get btnSelected => _btnSelected;
       set btnSelected(bool value) => _btnSelected = value;

      String get dayBtnselected => _day;
       set dayBtnSelected( String day ) => _day = day;

      int get nroDay => _nroDay;
       set nroDay( int nro )  => _nroDay = nro;
    

}