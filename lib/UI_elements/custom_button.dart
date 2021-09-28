import 'package:flutter/material.dart';
import '../components/constants.dart';

//fully Custom made Button from scratch
//We use a very basic building block therefore we can customise fundamentally
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function
      tapAction; //This function will be called when the widget is Pressed

  RoundIconButton({@required this.icon, @required this.tapAction});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed:
          tapAction, //This activates when widget gets pressed, calls the tapAction function
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
