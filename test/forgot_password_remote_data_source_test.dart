import 'package:cleanarchmvvm/data/data_source/remote_data_source.dart';
import 'package:cleanarchmvvm/data/network/app_api.dart';
import 'package:cleanarchmvvm/data/response/responses.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockAppServiceClient extends Mock implements AppServiceClient {}

void main() {
  late RemoteDataSourceImpl dataSource;
  late MockAppServiceClient mockAppServiceClient;

  ForgotPasswordResponse forgotPasswordResponse =
      ForgotPasswordResponse.fromJson({
    "status": 0,
    "message": "Success",
    "support": "We have sent an email to you."
  });

  setUp(() async {
    //registerFallbackValue(Uri());
    mockAppServiceClient = MockAppServiceClient();
    dataSource = RemoteDataSourceImpl(mockAppServiceClient);
  });

  group('Frogot password test cases', () {
    test('Should return ForgotPasswordResponse when call succeeds', () async {
      // Arrange
      when(
        () => mockAppServiceClient.forgotPassword(''),
      ).thenAnswer(
        (_) async => forgotPasswordResponse,
      );

      // Act
      final response = await dataSource.forgotPassword('');

      // Assert
      expect(response, isA<ForgotPasswordResponse>());
    });

    test('Should throw exception in case of error', () async {
      // Arrange
      when(() => mockAppServiceClient.forgotPassword('')).thenThrow(
        DioError(
          response: Response(
            statusCode: 404,
            statusMessage: 'Something went wrong',
            requestOptions: RequestOptions(path: ''),
          ),
          requestOptions: RequestOptions(path: ''),
        ),
      );

      // Act
      final call = dataSource.forgotPassword('');

      // Assert
      expect(() => call, throwsA(isA<Exception>()));
    });
  });
}
