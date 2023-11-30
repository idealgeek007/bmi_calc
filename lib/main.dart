import 'package:bmi_calc/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color peachPuff = const Color(0x00ffdab9);

const bottomBarHeight = 60.0;

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
      home: const InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    colour: Theme.of(context).colorScheme.secondaryContainer,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: ('MALE'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    colour: Theme.of(context).colorScheme.secondaryContainer,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: ('FEMALE'),
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
                    colour: Theme.of(context).colorScheme.secondaryContainer,
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
                    colour: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    colour: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomBarHeight,
          )
        ],
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(
              icon as IconData?,
              size: 80.0,
            )),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Theme.of(context).primaryColor),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.colour, this.cardChild});

  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
      child: cardChild,
    );
  }
}
