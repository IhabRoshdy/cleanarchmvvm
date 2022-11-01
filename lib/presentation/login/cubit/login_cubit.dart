import 'package:bloc/bloc.dart';
import 'package:cleanarchmvvm/domain/usecase/login_usecase.dart';
import 'package:cleanarchmvvm/presentation/base/cubit/base_cubit.dart';
import 'package:cleanarchmvvm/presentation/common/freezed_data_class.dart';
import 'package:cleanarchmvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUsecase)
      : super(const InputsValidState(
          isUsernameValid: true,
          isPasswordValid: true,
          areAllInputsValid: false,
        ));

  var _loginObject = LoginObject("", "");
  final LoginUsecase _loginUsecase;
  var _inputsValidState = const InputsValidState(
    areAllInputsValid: false,
    isPasswordValid: true,
    isUsernameValid: true,
  );

  void setUsername(String username) async {
    _loginObject = _loginObject.copyWith(username: username);
    _validateUsernameInput();
  }

  void setPassword(String password) async {
    _loginObject = _loginObject.copyWith(password: password);
    _validatePasswordInput();
  }

  void _validateUsernameInput() {
    bool isUsernameValid = _loginObject.username.isNotEmpty;
    bool areAllInputsValid =
        _loginObject.username.isNotEmpty && _loginObject.password.isNotEmpty;
    _inputsValidState = _inputsValidState.copyWith(
      isUsernameValid: isUsernameValid,
      areAllInputsValid: areAllInputsValid,
    );
    emit(_inputsValidState);
  }

  void _validatePasswordInput() {
    bool isPasswordValid = _loginObject.password.isNotEmpty;
    bool areAllInputsValid =
        _loginObject.username.isNotEmpty && _loginObject.password.isNotEmpty;
    _inputsValidState = _inputsValidState.copyWith(
      isPasswordValid: isPasswordValid,
      areAllInputsValid: areAllInputsValid,
    );
    emit(_inputsValidState);
  }

  void login(BuildContext context) async {
    BaseCubit baseCubit = BlocProvider.of<BaseCubit>(context);
    baseCubit.switchToLoadingState();
    (await _loginUsecase.execute(
            LoginUsecaseInput(_loginObject.username, _loginObject.password)))
        .fold((failure) {
      baseCubit.switchToErrorState(
          StateRendererType.popupErrorState, failure.message);
    }, (data) {
      baseCubit.switchToContentState();
      emit(const UserLoggedIn());
    });
  }
}
