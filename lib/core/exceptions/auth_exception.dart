class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException() : super('Email already exists.');
}

class InvalidEmailAddressException extends AuthException {
  InvalidEmailAddressException() : super('Bad email format.');
}

class WeakPasswordExcetpion extends AuthException {
  WeakPasswordExcetpion() : super('Weak password.');
}

class InvalidCredentialsException extends AuthException {
  InvalidCredentialsException() : super('Invalid credentials.');
}