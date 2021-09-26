import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable_card.dart';
import 'card_UIcontent.dart';
import 'constants.dart';

enum Gender { male, female }
Gender selectedGender;

enum NumManipulation {increment, decrement}
NumManipulation numChange;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveColor;
  Color femaleCardColor = kInactiveColor;
  int sliderHeight = 170;
  int currentWeight = 60;
  int currentAge = 25;

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
                        sliderHeight.toString(),
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
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 22.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: sliderHeight.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          sliderHeight = newValue.round();
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
                  child: ReusableCard(
                    colour: kFieldsColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelsTextStyle,
                        ),
                        Text(
                          currentWeight.toString(),
                          style: kIconsTextStyle,
                        ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             RoundIconButton(icon: FontAwesomeIcons.minus,
                             tapAction: () { //We specify the CodeB of tapAction Here NOT within the widget
                               setState(() {
                                 currentWeight--;
                               });
                             },),
                              SizedBox(
                                width: 8,
                              ),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                              tapAction: () { //We specify the CodeB of tapAction Here NOT within the widget
                               setState(() {
                                 currentWeight++;
                               });
                             },),
                           ],
                         ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kFieldsColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelsTextStyle,
                        ),
                        Text(
                          currentAge.toString(),
                          style: kIconsTextStyle,
                        ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             RoundIconButton(icon: FontAwesomeIcons.minus,
                             tapAction: () { //We specify the CodeB of tapAction Here NOT within the widget
                               setState(() {
                                 currentAge--;
                               });
                             },),
                              SizedBox(
                                width: 8,
                              ),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                              tapAction: () { //We specify the CodeB of tapAction Here NOT within the widget
                               setState(() {
                                 currentAge++;
                               });
                             },),
                           ],
                         ),
                      ],
                    ),
                  ),
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


//fully Custom made Button from scratch
//We use a very basic building block therefore we can customise fundamentally 
class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function tapAction; //This function will be called when the widget is Pressed

  RoundIconButton({@required this.icon, @required this.tapAction});

  @override 
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: tapAction, //This activates when widget gets pressed, calls the tapAction function
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