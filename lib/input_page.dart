import 'package:bmi_calc/result_page.dart';
import 'package:bmi_calc/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'package:bmi_calc/reuable_card.dart';

import 'main.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActivecolor
                          : kInactivecolor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: ('MALE'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActivecolor
                          : kInactivecolor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: ('FEMALE'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              colour: kInactivecolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBoldNumbersStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.red,
                        activeTrackColor: Colors.red,
                        overlayColor: kOverlayColor,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 20.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      label: '$height',
                      inactiveColor: kBgcolor,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {},
                    child: ReusableCard(
                      colour: kInactivecolor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBoldNumbersStyle,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () => setState(
                                  () {
                                    weight--;
                                  },
                                ),
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () => setState(
                                  () {
                                    weight++;
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    colour: kInactivecolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBoldNumbersStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => setState(
                                () {
                                  age--;
                                },
                              ),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => setState(
                                () {
                                  age++;
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              bmicalc(height, weight);
              print('BMI is$bmi');
              getiamge(bmi);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ResultPage();
                  },
                ),
              );
            },
            child: Container(
              color: kInactivecolor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomBarHeight,
              child: Center(
                child: Text(
                  'Calculate BMI',
                  style: kLabelTextStyle.copyWith(
                      fontSize: 30.0, color: kActivecolor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void bmicalc(int h, int w) {
    double dh = (h / 100);
    bmi = w / (dh * dh);
    bmi = double.parse(bmi.toStringAsFixed(2)); // Round to 2 decimal places
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed; // Good

  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      onPressed: () => onPressed(),
      elevation: 10.0,
      highlightElevation: 10.0,
      fillColor: kBgcolor,
      splashColor: Colors.red,
      child: Icon(
        icon,
        color: Colors.redAccent,
      ),
    );
  }
}
