// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// An enum that holds names for our custom exceptions.
enum ExceptionType {
  /// The exception for an expired bearer token.
  TokenExpiredException,

  /// The exception for a prematurely cancelled request.
  CancelException,

  /// The exception for a failed connection attempt.
  ConnectTimeoutException,

  /// The exception for failing to send a request.
  SendTimeoutException,

  /// The exception for failing to receive a response.
  ReceiveTimeoutException,

  /// The exception for no internet connectivity.
  SocketException,

  /// A better name for the socket exception.
  FetchDataException,

  /// The exception for an incorrect parameter in a request/response.
  FormatException,

  /// The exception for an unknown type of failure.
  UnrecognizedException,

  /// The exception for an unknown exception from the api.
  ApiException,

  /// The exception for any parsing failure encountered during
  /// serialization/deserialization of a request.
  SerializationException,
}

class NetworkException implements Exception {
  final String name;
  final String message;
  final String? code;
  final String? reason;
  final int? statusCode;
  final ExceptionType exceptionType;

  NetworkException({
    required this.message,
    this.code,
    int? statusCode,
    this.reason,
    this.exceptionType = ExceptionType.ApiException,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name;

  factory NetworkException.fromDioException(Exception error) {
    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.cancel:
            return NetworkException(
              statusCode: error.response?.statusCode,
              exceptionType: ExceptionType.CancelException,
              message: 'Request cancelled prematurely',
            );
          case DioExceptionType.connectionTimeout:
            return NetworkException(
              statusCode: error.response?.statusCode,
              exceptionType: ExceptionType.ConnectTimeoutException,
              message: 'Connection not estabblished',
            );
          case DioExceptionType.sendTimeout:
            return NetworkException(
              statusCode: error.response?.statusCode,
              exceptionType: ExceptionType.SendTimeoutException,
              message: 'Failed to send',
            );
          case DioExceptionType.receiveTimeout:
            return NetworkException(
              statusCode: error.response?.statusCode,
              exceptionType: ExceptionType.ReceiveTimeoutException,
              message: 'Failed to receive',
            );
          case DioExceptionType.badCertificate:
          case DioExceptionType.badResponse:
          case DioExceptionType.connectionError:
          case DioExceptionType.unknown:
            if (error.response?.data == null) {
              return NetworkException(
                statusCode: error.response?.statusCode,
                message: 'Something is wrong',
              );
            }

            if (error.message?.contains(ExceptionType.SocketException.name) ==
                true) {
              return NetworkException(
                statusCode: error.response?.statusCode,
                exceptionType: ExceptionType.FetchDataException,
                message: 'No internet connectivity',
              );
            }

            // TODO add more checking
            return NetworkException(
              statusCode: error.response?.statusCode,
              message: 'Define more',
            );
        }
      }

      return NetworkException(
        exceptionType: ExceptionType.UnrecognizedException,
        message: 'Error unrecognized',
      );
    } on FormatException catch (e) {
      return NetworkException(
        exceptionType: ExceptionType.FormatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return NetworkException(
        exceptionType: ExceptionType.UnrecognizedException,
        message: 'Error unrecognized',
      );
    }
  }

  factory NetworkException.fromParsingException(Exception error) {
    debugPrint('$error');
    return NetworkException(
      exceptionType: ExceptionType.SerializationException,
      message: 'Failed to parse network response to model or vice versa',
    );
  }
}
