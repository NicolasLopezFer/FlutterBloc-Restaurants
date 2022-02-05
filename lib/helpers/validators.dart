import 'dart:async';

validateEmail(String? value) {
  if (value!.trim().isEmpty) return false;
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (!emailValid) return false;
  return true;
}

validatePassword(String? value) {
  if (value!.length < 6) return false;

  return true;
}
