import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_persistence_example/models/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginStateInitial());

  void login(Map<String, dynamic> details) {
    emit(LoginStateProgress());

    // mock login process
    try {
      Timer(Duration(seconds: 4), () {
        // create new user
        final user = new User(name: details['name'], email: details['email']);
        emit(LoginStateSuccess(user));
      });
    } catch (e) {
      emit(LoginStateFail(e));
    }
  }
}
