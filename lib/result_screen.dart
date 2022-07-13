import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double result;

  final String resultText;
  final Color stateColor;
  final String bg;

  ResultScreen({
    required this.result,
    required this.resultText,
    required this.stateColor,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    String resultBMI = result.toStringAsFixed(0);
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage("assets/bg6.png"),
            // fit: BoxFit.fitWidth,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: he * 0.3),
              Center(
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: wi * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: he * 0.025),
                        Text(
                          ':شما BMI',
                          style: TextStyle(
                            fontSize: wi * 0.055,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(resultBMI,
                            style: TextStyle(
                              fontSize: wi * 0.3,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$resultText',
                                style: TextStyle(
                                  fontSize: wi * 0.05,
                                  color: stateColor,
                                ),
                                textAlign: TextAlign.center),
                            Text(' : وضعیت شما',
                                style: TextStyle(
                                  fontSize: wi * 0.05,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        SizedBox(height: he * 0.025),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: he * 0.02),
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      primary: Colors.white,
                      minimumSize: Size(347, 47),
                      backgroundColor: Colors.blue[900]),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'محاسبه جدید',
                    style: TextStyle(fontSize: wi * 0.055),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
