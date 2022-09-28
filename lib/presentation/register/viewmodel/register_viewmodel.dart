import 'dart:async';
import 'dart:io';

import 'package:cleanarchmvvm/app/functions.dart';
import 'package:cleanarchmvvm/domain/usecase/register_usecase.dart';
import 'package:cleanarchmvvm/presentation/base/base_view_model.dart';
import 'package:cleanarchmvvm/presentation/common/freezed_data_class.dart';
import 'package:cleanarchmvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:cleanarchmvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:cleanarchmvvm/presentation/resources/strings_manager.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInput, RegisterViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  final StreamController _mobileNumberStreamController =
      StreamController<String>.broadcast();

  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _profilePictureStreamController =
      StreamController<File>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isUserRegisteredSuccessfullyStreamController =
      StreamController<bool>();

  final RegisterUsecase _registerationUsecase;

  var registrationObject = RegistrationObject("", "", "", "", "", "");

  RegisterViewModel(this._registerationUsecase);

  // Inputs

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputMobileNumber => _mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get inputUsername => _userNameStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  register() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _registerationUsecase.execute(RegisterationUsecaseInput(
            registrationObject.userName,
            registrationObject.countryMobileCode,
            registrationObject.mobileNumber,
            registrationObject.email,
            registrationObject.password,
            registrationObject.profilePicture)))
        .fold(
            (failure) => inputState.add(
                ErrorState(StateRendererType.popupErrorState, failure.message)),
            (data) {
      inputState.add(ContentState());
      isUserRegisteredSuccessfullyStreamController.add(true);
    });
  }

  @override
  setUserName(String userName) {
    inputUsername.add(userName);
    if (_isUserNameValid(userName)) {
      // update registration object
      registrationObject = registrationObject.copyWith(userName: userName);
    } else {
      // reset username value at registration object
      registrationObject = registrationObject.copyWith(userName: "");
    }
    validate();
  }

  @override
  setCountryCode(String countryCode) {
    if (countryCode.isNotEmpty) {
      registrationObject =
          registrationObject.copyWith(countryMobileCode: countryCode);
    } else {
      registrationObject = registrationObject.copyWith(countryMobileCode: "");
    }
    validate();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (isEmailValid(email)) {
      registrationObject = registrationObject.copyWith(email: email);
    } else {
      registrationObject = registrationObject.copyWith(email: "");
    }
    validate();
  }

  @override
  setMobileNumber(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    if (_isMobileNumberValid(mobileNumber)) {
      registrationObject =
          registrationObject.copyWith(mobileNumber: mobileNumber);
    } else {
      registrationObject = registrationObject.copyWith(mobileNumber: "");
    }
    validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      registrationObject = registrationObject.copyWith(password: password);
    } else {
      registrationObject = registrationObject.copyWith(password: "");
    }
    validate();
  }

  @override
  setProfilePicture(File profilePicture) {
    inputProfilePicture.add(profilePicture);
    if (profilePicture.path.isNotEmpty) {
      registrationObject =
          registrationObject.copyWith(profilePicture: profilePicture.path);
    } else {
      registrationObject.copyWith(profilePicture: "");
    }
    validate();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _userNameStreamController.close();
    _mobileNumberStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserRegisteredSuccessfullyStreamController.close();
  }

  // Outputs

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<String?> get outputErrorUserName => outputIsUserNameValid.map(
      (isUserNameValid) => isUserNameValid ? null : AppStrings.userNameInvalid);

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<String?> get outputErrorEmail => outputIsEmailValid
      .map((isEmailValid) => isEmailValid ? null : AppStrings.emailInvalid);

  @override
  Stream<bool> get outputIsMobileNumberValid =>
      _mobileNumberStreamController.stream
          .map((mobileNumber) => _isMobileNumberValid(mobileNumber));

  @override
  Stream<String?> get outputErrorMobileNumber =>
      outputIsMobileNumberValid.map((isMobilenumberValid) =>
          isMobilenumberValid ? null : AppStrings.mobileNumberInvalid);

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword => outputIsPasswordValid.map(
      (isPasswordValid) => isPasswordValid ? null : AppStrings.passwordInvalid);

  @override
  Stream<File> get outputProfilePicture =>
      _profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outputAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  // Private functions

  _isUserNameValid(String userName) {
    return userName.length >= 8;
  }

  _isMobileNumberValid(String mobileNumber) {
    return mobileNumber.length >= 10;
  }

  _isPasswordValid(String password) {
    return password.length >= 6;
  }

  _areAllInputsValid() {
    return registrationObject.countryMobileCode.isNotEmpty &&
        registrationObject.mobileNumber.isNotEmpty &&
        registrationObject.userName.isNotEmpty &&
        registrationObject.email.isNotEmpty &&
        registrationObject.password.isNotEmpty &&
        registrationObject.profilePicture.isNotEmpty;
  }

  validate() {
    inputAreAllInputsValid.add(null);
  }
}

abstract class RegisterViewModelInput {
  Sink get inputUsername;
  Sink get inputMobileNumber;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputProfilePicture;
  Sink get inputAreAllInputsValid;

  setUserName(String userName);
  setMobileNumber(String mobileNumber);
  setCountryCode(String countryCode);
  setEmail(String email);
  setPassword(String password);
  setProfilePicture(File profilePicture);
  register();
}

abstract class RegisterViewModelOutput {
  Stream<bool> get outputIsUserNameValid;
  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsMobileNumberValid;
  Stream<String?> get outputErrorMobileNumber;

  Stream<bool> get outputIsEmailValid;
  Stream<String?> get outputErrorEmail;

  Stream<bool> get outputIsPasswordValid;
  Stream<String?> get outputErrorPassword;

  Stream<File> get outputProfilePicture;

  Stream<bool> get outputAreAllInputsValid;
}
