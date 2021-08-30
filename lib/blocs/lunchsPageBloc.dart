import 'dart:async';

import 'package:manzana_verde_reto/classEvents/eventBase.dart';
import 'package:manzana_verde_reto/classEvents/selectedDayEvent.dart';

class LunchPageBloc {

  final StreamController<int> _input = new StreamController(); 
  final StreamController<int> _output = new StreamController.broadcast(); 

  Stream<int> get streamGetEventedDay => _output.stream;
  StreamSink<int> get streamSinkEventedDay => _input.sink;
 
  static final LunchPageBloc _singletonHomePageBloc = LunchPageBloc._internal();


  factory LunchPageBloc(){
    return _singletonHomePageBloc;
  }  

  LunchPageBloc._internal(){
       _input.stream.listen( _onEvent );
  }

  void dispose(){
    _input.close();
    _output.close(); 
  }

  void _onEvent( int event ){

           this._output.add(event);
       
    
  }

}