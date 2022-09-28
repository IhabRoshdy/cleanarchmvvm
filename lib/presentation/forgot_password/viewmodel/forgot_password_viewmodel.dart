import 'dart:async';

import 'package:cleanarchmvvm/app/functions.dart';
import 'package:cleanarchmvvm/domain/usecase/forgot_password_usecase.dart';
import 'package:cleanarchmvvm/presentation/base/base_view_model.dart';
import 'package:cleanarchmvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:cleanarchmvvm/presentation/common/state_renderer/state_renderer_impl.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  // Checks if email is valid
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  // Enables button after entering a valid email address
  final StreamController _areAllInputValidStreamController =
      StreamController<void>.broadcast();

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  var email = "";

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  forgotPassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _forgotPasswordUseCase.execute(email)).fold((failure) {
      inputState
          .add(ErrorState(StateRendererType.popupErrorState, failure.message));
    }, (supportMessage) {
      inputState.add(SuccessState(message: supportMessage));
    });
  }

  @override
  setEmailAddress(String email) {
    inputEmail.add(email);
    this.email = email;
    inputAreAllInputsValid.add(null);
  }

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputValidStreamController.stream
          .map((areAllInputsValid) => _areAllInputsValid());

  _areAllInputsValid() {
    return isEmailValid(email);
  }

  @override
  Stream<bool> get outIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Sink get inputAreAllInputsValid => _areAllInputValidStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  void dispose() {
    _emailStreamController.close();
    _areAllInputValidStreamController.close();
  }
}

abstract class ForgotPasswordViewModelInput {
  setEmailAddress(String email);
  forgotPassword();

  Sink get inputEmail;
  Sink get inputAreAllInputsValid;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<bool> get outIsEmailValid;
  Stream<bool> get outAreAllInputsValid;
}
