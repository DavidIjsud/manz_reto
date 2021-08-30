import 'dart:async';

import 'package:manzana_verde_reto/classEvents/eventBase.dart';
import 'package:manzana_verde_reto/classEvents/selectedDayEvent.dart';

class HomePageBloc {

  final StreamController<EventSelectedDay> _input = new StreamController(); 
  final StreamController<EventSelectedDay> _output = new StreamController.broadcast(); 

  Stream<EventSelectedDay> get streamGetEventedDay => _output.stream;
  StreamSink<EventSelectedDay> get streamSinkEventedDay => _input.sink;
 
  static final HomePageBloc _singletonHomePageBloc = HomePageBloc._internal();


  factory HomePageBloc(){
    return _singletonHomePageBloc;
  }  

  HomePageBloc._internal(){
       _input.stream.listen( _onEvent );
  }

  void dispose(){
    _input.close();
    _output.close(); 
  }

  void _onEvent( EventBase event ){

       if( event is EventSelectedDay ){
           print( event.btnSelected );
           this._output.add(event);
       }
    
  }

}