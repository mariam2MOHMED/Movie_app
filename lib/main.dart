import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth/domain/use_cases/get_add_movie_to_wishlist_use_case.dart';
import 'auth/domain/use_cases/get_delete_movie_use_case.dart';
import 'auth/domain/use_cases/get_get_movie_to_wishlist_use_case.dart';
import 'auth/domain/use_cases/get_login_use_case.dart';
import 'auth/domain/use_cases/get_register_use_case.dart';
import 'auth/presentation/controller/auth_bloc.dart';
import 'auth/presentation/screens/register_screen.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/service_locator.dart';
import 'firebase_options.dart';
import 'home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScreenUtilInit(
    designSize: const Size(412, 870),
    minTextAdapt: true,
    splitScreenMode: true,
    child: BlocProvider(
      create: (BuildContext context) => AuthBloc(
          getit<GetRegisterUseCase>(),
          getit<GetLoginUseCase>(),
          getit<GetAddMovieToWishListUseCase>(),
          getit<GetGetMoviesToWishListUseCase>(),
          getit<GetDeleteMovieToWishListUseCase>()
      ),
      child: const MovieApp(),
    ),
  ));
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:
      //FirebaseAuth.instance.currentUser!.uid!=null?
       const RegisterScreen() ,
      // HomePage(),
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
    );

  }
}