class Validation {
  validation(
      {required String? value,
      required bool isname,
      required bool isemail,
      required bool ispassword,
      required bool isphone,
      required bool isconfirmpassword,
      String? password}) {
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
    } else if (isconfirmpassword && password != null) {
      confirmPasswordValidation(password, value);
    }
  }

  String? namevalidator(String value) {
    if (value == '') {
      return 'Name is required';
    }
    bool isNotValid = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value);
    if (isNotValid) {
      return 'Name should only contain alphabets';
    }
    return null;
  }

  String? emailvalidator(String value) {
    if (value == '') {
      return 'Email is required';
    }
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return null;
    } else {
      return 'Enter a valid email';
    }
  }

  String? passwordvalidator(String value) {
    if (value == '') {
      return 'Password cannot be empty';
    }
    return value.length > 5 ? null : 'Password must contain minimum 6 characters';
  }

  String? phonevalidator(String value) {
    if (value == '') {
      return 'Phone number is required';
    }
    bool isNotValid = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%a-zA-Z-]').hasMatch(value);
    if (isNotValid) {
      return 'Can only contains number without country code';
    }
    if (value.length != 10) {
      return 'Number must contain 10 digits';
    }
    return null;
  }

  String? confirmPasswordValidation(String password, String value) {
    if (value == '') {
      return 'Password cannot be empty';
    }
    if (value != password) {
      return 'Password must be same as entered above';
    }
    return null;
  }

  String? addressValidation({required bool isOptional, required String? value}) {
    if (!isOptional) {
      if (value == null || value.trim() == '') {
        return 'required';
      }
      return null;
    }
    return null;
  }
}
