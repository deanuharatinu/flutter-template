import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/services/security/env_security_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_event.dart';
part 'security_state.dart';
part 'security_bloc.freezed.dart';

class SecurityBloc extends Bloc<SecurityEvent, SecurityState> {
  SecurityBloc() : super(const _Initial()) {
    on<SecurityEvent>((events, emit) async {
      await events.map(appStarted: (event) async => await _onAppStarted(emit));
    });
  }

  _onAppStarted(Emitter<SecurityState> emit) async {
    final isEnvSafe = await EnvSecurityService.isEnvSafe();
    emit(state.copyWith(isEnvSafe: isEnvSafe));
  }
}
