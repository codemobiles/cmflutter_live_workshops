import 'package:cmflutter0/src/bloc/login/login_bloc.dart';
import 'package:cmflutter0/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = "admin";
    _passwordController.text = "1234";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text("Login Page: ${state.count}");
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Card(
            child: Container(
              height: 600,
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._buildTextFields(),
                  SizedBox(height: 32),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Text(
                        "Login Result: ${state.isAuthened ? "Success" : "Error"}",
                        style: TextStyle(
                          color: state.isAuthened ? Colors.green : Colors.red,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 32),
                  ..._buildButtons(),
                  Row(
                    children: [
                      // Text("Debug: ${context.read<LoginBloc>().state.count}"),
                      // separation of concern
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Text("DebugX: ${state.count}");
                        },
                      ),
                      IconButton(
                        onPressed: () =>
                            context.read<LoginBloc>().add(LoginEventAdd()),
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () =>
                            context.read<LoginBloc>().add(LoginEventRemove()),
                        icon: Icon(Icons.remove),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {
    final user = User(
      username: _usernameController.text,
      password: _passwordController.text,
    );
    context.read<LoginBloc>().add(LoginEventLogin(user));
  }

  void _handleClickReset() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  _buildTextFields() {
    return [
      TextField(
        controller: _usernameController,
        decoration: InputDecoration(labelText: "Username"),
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: "Password"),
      ),
    ];
  }

  _buildButtons() {
    return [
      ElevatedButton(
        onPressed: _handleClickLogin,
        child: Text("SignIn"),
      ),
      OutlinedButton(
        onPressed: _handleClickRegister,
        child: Text("Register"),
      ),
      OutlinedButton(
        onPressed: _handleClickReset,
        child: Text("Reset"),
      )
    ];
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
  }
}
