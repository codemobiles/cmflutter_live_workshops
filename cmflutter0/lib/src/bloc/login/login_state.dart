part of 'login_bloc.dart';

class LoginState extends Equatable {
  final int count;

  const LoginState({this.count = 0});

  LoginState copyWith({int? count}) {
    return LoginState(count: count ?? this.count);
  }

  @override
  List<Object?> get props => [count];
}
