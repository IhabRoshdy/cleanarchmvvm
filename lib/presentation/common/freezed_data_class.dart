import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_class.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String username, String password) = _LoginObject;
}

@freezed
class RegistrationObject with _$RegistrationObject {
  factory RegistrationObject(
    String userName,
    String countryMobileCode,
    String mobileNumber,
    String email,
    String password,
    String profilePicture,
  ) = _RegistrationObject;
}
