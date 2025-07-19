import 'package:e_commerce_app/features/auth/domain/entity/auth_entity.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/colors.dart';
import '../../../../../core/route/rout_names.dart';
import '../../widgets/arrow.dart';
import '../../widgets/log_in_elevated.dart';
import '../../widgets/log_in_forms.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onRegisterPressed() {
    if (_formKey.currentState!.validate()) {
      final user = AuthEntity(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        name:
        "${_firstNameController.text.trim()} ${_lastNameController.text.trim()}",
        role: 'customer',
        avatar:
        'https://api.lorem.space/image/face?w=640&h=480&r=${DateTime.now().millisecondsSinceEpoch}',
      );

      BlocProvider.of<AuthBloc>(context).add(RegisterUserEvent(user));
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is AuthSuccess) {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, RouteNames.homePage);
          } else if (state is AuthError) {
            Navigator.pop(context); // close the dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                const SizedBox(height: 20),
                LogInForms(controller: _firstNameController, label: "First Name"),
                const SizedBox(height: 12),
                LogInForms(controller: _lastNameController, label: "Last Name"),
                const SizedBox(height: 12),
                LogInForms(controller: _emailController, label: "Email Address"),
                const SizedBox(height: 12),
                LogInForms(
                  controller: _passwordController,
                  label: "Password",
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                LogInElevated(text: "Continue", onPressed: _onRegisterPressed),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "You already have an account? ",
                      style: TextStyle(color: AppColors.textColor, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signInEmail);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.textColor,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text("Sign In"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
