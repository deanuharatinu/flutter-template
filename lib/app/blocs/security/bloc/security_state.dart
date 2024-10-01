part of 'security_bloc.dart';

@freezed
class SecurityState with _$SecurityState {
  const factory SecurityState.initial({
    bool? isEnvSafe,
  }) = _Initial;
}
