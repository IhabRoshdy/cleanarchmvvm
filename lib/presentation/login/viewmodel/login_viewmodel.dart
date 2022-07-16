import 'dart:async';

import 'package:cleanarchmvvm/domain/usecase/login_usecase.dart';
import 'package:cleanarchmvvm/presentation/base/base_view_model.dart';
import 'package:cleanarchmvvm/presentation/common/freezed_data_class.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");
  final LoginUsecase _loginUsecase;

  LoginViewModel(this._loginUsecase);

  // Inputs

  @override
  void dispose() {
    _usernameStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {}

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  setPassword(String password) {
    // Password is passed from view and added to streamController's sink
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  setUsername(String username) {
    // Username is passed from view and added to streamController's sink
    inputUsername.add(username);
    loginObject = loginObject.copyWith(username: username);
    inputAreAllInputsValid.add(null);
  }

  @override
  login() async {
    (await _loginUsecase.execute(
            LoginUsecaseInput(loginObject.username, loginObject.password)))
        .fold((failure) => {}, (data) => {});
  }

  // Outputs

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _usernameStreamController.stream
      .map((username) => _isUsernameValid(username));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username) {
    return username.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isUsernameValid(loginObject.username) &&
        _isPasswordValid(loginObject.password);
  }
}

// Inputs, from view to viewmodel
abstract class LoginViewModelInputs {
  setUsername(String username);
  setPassword(String password);
  login();

  Sink get inputUsername;
  Sink get inputPassword;
  Sink get inputAreAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreAllInputsValid;
}
