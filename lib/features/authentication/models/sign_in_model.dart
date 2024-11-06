class SignInModel {
  final String identifier;
  final String password;
  final bool obscurePassword;
  final bool saveSession;

  SignInModel({
    this.identifier = '',
    this.password = '',
    this.obscurePassword = true,
    this.saveSession = false,
  });

  SignInModel copyWith({
    String? identifier,
    String? password,
    bool? obscurePassword,
    bool? saveSession,
  }) {
    return SignInModel(
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      saveSession: saveSession ?? this.saveSession,
    );
  }
}
