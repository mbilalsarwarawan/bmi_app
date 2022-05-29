import 'package:bmi_app/constant/constants/app_constants.dart';
import 'package:bmi_app/widgets/left_bar.dart';
import 'package:bmi_app/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiText = 0;
  String resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                child: TextField(
                  controller: heightController,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8))),
                ),
              ),
              Container(
                width: 130,
                child: TextField(
                  controller: weightController,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8))),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              double h = double.parse(heightController.text);
              double w = double.parse(weightController.text);
              setState(() {
                bmiText = w / (h * h);
                if (bmiText > 25) {
                  resultText = "You are Overweight";
                } else if (bmiText < 18) {
                  resultText = "You are Underweight";
                } else {
                  resultText = "You have normal weight";
                }
              });
            },
            child: Container(
              child: Text(
                'Calculate',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              bmiText.toStringAsFixed(2),
              style: TextStyle(fontSize: 90, color: accentHexColor),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Visibility(
            visible: resultText.isNotEmpty,
            child: Container(
              child: Text(
                resultText,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          LeftBar(
            barWidth: 40,
          ),
          SizedBox(
            height: 20,
          ),
          LeftBar(
            barWidth: 70,
          ),
          SizedBox(
            height: 20,
          ),
          LeftBar(
            barWidth: 40,
          ),
          SizedBox(
            height: 20,
          ),
          RightBar(
            barWidth: 70,
          ),
          SizedBox(
            height: 50,
          ),
          RightBar(
            barWidth: 70,
          ),
        ],
      )),
    );
  }
}
