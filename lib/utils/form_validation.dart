import 'package:fiveminslearn/utils/function.dart';

String? validateEmail(String email) {
  String? emailError;

  if (email.isEmpty) {
    emailError = "Email address is required";
  } else if (!isValidEmail(email)) {
    emailError = "Invalid email address";
  } else {
    emailError = null;
  }

  return emailError;
}

String? validatePassword(String password) {
  String? passwordError;

  if (password.isEmpty) {
    passwordError = "Password is required";
  } else if (!isValidPassword(password)) {
    passwordError = "Password must be at least 6 characters";
  } else {
    passwordError = null;
  }

  return passwordError;
}

String? validateName(String name) {
  String? nameError;

  if (name.isEmpty) {
    nameError = "Name is required";
  } else {
    nameError = null;
  }

  return nameError;
}
