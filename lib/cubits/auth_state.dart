part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthStateUnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthStateAuthenticated extends AuthState {
  final User authenticatedUser;

  AuthStateAuthenticated(this.authenticatedUser);

  @override
  List<Object> get props => [authenticatedUser];
}
