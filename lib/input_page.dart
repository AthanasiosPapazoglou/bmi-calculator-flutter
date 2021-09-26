import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable_card.dart';
import 'card_UIcontent.dart';
import 'constants.dart';

enum Gender { male, female }
Gender selectedGender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveColor;
  Color femaleCardColor = kInactiveColor;
  int currentSliderHeight = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: ContentSet(
                      fieldIcon: FontAwesomeIcons.mars,
                      fieldText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: ContentSet(
                      fieldIcon: FontAwesomeIcons.venus,
                      fieldText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kFieldsColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelsTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        currentSliderHeight.toString(),
                        style: kIconsTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelsTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 22.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      
                    ),
                    child: Slider(
                      value: currentSliderHeight.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                           setState(() {
                             currentSliderHeight = newValue.round();
                           });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kFieldsColor),
                ),
                Expanded(
                  child: ReusableCard(colour: kFieldsColor),
                ),
              ],
            ),
          ),
          Container(
            color: kCalculateColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
