import 'package:bmi_calc/constants.dart';
import 'package:bmi_calc/theme/theme.dart';

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'YOUR RESULT',
                style: kLabelTextStyle.copyWith(
                    color: kActivecolor, fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: kOverlayColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$wtname',
                    style: kLabelTextStyle.copyWith(fontSize: 26.0),
                  ),
                  const SizedBox(height: 40.0),
                  Image.asset('assets/images/$imgname.png'),
                  const SizedBox(height: 40.0),
                  Center(
                    child: Text(
                      'Your Body Mass Index is $bmi.',
                      style: kLabelTextStyle.copyWith(fontSize: 22.0),
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
      wtname = 'UNDER WEIGHT';
    case >= 18.5 && < 25:
      imgname = 'normalwt';
      wtname = 'NORMAL WEIGHT';
    case >= 25 && < 30:
      imgname = 'overwt';
      wtname = 'OVER WEIGHT';
    case >= 30 && < 35:
      imgname = 'obese';
      wtname = 'OBESE';
    case >= 35:
      imgname = 'extremelyobese';
      wtname = 'EXTREMELY OBESE';
    default:
      break;
  }
}
