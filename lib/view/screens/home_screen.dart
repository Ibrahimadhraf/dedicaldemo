import 'package:dedicaldemo/view/helpers/application_utils/color_utils/colors.dart';
import 'package:dedicaldemo/view/helpers/size_config.dart';
import 'package:dedicaldemo/view/widgets/costume_button.dart';
import 'package:dedicaldemo/view/widgets/vertical_list_view_widget.dart';
import 'package:dedicaldemo/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomeScreenViewModel>(
      init: Get.put(HomeScreenViewModel()),
      builder: (ref) => Scaffold(
        body: VerticalListView(
            itemCount: ref.hospitalsList.length,
            listChildren: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //color: Colors.blue,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig().fontSize13))),
                  width: SizeConfig().screenWidth,
                  height: SizeConfig().screenHeight * .2,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig().fontSize17,
                            top: SizeConfig().fontSize16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              ref.hospitalsList[index].name ?? "",
                              style: TextStyle(
                                  fontSize: SizeConfig().fontSize16,
                                  color: Colors.black),
                            ),
                            Text(
                              ref.hospitalsList[index].specialty ?? "",
                              style: TextStyle(
                                  fontSize: SizeConfig().fontSize14,
                                  color: Colors.black),
                            ),
                            Text(
                              ref.hospitalsList[index].address ?? "",
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: SizeConfig().fontSize13,
                                  color: Colors.black),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Governorate : ",
                                  style: TextStyle(
                                      fontSize: SizeConfig().fontSize13,
                                      color: Colors.white),
                                ),
                                Text(
                                  ref.hospitalsList[index].governorate ?? "",
                                  style: TextStyle(
                                      fontSize: SizeConfig().fontSize13,
                                      color: Colors.lime),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "City : ",
                                  style: TextStyle(
                                      fontSize: SizeConfig().fontSize13,
                                      color: Colors.white),
                                ),
                                Text(
                                  ref.hospitalsList[index].city ?? "",
                                  style: TextStyle(
                                      fontSize: SizeConfig().fontSize13,
                                      color: Colors.lime),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () {
            showPlatformDialog(
              context: context,
              builder: (_) => BasicDialogAlert(
                title: const Text("Filters"),
                content: SizedBox(
                  height: SizeConfig().screenHeight * .2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CostumeButton(
                        onPress: () {
                          Navigator.pop(context);
                          ref.openFilterSpecialistDialog();
                        },
                        text: "Specialist",
                      ),
                      CostumeButton(
                        onPress: () {},
                        text: " Specialist & address ",
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  BasicDialogAction(
                    title: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
          tooltip: 'Filter',
          child: const Icon(Icons.filter_alt_rounded),
        ),
      ),
    );
  }
}
