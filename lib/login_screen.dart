import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    if (Login == "qwerty" && Pass == "123456ab") {
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Попробуйте снова"),
          actions: [
            TextButton(
              child: Text("Закрыть"),
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
        title: Text("Авторизация"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Логин',
              ),
              maxLength: 8,
              maxLines: 1,
              validator: (String? value) {
                return (value != null && value.length < 3 && value.length != 0)
                    ? 'Логин должен содержать не менее 8 символов'
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
              decoration: const InputDecoration(
                labelText: 'Пароль',
              ),
              maxLength: 16,
              maxLines: 1,
              obscureText: true,
              validator: (String? value) {
                return (value != null && value.length < 8 && value.length != 0)
                    ? 'Логин должен содержать не менее 8 символов'
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
              child: Text("Вход"),
            )
          ],
        ),
      ),
    );
  }
}
