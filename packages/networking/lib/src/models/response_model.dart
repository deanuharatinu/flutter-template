import 'package:networking/networking.dart';

class ResponseModel<T> {
  final ResponseStatusModel? status;
  final T? data;
  final JSON? meta;

  const ResponseModel({
    this.status,
    this.data,
    this.meta,
  });

  factory ResponseModel.fromJson(JSON json) {
    return ResponseModel(
      status: ResponseStatusModel.fromJson(json['status'] as JSON?),
      data: json['data'] as T?,
      meta: json['meta'] as JSON?,
    );
  }
}

class ResponseStatusModel {
  final String? code;
  final bool? success;
  final ResponseStatusLanguageModel? message;
  final ResponseStatusLanguageModel? reason;

  const ResponseStatusModel({
    this.code,
    this.success,
    this.message,
    this.reason,
  });

  factory ResponseStatusModel.fromJson(JSON? json) {
    return ResponseStatusModel(
      success: json?['success'] as bool?,
      code: json?['code'] as String?,
      message: ResponseStatusLanguageModel.fromJson(json?['message'] as JSON?),
      reason: ResponseStatusLanguageModel.fromJson(json?['message'] as JSON?),
    );
  }
}

class ResponseStatusLanguageModel {
  final String? id;
  final String? en;

  const ResponseStatusLanguageModel({
    this.id,
    this.en,
  });

  factory ResponseStatusLanguageModel.fromJson(JSON? json) {
    return ResponseStatusLanguageModel(
      id: json?['id'] as String?,
      en: json?['en'] as String?,
    );
  }
}
