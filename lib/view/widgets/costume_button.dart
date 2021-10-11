
import 'package:dedicaldemo/view/helpers/size_config.dart';
import 'package:flutter/material.dart';

class CostumeButton extends StatelessWidget {
 final String? text;
 final VoidCallback? onPress;

 const CostumeButton({Key? key, this.text, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Padding(
        padding:  EdgeInsets.all(SizeConfig().fontSize14),
        child: Text(text??"",style: TextStyle(
          color: Colors.blue,
              fontSize: SizeConfig().fontSize14,
        ),),
      ),
      onPressed: onPress,

      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
      ),
    );
  }
}
