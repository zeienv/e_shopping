import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/common/colors.dart';
import '../../../../core/route/rout_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), (){
     Navigator.pushReplacementNamed(context, RouteNames.signInEmail);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Center(
        child: Image.asset("assets/images/img.png"),

      ),
    );
  }
}
