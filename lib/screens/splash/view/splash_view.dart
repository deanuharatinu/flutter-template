import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/app/blocs/security/bloc/security_bloc.dart';
import 'package:flutter_template/screens/splash/bloc/splash_bloc.dart';
import 'package:flutter_template/widgets/dialogs/env_security_dialog.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    context.read<SecurityBloc>().add(const SecurityEvent.appStarted());
    context.read<SplashBloc>().add(const SplashEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            // TODO
          },
        ),
        BlocListener<SecurityBloc, SecurityState>(
          listener: (context, state) {
            final isEnvNotSafe =
                state.isEnvSafe != null && state.isEnvSafe == false;
            if (isEnvNotSafe) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const EnvSecurityDialog();
                },
              ).then((val) => _exitPlatform());
            }
          },
        ),
      ],
      child: const Scaffold(
        body: Center(
          child: Text('Splash screen'),
        ),
      ),
    );
  }

  _exitPlatform() {
    if (Platform.isAndroid) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else {
      exit(0);
    }
  }
}
