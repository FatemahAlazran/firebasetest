class AuthValidators {
  String? usernameValidatore(String? value) {
    if (value != null && value.length > 3) {
      return null;
    } else {
      return "Username must be more than 3 charecters";
    }
  }

  String? passwordVlidator(String? val) {
    final String password = val as String;

    if (password.isEmpty || password.length <= 5) {
      return "Password must have at least 6 charecters";
    }

    return null;
  }

  String? emailValidator(String? val) {
    if (val != null) {
      final bool emailValid = RegExp(
              r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$')
          .hasMatch(val);
      if (emailValid) {
        return null;
      }
    }
    return "Emial is Not Valid";
  }
}
