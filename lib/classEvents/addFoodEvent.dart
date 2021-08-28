import 'package:manzana_verde_reto/classEvents/eventBase.dart';

class AddFoodEvent extends EventBase{

      bool needAddFood;

      AddFoodEvent(this.needAddFood);

      bool get getNeedAddFood => this.getNeedAddFood;
      void set neededAddFood( bool v ) => this.needAddFood = v; 

}