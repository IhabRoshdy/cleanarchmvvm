import 'package:cleanarchmvvm/data/network/failure.dart';
import 'package:cleanarchmvvm/data/network/requests.dart';
import 'package:cleanarchmvvm/domain/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, String>> forgotPassword(String email);
}
