import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:networking/networking.dart';
import 'package:networking/src/models/response_model.dart';

abstract class ApiInterface {
  const ApiInterface();

  Future<ResponseModel<T>> getCollectionData<T>({
    required String endPoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    CachePolicy cachePolicy,
    int? cacheAgeDays,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T> responseBody) converter,
  });

  Future<ResponseModel<T>> getDocumentData<T>({
    required String endPoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T> responseBody) converter,
  });

  Future<ResponseModel<T>> setData<T>({
    required String endPoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T>? response) converter,
  });

  Future<ResponseModel<T>> updateData<T>({
    required String endPoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T>? response) converter,
  });

  Future<ResponseModel<T>> alterData<T>({
    required String endPoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T>? response) converter,
  });

  Future<ResponseModel<T>> deleteData<T>({
    required String endPoint,
    JSON? data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required ResponseModel<T> Function(ResponseModel<T>? response) converter,
  });

  void cancelRequests({CancelToken? cancelToken});
}
