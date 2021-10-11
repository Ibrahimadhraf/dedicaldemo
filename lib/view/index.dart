import 'package:dedicaldemo/view/home_widgets/map_screen.dart';
import 'package:dedicaldemo/viewModels/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.index.value,
            onTap: (i) {
              controller.changeTab(i);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.map), title: Text('Map')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu), title: Text('List'))
            ]),
        body: (controller.index.value == 0) ? MapScreen() : Container(),
      ),
    );
  }
}
