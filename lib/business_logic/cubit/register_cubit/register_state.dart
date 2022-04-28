part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}




class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{
}
class RegisterErrorState extends RegisterState{

  final String error ;

  RegisterErrorState(this.error);
}

class ChangeRegisterPasswordMode extends RegisterState{}



class UserCreateLoadingState extends RegisterState{}
class UserCreateSuccessState extends RegisterState{
}
class UserCreateErrorState extends RegisterState{

  final String error ;

  UserCreateErrorState(this.error);
}