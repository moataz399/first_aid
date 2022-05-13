import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_aid/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());


  void userRegister(
      {required String email,
        required String password,
        required String name,
       }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
        name: name,
        email: email,
        password: password,
        uId: value.user!.uid,
      );
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String password,
    required String name,
    required String uId,

  })
  {
    UserModel model = UserModel(
      name: name,
      email: email,
      password: password,
      uId: uId,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(UserCreateSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UserCreateErrorState(error));
    });
  }

  Widget suffixIcon = Icon(Icons.remove_red_eye_outlined);
  bool isPasswordShown = false;

  void changeSuffixIcon() {
    isPasswordShown = !isPasswordShown;
    suffixIcon = isPasswordShown
        ? Icon(Icons.visibility_off)
        : Icon(Icons.remove_red_eye_outlined);
    emit(ChangeRegisterPasswordMode());
  }

}
