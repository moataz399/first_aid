import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_aid/data/models/data_model.dart';
import 'package:first_aid/data/repo/repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final Repository repository;

  AppCubit(this.repository) : super(AppInitial());

  static AppCubit of(context) => BlocProvider.of(context);

  FirstAidData? firstAidData;

 Future<void> getData() async {

   emit(Loading());
    firstAidData = await repository.getData();

   emit(DataLoaded());
  }

  Future<void> logOut() async {
    FirebaseAuth.instance.signOut();
  }
}
