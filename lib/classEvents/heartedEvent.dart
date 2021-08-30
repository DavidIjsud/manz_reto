import 'package:manzana_verde_reto/classEvents/eventBase.dart';

class HeartedEvent extends EventBase{

      List<int> idImagesHearted  = [];

      static final HeartedEvent  _singleTonHeartedEvent = HeartedEvent._internal();

      factory HeartedEvent(){
         return _singleTonHeartedEvent;
      }

      HeartedEvent._internal();


     List<int> get idsImagesHearted => this.idImagesHearted;
     set addIdsImagesHearted(int id){
        this.idImagesHearted.add(id);
     } 

}