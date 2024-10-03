import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/pages/movie_Detials/view/screens/movie_details_screen.dart';

import 'package:movie_app/home_page.dart';
import 'package:movie_app/pages/auth/screens/login_screen.dart';
import 'package:movie_app/pages/auth/screens/register_screen.dart';
import 'package:movie_app/shared/services/services_locator.dart';
import 'package:movie_app/shared/theme/theme.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
    home: registerScreen()
      ),
    );
  }
}
