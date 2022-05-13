import 'package:first_aid/constants/colors.dart';
import 'package:first_aid/presentation/screens/home_screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/app_cubit.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          "Learn",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await BlocProvider.of<AppCubit>(context).logOut();
              Navigator.pushReplacementNamed(context, 'registerPage');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(child: HomePage()),
          )
        ],
      ),
    );
  }
}
