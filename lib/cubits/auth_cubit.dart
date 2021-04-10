import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:state_persistence_example/models/user.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(AuthStateUnAuthenticated());

  void authenticateUser(User user) {
    emit(AuthStateAuthenticated(user));
  }

  void logout() async {
    await clear();
    emit(AuthStateUnAuthenticated());
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    try {
      final authenticatedUser = User.fromJson(json);
      return AuthStateAuthenticated(authenticatedUser);
    } catch (_) {
      return AuthStateUnAuthenticated();
    }
  }

  @override
  Map<String, dynamic> toJson(AuthState state) {
    if (state is AuthStateAuthenticated) {
      return state.authenticatedUser.toJson();
    } else {
      return null;
    }
  }
}
