import 'package:dedicaldemo/model/response/places_model_response.dart';
import 'package:dedicaldemo/viewModels/speciality_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  PlaceModel? placeModel;
  DetailsScreen({this.placeModel});
  @override
  Widget build(BuildContext context) {
    var specController = Provider.of<SpecViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(placeModel!.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.red,
              child: Image.asset(placeModel!.img),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
                title: Text("Speciality"),
                trailing: RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {},
                  child: Text(specController.specModelResponse!.specs!
                      .firstWhere((element) => element.id == placeModel!.specId)
                      .name),
                )),
            ListTile(
              title: Text("Price"),
              trailing: Text(placeModel!.price + " LE"),
            ),
            ListTile(
              title: Text("Ins.Discount"),
              trailing: Text(placeModel!.insurranceDiscount.toString() + " %"),
            ),
            ListTile(
              title: Text("Address"),
              trailing: Text(
                  "${placeModel!.country} , ${placeModel!.city} , ${placeModel!.address}"),
            ),
            ListTile(
              onTap: () async {
                await canLaunch(placeModel!.url)
                    ? await launch(placeModel!.url)
                    : throw 'Could not launch ${placeModel!.url}';
              },
              title: Text("Website"),
              trailing: Text(
                "${placeModel!.url}",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            ListTile(
              onTap: () async {
                String url =
                    'https://www.google.com/maps/search/?api=1&query=${placeModel!.latitude},${placeModel!.longitude}';

                await canLaunch(url)
                    ? await launch(url)
                    : throw 'Could not launch $url';
              },
              title: Text("Find Location"),
              trailing: Icon(Icons.location_on),
            ),
          ],
        ),
      ),
    );
  }
}
