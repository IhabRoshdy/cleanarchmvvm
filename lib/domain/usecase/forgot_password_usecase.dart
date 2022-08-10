import 'package:cleanarchmvvm/data/network/failure.dart';
import 'package:cleanarchmvvm/domain/repositories/repository.dart';
import 'package:cleanarchmvvm/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUseCase implements BaseUsecase<String, String> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgotPassword(input);
  }
}
