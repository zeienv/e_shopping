//
// import 'package:flutter/material.dart';
//
// import '../../../../../core/common/colors.dart';
// import '../../../../../core/route/rout_names.dart';
// import '../../widgets/log_in_elevated.dart';
// import '../../widgets/log_in_forms.dart';
// class SignInPassword extends StatelessWidget {
//   const SignInPassword({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//
//       body: Padding(
//         padding: EdgeInsets.only(right: 20, left: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Sign In",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 32,
//               ),
//             ),
//             const SizedBox(height: 20,),
//             LogInForms(text: "Password"),
//             const SizedBox(height: 20,),
//          LogInElevated(text: "Continue", onPressed: (){
//           Navigator.pushNamed(context, RouteNames.homePage);
//          }),
//             const SizedBox(height: 20,),
//             Row(children: [
//               const Text(
//                 "Forgot Password? ",
//                 style: TextStyle(color: AppColors.textColor, fontSize: 15),
//               ),
//               TextButton(onPressed: (){
//                 //Navigator.pushNamed(context, RouteNames.resetPage);
//               }, style: TextButton.styleFrom(
//                 foregroundColor: AppColors.textColor,
//                 textStyle: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//
//
//               ),
//                 child: const Text(
//                   "Reset",
//                 ),)
//             ],),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
