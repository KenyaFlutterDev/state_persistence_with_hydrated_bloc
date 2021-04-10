part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginStateInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginStateProgress extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginStateSuccess extends LoginState {
  final User user;

  LoginStateSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class LoginStateFail extends LoginState {
  final Exception e;

  LoginStateFail(this.e);

  @override
  List<Object> get props => [e];
}
