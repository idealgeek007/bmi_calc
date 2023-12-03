import 'package:bmi_calc/constants.dart';

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'YOUR RESULT',
                style: kLabelTextStyle.copyWith(color: kActivecolor),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: kActivecolor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$wtname',
                    style: kLabelTextStyle.copyWith(color: kBgcolor),
                  ),
                  const SizedBox(height: 20.0),
                  Image.asset('assets/images/$imgname.png'),
                  const SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      'Your Body Mass Index is $bmi.',
                      style: kLabelTextStyle.copyWith(color: kBgcolor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

getiamge(bmi) {
  switch (bmi) {
    case <= 18.5:
      imgname = 'underwt';
      wtname = 'Under Weight';
    case >= 18.5 && < 25:
      imgname = 'normalwt';
      wtname = 'Normal Weight';
    case >= 25 && < 30:
      imgname = 'overwt';
      wtname = 'Over Weight';
    case >= 30 && < 35:
      imgname = 'obese';
      wtname = 'Obese';
    case >= 35:
      imgname = 'extremelyobese';
      wtname = 'Extremely Obese';
    default:
      break;
  }
}
