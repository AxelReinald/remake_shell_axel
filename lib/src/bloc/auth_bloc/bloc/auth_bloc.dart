import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:remake_shell_axel/src/repository/reop_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthLoading()) {
    on<LoginEvent>((event, emit) async {
      // TODO: implement event handler
      emit(AuthLoading());
      final result = await _authRepo.login(event.email, event.password);
      if (result != "user not found") {
        emit(AuthSuccess());
      }
      if (result == "user not found") {
        emit(AuthError("Missing password or user not found"));
      }
    });
  }
}
