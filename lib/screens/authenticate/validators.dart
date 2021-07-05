//email validator
dynamic emailValidator(String value) {
  RegExp pattern = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value.isEmpty) {
    return "you must provide your email.";
  } else if (!pattern.hasMatch(value)) {
    return "Your email is not valid.";
  } else {
    return null;
  }
}

//password validator
dynamic passValidator(value) {
  if (value.isEmpty) {
    return "Your must enter a password";
  } else if (!(value.length >= 8)) {
    return "your password must containe at least 8 characters.";
  } else {
    return null;
  }
}

//username validator
dynamic nameValidator(String value) {
  if (value.length < 2 || value.length > 26) {
    return "your name must be between 2 to 26 characters.";
  } else if (!RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(value)) {
    return "your name can contain only letters.";
  } else {
    return null;
  }
}

//phone no validator
dynamic phoneNoValidator(value) {
  if (value.isEmpty) {
    return "you must provide your phone number.";
  } else if (!RegExp(r'^(?:[+0]9)?[0-9]{11}$').hasMatch(value)) {
    return "Your phone number is not valid.";
  } else {
    return null;
  }
}

//confirm password validator
dynamic confirmPasswordValidator(pass1, pass2) {
  if (pass2.isEmpty || !(pass1 == pass2))
    return "your password didn't match.";
  else
    return;
}

//language select validator
//image upload validator
