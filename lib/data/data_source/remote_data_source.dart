import 'package:cleanarchmvvm/data/network/app_api.dart';
import 'package:cleanarchmvvm/data/network/requests.dart';
import 'package:cleanarchmvvm/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<AuthenticationResponse> register(
      RegisterationRequest registerationRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterationRequest registerationRequest) async {
    Map<String, dynamic> body = {
      "message": registerationRequest.toJson(),
    };
    return await _appServiceClient.register(body);
  }
}
