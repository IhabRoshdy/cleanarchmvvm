import 'package:cleanarchmvvm/data/network/failure.dart';
import 'package:dio/dio.dart';

enum ErrorType {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CASHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // API error
      failure = _handleError(error);
    } else {
      // Unkown error
      failure = ErrorType.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return ErrorType.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return ErrorType.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return ErrorType.RECEIVE_TIMEOUT.getFailure();
      case DioErrorType.response:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failure(error.response?.statusCode ?? 0,
              error.response?.statusMessage ?? "");
        } else {
          return ErrorType.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return ErrorType.CANCEL.getFailure();
      case DioErrorType.other:
        return ErrorType.DEFAULT.getFailure();
    }
  }
}

extension DataSourceExtension on ErrorType {
  Failure getFailure() {
    switch (this) {
      case ErrorType.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case ErrorType.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case ErrorType.CASHE_ERROR:
        return Failure(ResponseCode.CASHE_ERROR, ResponseMessage.CASHE_ERROR);
      case ErrorType.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case ErrorType.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case ErrorType.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case ErrorType.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case ErrorType.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case ErrorType.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case ErrorType.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      case ErrorType.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case ErrorType.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case ErrorType.UNAUTHORIZED:
        return Failure(ResponseCode.UNAUTHORIZED, ResponseMessage.UNAUTHORIZED);
      case ErrorType.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // Success with data
  static const int NO_CONTENT = 201; // Success with no data
  static const int BAD_REQUEST = 400; // Failure, API rejected request
  static const int UNAUTHORIZED = 401; // Failure, use is not authorized
  static const int NOT_FOUND = 404; // Failure, API not found
  static const int FORBIDDEN = 403; // Failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // Failure, crash at server side

  // Local status codes, happens without hitting the server
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CASHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = "Success"; // Success with data
  static const String NO_CONTENT = "Success"; // Success with no data
  static const String BAD_REQUEST =
      "Bad request, try again later"; // Failure, API rejected request
  static const String UNAUTHORIZED =
      "User is unauthorized, try again later"; // Failure, use is not authorized
  static const String NOT_FOUND =
      "Failure, API not found"; // Failure, API not found
  static const String FORBIDDEN =
      "Forbidden request, try again later"; // Failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      "Something went wrong, try again later"; // Failure, crash at server side

  // Local status codes, happens without hitting the server
  static const String CONNECT_TIMEOUT = "Timeout error, try again later";
  static const String CANCEL = "Request was canceled, try again later";
  static const String RECEIVE_TIMEOUT = "Timeout error, try again later";
  static const String SEND_TIMEOUT = "Timeout error, try again later";
  static const String CASHE_ERROR = "Cashe error, try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection";
  static const String DEFAULT = "Something went wrong, try again later";
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
