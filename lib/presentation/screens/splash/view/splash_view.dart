import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/app/blocs/security/bloc/security_bloc.dart';
import 'package:flutter_template/core/router/router.gr.dart';
import 'package:flutter_template/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:flutter_template/presentation/widgets/dialogs/env_security_dialog.dart';

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
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Splash Screen'),
              MaterialButton(
                onPressed: () {
                  context.router.replaceAll([const HomeRoute()]);
                },
                child: const Text('Next Page'),
              ),
            ],
          ),
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
