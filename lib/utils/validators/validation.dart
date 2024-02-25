
class KValidator {
  static String? validateEmptyField(String? value, String field){
    if(value == null || value.trim().isEmpty){
      return '$field is required.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    /*
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }
     */

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    String cleanedPhoneNumber = value.replaceAll(RegExp(r'\D'), '');

    final phoneRegExp = RegExp(r'^0[567]\d{8}$');

    if (!phoneRegExp.hasMatch(cleanedPhoneNumber)) {
      return 'Invalid phone number.';
    }

    return null;
  }

  static String? validateConfirmationPassword(String? pwd1, String? pwd2){
    if (pwd2?.isNotEmpty == true && pwd1 != pwd2) {
      return "Passwords are not matching";
    }
    return null;
  }

// Add more custom validators as needed for your specific requirements.
}
