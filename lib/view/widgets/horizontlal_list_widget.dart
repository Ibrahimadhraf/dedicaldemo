
import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {

  final  IndexedWidgetBuilder  listChildren;
  final int? itemCount;

  const HorizontalListView({Key? key,  required  this.listChildren ,@required   this.itemCount } ) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: itemCount,
      itemBuilder:listChildren,
    );
  }


}
