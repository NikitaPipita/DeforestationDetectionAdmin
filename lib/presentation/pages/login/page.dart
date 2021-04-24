import 'package:deforestation_detection_admin/presentation/blocs/login/login_bloc.dart';
import 'package:deforestation_detection_admin/presentation/pages/navigation/page.dart';
import 'package:deforestation_detection_admin/utils/validators.dart';
import 'package:deforestation_detection_admin/dependency_injection.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _loginBloc = di.sl.get();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 3,
        ),
        constraints: const BoxConstraints(
          minWidth: 500.0,
        ),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: emailValidator,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              BlocListener<LoginBloc, LoginBlocState>(
                bloc: _loginBloc,
                listener: (BuildContext context, LoginBlocState snapshot) {
                  if (snapshot.status == LoginBlocStatus.Error) {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Center(
                            child: Text(
                              'Something went wrong.\n' +
                                  snapshot.error.toString(),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (snapshot.status == LoginBlocStatus.Login &&
                      snapshot.user!.role == 'admin') {
                    Navigator.push(
                      context,
                      MaterialPageRoute<NavigationPage>(
                        builder: (_) => NavigationPage(),
                      ),
                    );
                  }
                },
                child: TextButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _loginBloc.add(LoginBlocEvent.login(
                        _emailController.text,
                        _passwordController.text,
                      ));
                    }
                  },
                  child: const Text(
                    'Login',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
