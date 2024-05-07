import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../blocs/login/login_bloc.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // Navigate to another screen on successful login
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoginFailure) {
            return Center(child: Text('Login failed'));
          } else {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Username'),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      loginBloc.add(LoginButtonPressed(
                        username: 'your_username',
                        password: 'your_password',
                      ));
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}