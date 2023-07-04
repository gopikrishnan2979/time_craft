class Validation {
  validation(
      {required String? value,

      required bool isname,
      required bool isemail,
      required bool ispassword,
      required bool isphone,
      required bool isconfirmpassword,String? password}) {
    if (value == null) {
      return 'Value cannot be empty';
    }
    if (isname) {
      return namevalidator(value.trim());
    } else if (isemail) {
      return emailvalidator(value.trim());
    } else if (ispassword) {
      return passwordvalidator(value.trim());
    } else if (isphone) {
      return phonevalidator(value.trim());
    } else if (isconfirmpassword && password!=null) {
      confirmPasswordValidation(password, value);
    }
  }

  String? namevalidator(String value) {
    final RegExp nameRegExp = RegExp('[a-zA-Z]');
    return nameRegExp.hasMatch(value) && value != '' ? null : 'Enter a valid name';
  }

  String? emailvalidator(String value) {
    return value.contains('@') && value.contains('.') && value != '' ? null : 'Enter a valid email';
  }

  String? passwordvalidator(String value) {
    if (value == '') {
      return 'Password cannot be empty';
    }
    return value.length > 5 ? null : 'Password must contain minimum 6 characters';
  }

  String? phonevalidator(String value) {
    return value.length == 10 ? null : 'Number must contain 10 digits';
  }

  String? confirmPasswordValidation(String password, String value) {
    return value == password && value != '' ? null : 'Password must be same as entered above';
  }
}