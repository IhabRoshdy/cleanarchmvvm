// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class RegisterationRequest {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterationRequest(
    this.userName,
    this.countryMobileCode,
    this.mobileNumber,
    this.email,
    this.password,
    this.profilePicture,
  );

  RegisterationRequest copyWith({
    String? userName,
    String? countryMobileCode,
    String? mobileNumber,
    String? email,
    String? password,
    String? profilePicture,
  }) {
    return RegisterationRequest(
      userName ?? this.userName,
      countryMobileCode ?? this.countryMobileCode,
      mobileNumber ?? this.mobileNumber,
      email ?? this.email,
      password ?? this.password,
      profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'countryMobileCode': countryMobileCode,
      'mobileNumber': mobileNumber,
      'email': email,
      'password': password,
      'profilePicture': "",
    };
  }

  factory RegisterationRequest.fromMap(Map<String, dynamic> map) {
    return RegisterationRequest(
      map['userName'] as String,
      map['countryMobileCode'] as String,
      map['mobileNumber'] as String,
      map['email'] as String,
      map['password'] as String,
      map['profilePicture'] as String,
    );
  }

  Map toJson() => toMap();

  factory RegisterationRequest.fromJson(String source) =>
      RegisterationRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterationRequest(userName: $userName, countryMobileCode: $countryMobileCode, mobileNumber: $mobileNumber, email: $email, password: $password, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(covariant RegisterationRequest other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.countryMobileCode == countryMobileCode &&
        other.mobileNumber == mobileNumber &&
        other.email == email &&
        other.password == password &&
        other.profilePicture == profilePicture;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        countryMobileCode.hashCode ^
        mobileNumber.hashCode ^
        email.hashCode ^
        password.hashCode ^
        profilePicture.hashCode;
  }
}
