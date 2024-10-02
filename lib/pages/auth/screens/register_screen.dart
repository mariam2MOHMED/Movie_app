import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/pages/auth/B-logic/firebase_services.dart';
import 'package:movie_app/pages/auth/screens/login_screen.dart';
import 'package:movie_app/pages/auth/view/widgets/custom_auth_txt_field.dart';
import 'package:movie_app/pages/auth/view/widgets/custom_dft_auth_btn.dart';
import 'package:movie_app/shared/theme/theme.dart';

class registerScreen extends StatefulWidget {
  static const String routeName="/registerScreen";
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {


  var emailControll=TextEditingController();
  var passwordControll=TextEditingController();
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
                child: Text("Create\n Account",style: GoogleFonts.abhayaLibre(
                  fontSize:40.sp,
                    color:AppTheme.gold,
                  fontWeight:FontWeight.bold
                ),),
              ),
              SizedBox(height: 24.h,),
              customAuthTextField(controller: emailControll,
                  label: "email",
                  isPassword: false,
                  prefixIcon: Icons.email),
              SizedBox(height: 24.h,),
              customAuthTextField(controller: passwordControll,
                  label: "Password",
                  isPassword: true,
                  prefixIcon: Icons.password),
              SizedBox(height: 24.h,),
              customButton(txt: "Create Account", onPressed: (){
                try{
                 Auth.login(emailControll.text, passwordControll.text);
                  Navigator.of(context).pushNamed(loginScreen.routeName);
                }catch(e){
                  print("the error is $e");
                }
              }),
              SizedBox(height: 24.h,),
              Row(
                children: [
                  Text("Already have an account  ",style: GoogleFonts.abhayaLibre(
                      fontSize:20.sp,
                      color:AppTheme.gold,
                      fontWeight:FontWeight.bold
                  ),),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(loginScreen.routeName);
                    },
                    child: Text("Login",style: GoogleFonts.abhayaLibre(
                        fontSize:20.sp,
                        color:AppTheme.gold,
                        fontWeight:FontWeight.bold
                    ),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
