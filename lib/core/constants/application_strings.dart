class ApplicationStrings {
  static const String applicationName = 'snapp';

  static const String confirmationPassword = 'Password (again)';
  static const String createAccount = 'Create Account';
  static const String emailAddress = 'Email address';
  static const String firstName = 'First name';
  static const String lastName = 'Last name';
  static const String password = 'Password';
  static const String rememberMe = 'Remember me';
  static const String resetPassword = 'Reset Password';
  static const String signIn = 'Sign In';
  static const String signUp = 'Sign Up';
  static const String username = 'Username';

  // Error Messages
  static const String networkErrorMessage =
      'Network error occurred, please check your internet connection.';
  static const String passwordMismatchErrorMessage = 'Passwords do not match.';
  static const String unknownErrorMessage = 'An unknown error occurred.';

  // Authentication Service Error Messages
  static const String emailAddressInUseErrorMessage =
      'Email address already in use.';
  static const String invalidCredentialErrorMessage = 'Invalid credential.';
  static const String usernameInUseErrorMessage = 'Username already in use.';

  // Credential Service Error Messages
  static const String deleteCredentialErrorMessage =
      'An error occurred while deleting credentials.';
  static const String getCredentialErrorMessage =
      'An error occurred while getting credentials.';
  static const String saveCredentialErrorMessage =
      'An error occurred while saving credentials.';

  // TextValidator Messages
  static const String emptyEmailAddressMessage =
      'Email address cannot be empty.';
  static const String emptyFieldMessage = 'This field cannot be empty.';
  static const String emptyPasswordMessage = 'Password cannot be empty.';
  static const String emptyUsernameMessage = 'Username cannot be empty.';
  static const String invalidEmailAddressMessage = 'Invalid email address.';
  static const String longEmailAddressMessage =
      'Email address must be at most 254 characters.';
  static const String longFieldMessage =
      'This field must be at most 32 characters.';
  static const String longPasswordMessage =
      'Password must be at most 128 characters.';
  static const String longUsernameMessage =
      'Username must be at most 32 characters.';
  static const String passwordWithoutLowercaseLetterMessage =
      'Password must contain lowercase letter.';
  static const String passwordWithoutNumberMessage =
      'Password must contain number.';
  static const String passwordWithoutSpecialCharacterMessage =
      'Password must contain special character.';
  static const String passwordWithoutUppercaseLetterMessage =
      'Password must contain uppercase letter.';
  static const String shortEmailAddressMessage =
      'Email address must be at least 5 characters.';
  static const String shortFieldMessage = 'Must be at least 2 characters.';
  static const String shortPasswordMessage =
      'Password must be at least 8 characters.';
  static const String shortUsernameMessage =
      'Username must be at least 3 characters.';
}
