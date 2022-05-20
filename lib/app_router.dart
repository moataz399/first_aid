import 'package:first_aid/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:first_aid/business_logic/cubit/register_cubit/register_cubit.dart';
import 'package:first_aid/data/repo/repos.dart';
import 'package:first_aid/data/web_services/web_services.dart';
import 'package:first_aid/presentation/screens/home_screens/details_page.dart';
import 'package:first_aid/presentation/screens/register/signup_page.dart';
import 'package:first_aid/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/app_cubit.dart';
import 'constants/strings.dart';
import 'data/models/data_model.dart';
import 'presentation/screens/home_screens/home_page.dart';
import 'presentation/screens/home_screens/learn_page.dart';
import 'presentation/screens/register/login_page.dart';
import 'presentation/screens/register/register_page.dart';

class AppRouter {
  late LoginCubit loginCubit;
  late RegisterCubit registerCubit;

  late Repository repository;
  late AppCubit appCubit;

  AppRouter() {
    late String initialRoute;
    loginCubit = LoginCubit();
    registerCubit = RegisterCubit();

    repository = Repository(webServices: WebServices());
    appCubit = AppCubit(repository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AppCubit(repository)..getData(),
                  child: HomePage(),
                ));
      // case mainSplashScreen:
      //   return MaterialPageRoute(builder: (_) => MainSplashScreen());
      case detailsPage:
        return MaterialPageRoute(builder: (_) => DetailsPage(data: settings.arguments as Data));
      case learnPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => appCubit,
                  child: LearnPage(),
                ));
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

      case splashScreen:
        return MaterialPageRoute(
            builder: (_) => SplashScreen());
    }
  }
}
