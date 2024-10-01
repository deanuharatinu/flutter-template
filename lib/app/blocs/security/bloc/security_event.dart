part of 'security_bloc.dart';

@freezed
class SecurityEvent with _$SecurityEvent {
  const factory SecurityEvent.appStarted() = _AppStarted;
}