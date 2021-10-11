import 'package:dedicaldemo/model/hospitals_model.dart';
import 'package:dedicaldemo/view/helpers/application_utils/color_utils/colors.dart';
import 'package:dedicaldemo/view/helpers/size_config.dart';
import 'package:dedicaldemo/view/widgets/vertical_list_view_widget.dart';
import 'package:flutter/material.dart';

class FilterHospitals extends StatelessWidget {
 final List<HospitalsModel>? hospitals;
   const FilterHospitals({Key? key , this.hospitals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: VerticalListView(
          itemCount: hospitals!.length ,
          listChildren:(context ,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //color: Colors.blue,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius:
                    BorderRadius.all(Radius.circular(SizeConfig().fontSize13))),
                width: SizeConfig().screenWidth,
                height: SizeConfig().screenHeight*.2,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: SizeConfig().fontSize17 ,
                          top: SizeConfig().fontSize16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(hospitals![index].name??"" ,
                            style:  TextStyle(
                                fontSize: SizeConfig().fontSize16,
                                color: Colors.black
                            ),),
                          Text(hospitals![index].specialty??"" ,
                            style:  TextStyle(
                                fontSize: SizeConfig().fontSize14,
                                color: Colors.black
                            ),),
                          Text(hospitals![index].address??"" ,

                            maxLines: 2,
                            style:  TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: SizeConfig().fontSize13,
                                color: Colors.black
                            ),),
                          Row(
                            children: [
                              Text("Governorate : " ,
                                style:  TextStyle(
                                    fontSize: SizeConfig().fontSize13,
                                    color: Colors.white
                                ),),
                              Text(hospitals![index].governorate??"" ,
                                style:  TextStyle(
                                    fontSize: SizeConfig().fontSize13,
                                    color: Colors.lime
                                ),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("City : " ,
                                style:  TextStyle(
                                    fontSize: SizeConfig().fontSize13,
                                    color: Colors.white
                                ),),
                              Text(hospitals![index].city??"" ,
                                style:  TextStyle(
                                    fontSize: SizeConfig().fontSize13,
                                    color: Colors.lime
                                ),),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),

    );
  }
}
