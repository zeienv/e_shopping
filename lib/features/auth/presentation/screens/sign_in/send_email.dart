
import 'package:flutter/material.dart';

import '../../../../../core/common/colors.dart';
import '../../../../../core/route/rout_names.dart';

class SendEmail extends StatelessWidget {
  const SendEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/sms.png"),
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  "We sent you an email to reset \nyour password.",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 159,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.splashColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                     Navigator.pushReplacementNamed(
                         context, RouteNames.signInEmail);
                    },
                    child: const Text(
                      "Return to Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
