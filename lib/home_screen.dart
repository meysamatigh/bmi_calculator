import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bmi_calc/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 170;
  double weight = 60;
  String resultText = '';

  Color stateColor = Colors.purple;
  String bg = '';

  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/bg_home.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: he * 0.55,
                      ),
                      Text(
                        'قد و وزن خود را وارد کنید',
                        style: TextStyle(fontSize: wi * 0.065),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  SizedBox(width: wi * 0.05),
                ],
              ),
              SizedBox(height: he * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wi * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (height).toStringAsFixed(0) + ' Cm',
                      style: TextStyle(
                        fontSize: wi * 0.045,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      'قد ',
                      style: TextStyle(
                        fontSize: wi * 0.045,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                value: height,
                min: 80,
                max: 220,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
                activeColor: Colors.blue[600],
                inactiveColor: Colors.black.withOpacity(0.2),
                thumbColor: Colors.blue[800],
              ),
              SizedBox(
                height: he * 0.015,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wi * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (weight).toStringAsFixed(0) + ' Kg',
                      style: TextStyle(
                        fontSize: wi * 0.045,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      'وزن  ',
                      style: TextStyle(
                        fontSize: wi * 0.045,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                value: weight,
                min: 10.0,
                max: 150.0,
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                },
                activeColor: Colors.blue[600],
                inactiveColor: Colors.black.withOpacity(0.2),
                thumbColor: Colors.blue[800],
              ),
              SizedBox(
                height: he * 0.02,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    primary: Colors.white,
                    minimumSize: Size(347, 47),
                    backgroundColor: Colors.blue[900]),
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  print(result.round());
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ResultScreen(
                        result: result,
                        resultText: resultText,
                        stateColor: stateColor,
                        bg: bg,
                      ),
                    ),
                  );

                  setState(() {
                    if (result < 18.5) {
                      resultText = 'لاغر';
                      stateColor = Colors.lightBlue;
                      bg = 'bg1.png';
                    } else if (result >= 18.5 && result <= 24.9) {
                      resultText = 'متناسب';
                      stateColor = Color(0xFF4CAF50);
                      bg = 'bg2.png';
                    } else if (result >= 25 && result <= 29.9) {
                      resultText = 'چاق';
                      stateColor = Colors.amber;
                      bg = 'bg3.png';
                    } else if (result >= 30 && result <= 34.9) {
                      resultText = 'خیلی چاق';
                      stateColor = Color(0xFFDA5229);
                      bg = 'bg4.png';
                    } else if (result >= 35) {
                      resultText = 'چاق مفرط';
                      stateColor = Color(0xFFB91408);
                      bg = 'bg5.png';
                    }
                  });
                },
                child: Text(
                  'محاسبه',
                  style: TextStyle(fontSize: wi * 0.055),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
