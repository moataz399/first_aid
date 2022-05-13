import 'package:first_aid/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:first_aid/constants/colors.dart';
import 'package:first_aid/constants/strings.dart';
import 'package:first_aid/presentation/widgets/app_icon.dart';
import 'package:first_aid/presentation/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
var _formKey = new GlobalKey<FormState>();
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacementNamed(context, learnPage);
        }
        if (state is LoginErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
          );
          print(state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(left: 30, top: 50, right: 40),
            child: Container(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: AppIcon(
                          icon: Icons.arrow_back_ios,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: BigText(
                          text: 'Log In',
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) =>
                            value!.isEmpty ? 'please enter your email' : null,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        autofocus: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(

                        obscureText: cubit.isPasswordShown,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: cubit.suffixIcon,
                            onPressed: () {
                              cubit.changeSuffixIcon();
                            },
                          ),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        autofocus: false,
                        validator: (value) =>
                            value!.isEmpty ? 'Password is empty ' : null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            print(emailController.text);
                            print(passwordController.text);
                          }
                        },
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.userLogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                            }
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            width: 500,
                            height: 50,
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
