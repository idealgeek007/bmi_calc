// main.dart
import 'package:bmi_calc/reuable_card.dart';
import 'package:bmi_calc/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';

const bottomBarHeight = 60.0;
Color activecolor = const Color(0xff26a59a);
Color inactivecolor = const Color(0xff324b47);
Color bgcolor = const Color(0xffb1ccc7);

enum Gender {
  male,
  female,
}

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: BmiTheme.lightTheme,
      darkTheme: BmiTheme.darkTheme,
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
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
                            ? activecolor
                            : inactivecolor,
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
                            ? activecolor
                            : inactivecolor,
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
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      colour: inactivecolor,
                      // Add content or remove if not needed
                    ),
                  ),
                ],
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
                        colour: inactivecolor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      colour: inactivecolor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: inactivecolor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomBarHeight,
            )
          ],
        ),
      ),
    );
  }
}
