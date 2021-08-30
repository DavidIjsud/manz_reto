import 'dart:async';

import 'package:manzana_verde_reto/classEvents/eventBase.dart';
import 'package:manzana_verde_reto/classEvents/heartedEvent.dart';
import 'package:manzana_verde_reto/classEvents/selectedDayEvent.dart';

class LunchPageBloc {

  final StreamController<HeartedEvent> _input = new StreamController(); 
  final StreamController<HeartedEvent> _output = new StreamController.broadcast(); 

  Stream<HeartedEvent> get streamGetEventedDay => _output.stream;
  StreamSink<HeartedEvent> get streamSinkEventedDay => _input.sink;
 
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

  void _onEvent( HeartedEvent event ){

           this._output.add(event);
       
    
  }

}