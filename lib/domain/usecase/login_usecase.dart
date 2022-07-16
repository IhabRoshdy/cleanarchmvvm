import 'package:cleanarchmvvm/data/network/failure.dart';
import 'package:cleanarchmvvm/data/network/requests.dart';
import 'package:cleanarchmvvm/domain/models/models.dart';
import 'package:cleanarchmvvm/domain/repositories/repository.dart';
import 'package:cleanarchmvvm/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase implements BaseUsecase<LoginUsecaseInput, Authentication> {
  final Repository _repository;
  LoginUsecase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUsecaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUsecaseInput {
  String email;
  String password;

  LoginUsecaseInput(this.email, this.password);
}
