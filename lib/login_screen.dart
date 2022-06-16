import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_code/auth_data.dart';
import 'package:simple_code/counter.dart';

import 'generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  void Function()? onEnterFunction = null;

  String? Login;
  String? Pass;

  bool isLoginLenCorrect = false;
  bool isPassLenCorrect = false;

  void onEnterEnableFunction() {
    FocusScope.of(context).unfocus();
    if (AuthData.isAuthCorrect(Login, Pass)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Counter()));
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(S.of(context).try_again), //"Попробуйте снова"),
          actions: [
            TextButton(
              child: Text(S.of(context).close), //"Закрыть"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).auth), //"Авторизация"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            TextFormField(
              decoration: InputDecoration(
                labelText:
                    S.of(context).login, //'Логин', //S.of(context).login,,
              ),
              maxLength: 8,
              maxLines: 1,
              validator: (String? value) {
                return (value != null && value.length < 3 && value.length != 0)
                    ? S
                        .of(context)
                        .login_len_worning //'Логин должен содержать не менее 8 символов'
                    : null;
              },
              autovalidateMode: AutovalidateMode.always,
              onChanged: (value) {
                isLoginLenCorrect = value.length >= 3;
                setState(() {
                  Login = value;
                  onEnterFunction = isLoginLenCorrect && isPassLenCorrect
                      ? onEnterFunction = onEnterEnableFunction
                      : null;
                });
              },
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.always,
              decoration:
                  InputDecoration(labelText: S.of(context).pass //'Пароль',
                      ),
              maxLength: 16,
              maxLines: 1,
              obscureText: true,
              validator: (String? value) {
                return (value != null && value.length < 8 && value.length != 0)
                    ? S
                        .of(context)
                        .pass_len_worning //'Логин должен содержать не менее 8 символов'
                    : null;
              },
              onChanged: (value) {
                isPassLenCorrect = value.length >= 8;
                setState(() {
                  Pass = value;
                  onEnterFunction = isLoginLenCorrect && isPassLenCorrect
                      ? onEnterFunction = onEnterEnableFunction
                      : null;
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: onEnterFunction,
              child: Text(
                S.of(context).enter,
              ), //"Вход"),
            )
          ],
        ),
      ),
    );
  }
}
