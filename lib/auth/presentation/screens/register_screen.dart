import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviesapp/auth/presentation/controller/auth_bloc.dart';
import 'package:moviesapp/auth/presentation/controller/auth_event.dart';
import 'package:moviesapp/auth/presentation/widgets/custom_btn.dart';
import 'package:moviesapp/home_page.dart';

import '../../../core/utils/app_theme.dart';
import '../../../core/utils/enum.dart';
import '../../domain/entities/user.dart';
import '../controller/auth_state.dart';
import '../widgets/custom_txt_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formkey=GlobalKey<FormState>();
    var namecontroll=TextEditingController();
    var emailcontroll=TextEditingController();
    var passwordcontroll=TextEditingController();
    return  Scaffold(
        backgroundColor: AppTheme.bg,
                      body: BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    switch(state.registerRequestState){

      case RequestState.loading:
        showDialog(
          context: context,
          barrierDismissible: true,
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
                  "Registering...",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      case RequestState.loaded:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));

      case RequestState.error:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Register failed")),
        );
        print("error in register is ${state.registerErrorMessage}");
    }
  },
  builder: (context, state) {
    return Center(
          child: Form(
            key: formkey,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Create Account, Join to Us",
                    style: Theme.of(context).textTheme.titleLarge,))
               ,SizedBox(height: 30.h,),
              CustomTxtFormField(
                controller: namecontroll,
                  validator: (value){
                    if(value!.isEmpty &&value!=null){
                      return "Name must be not empty";
                    }else{
                      return null;
                    }
                  },
                  isPassword: false,
                  hint: "Name",
                  icon: Icons.person),
              SizedBox(height: 20.h,),
                      CustomTxtFormField(
                        controller: emailcontroll,
                validator: (value){
                  if(value!.isEmpty &&value!=null){
                    return "E-mail must be not empty";
                  }else{
                    return null;
                  }
                },
                isPassword: false,
                hint: "E-mail",
                icon: Icons.email),
                  SizedBox(height: 20.h,),
                  CustomTxtFormField(
                    controller: passwordcontroll,
                      validator: (value){
                        if(value!.isEmpty &&value!=null){
                          return "Password must be not empty";
                        }else{
                          return null;
                        }
                      },
                      isPassword: true,
                      hint: "Password",
                      icon: Icons.lock),
                  SizedBox(height: 30.h,),
              CustomBtn(
                title: "Create Account",
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    BlocProvider.of<AuthBloc>(context).add(
                        GetRegisterEvent(user: User
                          (name: namecontroll.text,
                            email: emailcontroll.text,
                            password: passwordcontroll.text))
                    );


                  }
                },
              ),

                    SizedBox(height: 20.h,),
                  Row(
                    children: [
                    Text("Already have an account",

                      style: Theme.of(context).textTheme.titleLarge,),
                      SizedBox(width: 10.w,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context)=>LoginScreen()));
                        },
                          child: Text(" Login",style: Theme.of(context).textTheme.titleLarge,))
                    ],
                  )

                ],
              ),
            ),
          ),
        );
  },
),
      );
  }
}
