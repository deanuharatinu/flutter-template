import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:networking/networking.dart';
import 'package:networking/src/models/response_model.dart';

class DioService {
  final Dio _dio;
  final CacheOptions? globalCacheOptions;
  final CancelToken _cancelToken;

  DioService({
    required Dio dioClient,
    this.globalCacheOptions,
    Iterable<Interceptor>? interceptors,
    HttpClientAdapter? httpClientAdapter,
  })  : _dio = dioClient,
        _cancelToken = CancelToken() {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
    if (httpClientAdapter != null) _dio.httpClientAdapter = httpClientAdapter;
  }

  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel('Cancelled');
    } else {
      cancelToken.cancel();
    }
  }

  Future<ResponseModel<R>> get<R>({
    required String endPoint,
    JSON? queryParams,
    Options? options,
    CacheOptions? cacheOptions,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get<JSON>(endPoint,
        queryParameters: queryParams,
        options: _mergeDioAndCacheOptions(
          dioOptions: options,
          cacheOptions: cacheOptions,
        ),
        cancelToken: cancelToken ?? _cancelToken);

    return ResponseModel<R>.fromJson(response.data!);
  }

  Future<ResponseModel<R>> post<R>({
    required String endPoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post<JSON>(
      endPoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );

    return ResponseModel<R>.fromJson(response.data!);
  }

  Future<ResponseModel<R>> patch<R>({
    required String endPoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.patch<JSON>(
      endPoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );

    return ResponseModel<R>.fromJson(response.data!);
  }

  Future<ResponseModel<R>> put<R>({
    required String endPoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.put<JSON>(
      endPoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );

    return ResponseModel<R>.fromJson(response.data!);
  }

  Future<ResponseModel<R>> delete<R>({
    required String endPoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.delete<JSON>(
      endPoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );

    return ResponseModel<R>.fromJson(response.data!);
  }

  Options? _mergeDioAndCacheOptions({
    Options? dioOptions,
    CacheOptions? cacheOptions,
  }) {
    if (dioOptions == null && cacheOptions != null) {
      return null;
    } else if (dioOptions == null && cacheOptions != null) {
      return cacheOptions.toOptions();
    } else if (dioOptions != null && cacheOptions == null) {
      return dioOptions;
    }

    final _cacheOptionsMap = cacheOptions!.toExtra();
    final options = dioOptions!.copyWith(
        extra: <String, dynamic>{...dioOptions.extra!, ..._cacheOptionsMap});

    return options;
  }
}
