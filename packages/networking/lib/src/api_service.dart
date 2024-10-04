import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:networking/networking.dart';
import 'package:networking/src/api_interface.dart';
import 'package:networking/src/dio_service.dart';
import 'package:networking/src/models/response_model.dart';

class ApiService implements ApiInterface {
  late final DioService _dioService;

  ApiService(DioService dioService) : _dioService = dioService;

  @override
  Future<ResponseModel<T>> getCollectionData<T>({
    required String endPoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T> responseBody) converter,
  }) async {
    ResponseModel<T> response;

    try {
      response = await _dioService.get<T>(
        endPoint: endPoint,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null
              ? Nullable(Duration(days: cacheAgeDays))
              : null,
        ),
        options: Options(
          extra: <String, Object?>{
            'requiresAuthTOken': requiresAuthToken,
          },
        ),
        queryParams: queryParams,
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw NetworkException.fromDioException(ex);
    }

    try {
      return converter(response);
    } on Exception catch (ex) {
      throw NetworkException.fromParsingException(ex);
    }
  }

  @override
  Future<ResponseModel<T>> getDocumentData<T>({
    required String endPoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T> responseBody) converter,
  }) async {
    ResponseModel<T> response;

    try {
      response = await _dioService.get(
        endPoint: endPoint,
        queryParams: queryParams,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null
              ? Nullable(Duration(days: cacheAgeDays))
              : null,
        ),
        options: Options(extra: <String, Object?>{
          'requiresAuthToken': requiresAuthToken,
        }),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw NetworkException.fromDioException(ex);
    }

    try {
      return converter(response);
    } on Exception catch (ex) {
      throw NetworkException.fromParsingException(ex);
    }
  }

  @override
  Future<ResponseModel<T>> setData<T>({
    required String endPoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T>? response) converter,
  }) async {
    ResponseModel<T> response;

    try {
      response = await _dioService.post<T>(
        endPoint: endPoint,
        data: data,
        options: Options(
            extra: <String, Object?>{'requiresAuthToken': requiresAuthToken}),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw NetworkException.fromDioException(ex);
    }

    try {
      return converter(response);
    } on Exception catch (ex) {
      throw NetworkException.fromParsingException(ex);
    }
  }

  @override
  Future<ResponseModel<T>> alterData<T>({
    required String endPoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T>? response) converter,
  }) async {
    ResponseModel<T> response;

    try {
      response = await _dioService.put<T>(
        endPoint: endPoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw NetworkException.fromDioException(ex);
    }

    try {
      return converter(response);
    } on Exception catch (ex) {
      throw NetworkException.fromParsingException(ex);
    }
  }

  @override
  Future<ResponseModel<T>> updateData<T>({
    required String endPoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T>? response) converter,
  }) async {
    ResponseModel<T> response;

    try {
      response = await _dioService.patch<T>(
        endPoint: endPoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw NetworkException.fromDioException(ex);
    }

    try {
      return converter(response);
    } on Exception catch (ex) {
      throw NetworkException.fromParsingException(ex);
    }
  }

  @override
  Future<ResponseModel<T>> deleteData<T>({
    required String endPoint,
    JSON? data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T>? response) converter,
  }) async {
    ResponseModel<T> response;

    try {
      response = await _dioService.delete<T>(
        endPoint: endPoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw NetworkException.fromDioException(ex);
    }

    try {
      return converter(response);
    } on Exception catch (ex) {
      throw NetworkException.fromParsingException(ex);
    }
  }

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }
}
