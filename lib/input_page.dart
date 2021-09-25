import 'package:flutter/material.dart';

const bottomContainerHeight = 70.0;
const fieldsColor = Color(0xFF1D1E33);
const calculateColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour: fieldsColor),
              ),
              Expanded(child: ReusableCard(colour: fieldsColor),
              ),
            ],
          ),
        ),
          Expanded(child: ReusableCard(colour: fieldsColor),
              ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour: fieldsColor),
              ),
              Expanded(child: ReusableCard(colour: fieldsColor),
              ),
            ],
          ),
        ),
        Container(
          color: calculateColor,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: bottomContainerHeight,
        )
       ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {

  final Color colour;

  ReusableCard({@required this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10),
          ),
        );
  }
}
