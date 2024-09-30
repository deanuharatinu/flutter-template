import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/screens/splash/bloc/splash_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    context.read<SplashBloc>().add(const SplashEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      );
    });
  }
}
