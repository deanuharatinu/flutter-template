import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const _Initial()) {
    on<SplashEvent>((events, emit) async {
      await events.map(
        started: (event) => _onStarted(event, emit),
      );
    });
  }

  _onStarted(_Started event, Emitter<SplashState> emit) async {
    // TODO
  }
}
