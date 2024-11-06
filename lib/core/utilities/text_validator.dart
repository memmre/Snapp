import 'package:email_validator/email_validator.dart';
import 'package:snapp/core/constants/application_strings.dart';

class TextValidator {
  static bool _isLowercaseLetter(String character) {
    if (character.length != 1) return false;
    return character.codeUnitAt(0) >= 97 && character.codeUnitAt(0) <= 122;
  }

  static bool _isNumber(String character) {
    if (character.length != 1) return false;
    return character.codeUnitAt(0) >= 48 && character.codeUnitAt(0) <= 57;
  }

  static bool _isSpecialCharacter(String character) {
    if (character.length != 1) return false;
    return !_isNumber(character) &&
        !_isLowercaseLetter(character) &&
        !_isUppercaseLetter(character);
  }

  static bool _isUppercaseLetter(String character) {
    if (character.length != 1) return false;
    return character.codeUnitAt(0) >= 65 && character.codeUnitAt(0) <= 90;
  }

  static bool _containsLowercaseLetter(String text) {
    for (int i = 0; i < text.length; i++) {
      if (_isLowercaseLetter(text[i])) return true;
    }
    return false;
  }

  static bool _containsNumber(String text) {
    for (int i = 0; i < text.length; i++) {
      if (_isNumber(text[i])) return true;
    }
    return false;
  }

  static bool _containsSpecialCharacter(String text) {
    for (int i = 0; i < text.length; i++) {
      if (_isSpecialCharacter(text[i])) return true;
    }
    return false;
  }

  static bool _containsUppercaseLetter(String text) {
    for (int i = 0; i < text.length; i++) {
      if (_isUppercaseLetter(text[i])) return true;
    }
    return false;
  }

  static String? validateText(String? text) {
    if (text == null || text.isEmpty) {
      return ApplicationStrings.emptyFieldMessage;
    }
    return null;
  }

  static String? validateEmailAddress(String? emailAddress) {
    if (emailAddress == null || emailAddress.isEmpty) {
      return ApplicationStrings.emptyEmailAddressMessage;
    }
    if (!EmailValidator.validate(emailAddress)) {
      return ApplicationStrings.invalidEmailAddressMessage;
    }
    if (emailAddress.length < 5) {
      return ApplicationStrings.shortEmailAddressMessage;
    }
    if (emailAddress.length > 254) {
      return ApplicationStrings.longEmailAddressMessage;
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return ApplicationStrings.emptyFieldMessage;
    }
    if (name.length < 2) {
      return ApplicationStrings.shortFieldMessage;
    }
    if (name.length > 32) {
      return ApplicationStrings.longFieldMessage;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return ApplicationStrings.emptyPasswordMessage;
    }
    if (password.length < 8) {
      return ApplicationStrings.shortPasswordMessage;
    }
    if (!_containsLowercaseLetter(password)) {
      return ApplicationStrings.passwordWithoutLowercaseLetterMessage;
    }
    if (!_containsUppercaseLetter(password)) {
      return ApplicationStrings.passwordWithoutUppercaseLetterMessage;
    }
    if (!_containsNumber(password)) {
      return ApplicationStrings.passwordWithoutNumberMessage;
    }
    if (!_containsSpecialCharacter(password)) {
      return ApplicationStrings.passwordWithoutSpecialCharacterMessage;
    }
    if (password.length > 128) {
      return ApplicationStrings.longPasswordMessage;
    }
    return null;
  }

  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return ApplicationStrings.emptyUsernameMessage;
    }
    if (username.length < 3) {
      return ApplicationStrings.shortUsernameMessage;
    }
    if (username.length > 32) {
      return ApplicationStrings.longUsernameMessage;
    }
    return null;
  }
}
