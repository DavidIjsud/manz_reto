import 'package:flutter/material.dart';
import 'package:manzana_verde_reto/blocs/detailPageBloc.dart';
import 'package:manzana_verde_reto/classEvents/eventCheckedsButtons.dart';

class WidgetCheckedsButtons extends StatefulWidget {
  const WidgetCheckedsButtons({ Key? key }) : super(key: key);

  @override
  _WidgetCheckedsButtonsState createState() => _WidgetCheckedsButtonsState();
}

class _WidgetCheckedsButtonsState extends State<WidgetCheckedsButtons> {

  DetailPageBloc _detailPageBloc = new DetailPageBloc(); 

  @override
  Widget build(BuildContext context) {
    return  Column(
                   children: [
                       StreamBuilder<EventCheckeds>(
                         initialData:  EventCheckeds() ,
                         stream: _detailPageBloc.streamGetEventedDay,
                         builder: (context, snapshot) {
                           return CheckboxListTile(

                             value:  snapshot.data!.statusCheckedListTile("Camote") ? true : false   ,
                             onChanged: (v){
                                     EventCheckeds eventCheckeds = new EventCheckeds();
                                     eventCheckeds.changeCheckedsButtons("Camote", v!);
                                     _detailPageBloc.streamSinkEventedDay.add(  eventCheckeds   );
                             },
                             controlAffinity:  ListTileControlAffinity.leading ,
                             title: Text("Camote"),
                       
                            );
                         }
                       ),
                          StreamBuilder<EventCheckeds>(
                            initialData:  EventCheckeds() ,
                         stream: _detailPageBloc.streamGetEventedDay,
                            builder: (context, snapshot) {
                              return CheckboxListTile(
                                                   value: snapshot.data!.statusCheckedListTile("Papa") ? true : false   ,
                                                   onChanged: (v){
                                                       EventCheckeds eventCheckeds = new EventCheckeds();
                                                      eventCheckeds.changeCheckedsButtons("Papa", v!);
                                                      _detailPageBloc.streamSinkEventedDay.add(  eventCheckeds   );
                                                   },
                                                   controlAffinity:  ListTileControlAffinity.leading ,
                                                   title: Text("Papa"),
                          
                                                  );
                            }
                          ),
                          StreamBuilder<EventCheckeds>(
                            initialData:  EventCheckeds() ,
                            stream: _detailPageBloc.streamGetEventedDay,
                            builder: (context, snapshot) {
                              return CheckboxListTile(
                                                   value: snapshot.data!.statusCheckedListTile("Arroz") ? true : false ,
                                                   onChanged: (v){
                                                        EventCheckeds eventCheckeds = new EventCheckeds();
                                                      eventCheckeds.changeCheckedsButtons("Arroz", v!);
                                                      _detailPageBloc.streamSinkEventedDay.add(  eventCheckeds   );
                                                   },
                                                   controlAffinity:  ListTileControlAffinity.leading ,
                                                   title: Text("Arroz"),
                          
                                                  );
                            }
                          ),
                        Divider(  ),
                          StreamBuilder<EventCheckeds>(
                             initialData:  EventCheckeds() ,
                            stream: _detailPageBloc.streamGetEventedDay,
                            builder: (context, snapshot) {
                              return CheckboxListTile(
                                                   value: snapshot.data!.statusCheckedListTile("Incluir picante") ? true : false ,
                                                   onChanged: (v){
                                                      EventCheckeds eventCheckeds = new EventCheckeds();
                                                      eventCheckeds.changeCheckedsButtons("Incluir picante", v!);
                                                      _detailPageBloc.streamSinkEventedDay.add(  eventCheckeds   );
                                                   },
                                                   controlAffinity:  ListTileControlAffinity.leading ,
                                                   title: Text("Incluir picante"),
                          
                                                  );
                            }
                          )
                   ],
                );
  }
}