import 'package:blocclean/presentation/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:blocclean/presentation/screens/splash_screen.dart';
import 'package:blocclean/presentation/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/auth_repository_impl.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(authRepository: AuthRepositoryImpl()),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // You can replace it with LoginScreen()
    );
  }
}
