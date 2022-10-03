// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  const InitialLoginState();

  @override
  List<Object?> get props => [];
}

class UserNotLoggedIn extends LoginState {
  const UserNotLoggedIn();

  @override
  List<Object?> get props => [];
}

class UserLoggedIn extends LoginState {
  const UserLoggedIn();

  @override
  List<Object?> get props => [];
}

/*class UsernameValid extends LoginState {
  final bool isUsernameValid;
  const UsernameValid({
    required this.isUsernameValid,
  });

  @override
  List<Object> get props => [isUsernameValid];
}

class PasswordValid extends LoginState {
  final bool isPasswordValid;
  const PasswordValid({
    required this.isPasswordValid,
  });

  @override
  List<Object> get props => [isPasswordValid];
}

class AllInputsValid extends LoginState {
  final bool areAllInputsValid;
  const AllInputsValid({
    required this.areAllInputsValid,
  });

  @override
  List<Object?> get props => [areAllInputsValid];
}*/

class InputsValidState extends LoginState {
  final bool isUsernameValid;
  final bool isPasswordValid;
  final bool areAllInputsValid;

  const InputsValidState({
    required this.isUsernameValid,
    required this.isPasswordValid,
    required this.areAllInputsValid,
  });

  @override
  List<Object?> get props =>
      [isUsernameValid, isPasswordValid, areAllInputsValid];
}
