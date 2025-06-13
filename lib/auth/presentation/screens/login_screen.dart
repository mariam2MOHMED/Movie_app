import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviesapp/auth/presentation/screens/register_screen.dart';

import '../../../core/utils/app_theme.dart';
import '../../../core/utils/enum.dart';
import '../../../home_page.dart';
import '../../domain/entities/user.dart';
import '../controller/auth_bloc.dart';
import '../controller/auth_event.dart';
import '../controller/auth_state.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_txt_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
//  final logger = Logger();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          print("State: ${state.loginRequestState}");
          if (state.loginRequestState != RequestState.loading) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop(); // Dismiss dialog
            }
          }

          switch (state.loginRequestState) {
            case RequestState.loading:
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LoadingAnimationWidget.inkDrop(
                        color: AppTheme.primaryColor,
                        size: 50.sp,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Loading...",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              );
              break;

            case RequestState.loaded:
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
              );
              break;

            case RequestState.error:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Login failed: ${state.loginErrorMessage ?? 'Unknown error'}",
                  ),
                ),
              );
              print("Error in login: ${state.loginErrorMessage}");
              break;

            default:
              print("Unhandled state: ${state.loginRequestState}");
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Welcome Back",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomTxtFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "E-mail must not be empty";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    isPassword: false,
                    hint: "E-mail",
                    icon: Icons.email,
                  ),
                  SizedBox(height: 20.h),
                  CustomTxtFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password must not be empty";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    isPassword: true,
                    hint: "Password",
                    icon: Icons.lock,
                  ),
                  SizedBox(height: 30.h),
                  CustomBtn(
                    title: "Login",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {

                     print("Form validated, triggering login event");
                     BlocProvider.of<AuthBloc>(context).add(
                       GetLoginEvent(

                         user: User(

                           email: emailController.text,
                           password: passwordController.text,
                         ),
                       ),
                     );
                     Navigator.of(context).pushAndRemoveUntil(
                       MaterialPageRoute(builder: (context) => HomePage()),
                           (Route<dynamic> route) => false,
                     );
                   }
                      else {
                     print("Form validation failed");
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text(
                        "Don't have an account",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
