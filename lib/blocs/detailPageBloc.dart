import 'dart:async';

import 'package:manzana_verde_reto/classEvents/eventCheckedsButtons.dart';

class DetailPageBloc {

  final StreamController<EventCheckeds> _input = new StreamController(); 
  final StreamController<EventCheckeds> _output = new StreamController.broadcast(); 

  Stream<EventCheckeds> get streamGetEventedDay => _output.stream;
  StreamSink<EventCheckeds> get streamSinkEventedDay => _input.sink;
 
  static final DetailPageBloc _singletonHomePageBloc = DetailPageBloc._internal();


  factory DetailPageBloc(){
    return _singletonHomePageBloc;
  }  

  DetailPageBloc._internal(){
       _input.stream.listen( _onEvent );
  }

  void dispose(){
    _input.close();
    _output.close(); 
  }

  void _onEvent( EventCheckeds event ){

           this._output.add(event);
       
    
  }

}