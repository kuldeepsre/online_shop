class CustomValidator {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String ? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a name';
    }
    // Additional validation can be added here, such as checking for special characters or length
    return null;
  }

  static String? validatePhoneNumber(String ? value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    }
    // Additional validation can be added here, such as checking for specific formats
    return null;
  }

  static String? validateAge(String ? value) {
    if (value!.isEmpty) {
      return 'Please enter your age';
    }
    int age = int.tryParse(value) ?? 0;
    if (age <= 0 || age >= 150) {
      return 'Please enter a valid age';
    }
    return null;
  }

  static String? validateConfirmPassword(String ? value, String ? password) {
    if (value!.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateNotEmpty(String ? value) {
    if (value!.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  // Additional validation methods

  static String? validateURL(String ? value) {
    if (value!.isEmpty) {
      return 'Please enter a URL';
    }
    if (!Uri.tryParse(value)!.isAbsolute ?? true) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  static String? validateZipCode(String ? value) {
    if (value!.isEmpty) {
      return 'Please enter a ZIP code';
    }
    if (!RegExp(r'^\d{5}(?:[-\s]\d{4})?$').hasMatch(value)) {
      return 'Please enter a valid ZIP code';
    }
    return null;
  }

// Add more validation methods as needed
}
