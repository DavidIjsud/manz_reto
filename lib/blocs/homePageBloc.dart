import 'dart:async';

class HomePageBloc {

  StreamController<int> _input = new StreamController<int>();   //para la entrada
  StreamController<int> _output = new StreamController<int>(); // para la salida

  StreamSink<int> get streamSinkCounter => _input.sink;
  Stream<int> get streamCounter => _output.stream;

  HomePageBloc(){
        _input.stream.listen( _onEvent );
  }

  void dispose(){
    _input.close();
    _output.close();
  }

  void _onEvent( elemento ){
       _output.sink.add(1);
  }

}