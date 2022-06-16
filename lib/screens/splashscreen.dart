import 'package:bmi_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/constant/constants/app_constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (ctx) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: mainHexColor,
              radius: 80,
              child: Text(
                'BMI',
                style: TextStyle(
                    fontSize: 50,
                    color: accentHexColor,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 50),
            SpinKitDoubleBounce(
              color: accentHexColor,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
