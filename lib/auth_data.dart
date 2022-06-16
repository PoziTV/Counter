class AuthData {
  static isAuthCorrect(String? login, String? pass) {
    return login == _login && pass == _pass;
  }

  static const String _login = "qwerty";
  static const String _pass = "123456ab";
}
