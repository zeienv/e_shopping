import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/colors.dart';
import '../../../../../core/route/rout_names.dart';
import '../../bloc/log_in/log_in_bloc.dart';
import '../../bloc/log_in/log_in_event.dart';
import '../../bloc/log_in/log_in_state.dart';
import '../../widgets/log_in_elevated.dart';
import '../../widgets/log_in_forms.dart';
import '../../widgets/sign_in_widget.dart';
import '../../../../../service_locator.dart'; // make sure you have this

class SignInEmail extends StatefulWidget {
  const SignInEmail({super.key});

  @override
  State<SignInEmail> createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onContinuePressed() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginUserEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<LoginBloc>(), // Inject your LoginBloc from service_locator
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            } else if (state is LoginSuccess) {
              Navigator.pop(context); // Close dialog
              Navigator.pushNamed(context, RouteNames.homePage);
            } else if (state is LoginFailure) {
              Navigator.pop(context); // Close dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SignInWidget(
                      text: "Email Address",
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    LogInForms(
                      controller: _passwordController,
                      label: "Password",
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    LogInElevated(
                      text: "Continue",
                      onPressed: _onContinuePressed,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "Don't have an Account?",
                          style: TextStyle(color: AppColors.textColor, fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RouteNames.createAccount);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.textColor,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text("Create One"),
                        )
                      ],
                    ),
                    const SizedBox(height: 50),
                    elevatedButton(Icons.apple, "Continue with Apple"),
                    const SizedBox(height: 20),
                    elevatedButton(Icons.g_mobiledata, "Continue with Google"),
                    const SizedBox(height: 20),
                    elevatedButton(Icons.facebook, "Continue with Facebook"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget elevatedButton(IconData icon, String text) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white10,
      minimumSize: const Size(double.infinity, 60),
    ),
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 16),
      ],
    ),
  );
}
