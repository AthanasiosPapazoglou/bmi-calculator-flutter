import 'package:flutter/material.dart';

class GenderSet extends StatelessWidget {
  final String fieldText;
  final IconData fieldIcon;

  GenderSet({@required this.fieldText, @required this.fieldIcon});

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
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
