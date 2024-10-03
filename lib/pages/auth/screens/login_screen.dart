import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/home_page.dart';
import 'package:movie_app/pages/auth/B-logic/firebase_services.dart';
import 'package:movie_app/pages/home_screen/view/screens/Home_screen.dart';

import '../../../shared/theme/theme.dart';
import '../view/widgets/custom_auth_txt_field.dart';
import '../view/widgets/custom_dft_auth_btn.dart';

class loginScreen extends StatefulWidget {
  static const String routeName="/loginScreen";
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  TextEditingController emailControll=TextEditingController();
  TextEditingController passwordControll=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text("Sign In",
                  style: GoogleFonts.abhayaLibre(
                    fontSize:40.sp,
                    color:AppTheme.gold,
                    fontWeight:FontWeight.bold
                ),),
              ),
              SizedBox(height: 24.h,),
              customAuthTextField(controller: emailControll,
                  label: "Email",
                  isPassword: false,
                  prefixIcon: Icons.email),
              SizedBox(height: 24.h,),
              customAuthTextField(controller: passwordControll,
                  label: "Password",
                  isPassword: true,
                  prefixIcon: Icons.password),
              SizedBox(height: 24.h,),
              customButton(txt: "Login", onPressed: (){
                try{
                Auth.login(emailControll.text.trim(),
                    passwordControll.text.trim());
                  Navigator.of(context).
                  push(
                      MaterialPageRoute(builder:
                          (context)=>HomePage())
                  );
                }catch(e){
                  print("the error in sign in is $e");
                }

              }),

            ],
          ),
        ),
      ),
    );
  }
}
