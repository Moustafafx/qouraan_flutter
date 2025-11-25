import 'package:flutter/material.dart';

import 'package:qouraan_flutter/features/presentation/screens/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  Home(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
     //   child: Lottie.asset('assets/WESSAL.PNG'),
      ),
    );
  }
}
