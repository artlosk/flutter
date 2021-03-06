import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../observables/auth_observable.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AuthState>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              'Для далнейшей работы\r\nнеобходимо авторизоваться',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          MaterialButton(
            splashColor: Colors.grey,
            onPressed: () {
              state.signIn();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: const BorderSide(
                color: Colors.grey,
              ),
            ),
            highlightElevation: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Image(
                      image: AssetImage("assets/google_logo.png"),
                      height: 35.0),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Войти с помощью Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
