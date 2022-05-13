import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void userLogin({required String email, required String password}) {
    emit(LoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  Widget suffixIcon =  Icon(Icons.remove_red_eye_outlined);
  bool isPasswordShown = false;

  void changeSuffixIcon() {
    isPasswordShown = !isPasswordShown;
    suffixIcon = isPasswordShown
        ? Icon(Icons.visibility_off)
        : Icon(Icons.remove_red_eye_outlined);
    emit(ChangeLoginPasswordMode());
  }


  Future<void> logOut() async {
    FirebaseAuth.instance.signOut();
  }
 }
