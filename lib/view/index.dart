import 'package:dedicaldemo/view/home_widgets/map_screen.dart';
import 'package:dedicaldemo/viewModels/bottom_nav_controller.dart';
import 'package:dedicaldemo/viewModels/filter_viewmodel.dart';
import 'package:dedicaldemo/viewModels/places_viewModel.dart';
import 'package:dedicaldemo/viewModels/speciality_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/application_utils/dialogs/helper_dialog.dart';
import 'helpers/application_utils/enums/filter_enum.dart';
import 'home_widgets/list_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var placesController = Provider.of<PlacesViewModel>(context, listen: false);
    var specsController = Provider.of<SpecViewModel>(context, listen: false);

    placesController.getAllPlaces();
    specsController.getAllSpecs();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BottomNavViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            HelperDialogs.showFilterDialog(
                context: context, type: IndexScreenWType.MAP);
          },
          child: Icon(Icons.menu),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.index,
          onTap: (i) {
            controller.changeTab(i);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.map), title: Text('Locations')),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), title: Text('Places'))
          ]),
      body: (controller.index == 0) ? MapScreen() : ListScreen(),
    );
  }
}
