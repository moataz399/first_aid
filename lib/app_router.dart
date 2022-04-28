import 'package:first_aid/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:first_aid/business_logic/cubit/register_cubit/register_cubit.dart';
import 'package:first_aid/presentation/screens/home_screens/details_page.dart';
import 'package:first_aid/presentation/screens/register/signup_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';
import 'presentation/screens/home_screens/home_page.dart';
import 'presentation/screens/home_screens/learn_page.dart';
import 'presentation/screens/register/login_page.dart';
import 'presentation/screens/register/register_page.dart';

class AppRouter {
  late LoginCubit loginCubit;
  late RegisterCubit registerCubit;

  AppRouter() {
    late String initialRoute;
    loginCubit = LoginCubit();
    registerCubit = RegisterCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      // case mainSplashScreen:
      //   return MaterialPageRoute(builder: (_) => MainSplashScreen());
      case detailsPage:
        return MaterialPageRoute(builder: (_) => DetailsPage());
      case learnPage:
        return MaterialPageRoute(builder: (_) => LearnPage());
      case registerPage:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case loginPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: LoginPage(),
                ));
      case signUpPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterCubit(),
                  child: SignUpPage(),
                ));
    }
  }
}
