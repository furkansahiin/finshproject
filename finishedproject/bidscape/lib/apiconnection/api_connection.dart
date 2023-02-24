class API {
  static const String HOSTCONNECT = "http://192.168.3.48/mysqlapp/";

  static const String HOSTCONNECTUSER = "$HOSTCONNECT/user";

  // USER SİGNUP
  static const String validateEmail = "$HOSTCONNECTUSER/validate_email.php";
  static const String signUp = "$HOSTCONNECTUSER/signup.php";

  // USER LOGIN
  static const String login = "$HOSTCONNECTUSER/login.php";

}
