import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    // Add
    on<LoginEventAdd>((event, emit) {
      // execute something
      emit(state.copyWith(count: state.count + 1));
    });

    // Remove
    on<LoginEventRemove>((event, emit) {
      // execute something
      emit(state.copyWith(count: state.count - 1));
    });
  }
}
