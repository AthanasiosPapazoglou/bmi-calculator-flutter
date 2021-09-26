import 'package:flutter/material.dart';
import 'constants.dart';


class ContentSet extends StatelessWidget {
  final String fieldText;
  final IconData fieldIcon;

  ContentSet({@required this.fieldText, @required this.fieldIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        Icon(
          fieldIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 13.0,
        ),
        Text(
          fieldText,
          style: kLabelsTextStyle,
          ),
      ],
    );
  }
}
