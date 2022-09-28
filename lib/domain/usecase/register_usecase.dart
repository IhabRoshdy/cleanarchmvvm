import 'package:cleanarchmvvm/data/network/failure.dart';
import 'package:cleanarchmvvm/data/network/requests.dart';
import 'package:cleanarchmvvm/domain/models/models.dart';
import 'package:cleanarchmvvm/domain/repositories/repository.dart';
import 'package:cleanarchmvvm/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase
    implements BaseUsecase<RegisterationUsecaseInput, Authentication> {
  final Repository _repository;

  RegisterUsecase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterationUsecaseInput input) {
    return _repository.register(RegisterationRequest(
        input.userName,
        input.countryMobileCode,
        input.mobileNumber,
        input.email,
        input.password,
        input.profilePicture));
  }
}

class RegisterationUsecaseInput {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterationUsecaseInput(this.userName, this.countryMobileCode,
      this.mobileNumber, this.email, this.password, this.profilePicture);
}
