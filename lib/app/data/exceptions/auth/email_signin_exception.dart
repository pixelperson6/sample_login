class EmailSigninWithFirebaseException {
  final String message;

  const EmailSigninWithFirebaseException(
      [this.message = 'Login failed! Something went wrong']);

  factory EmailSigninWithFirebaseException.code(String code) {
    switch (code) {
      case 'email-not-found':
        return const EmailSigninWithFirebaseException(
            'There is no user record corresponding to this identifier. The user may have been deleted.');
      case 'invalid-password':
        return const EmailSigninWithFirebaseException(
            'The password is invalid or the user does not have a password.');
      case 'operation-not-allowed':
        return const EmailSigninWithFirebaseException(
            'Operation is not allowed. Please contact support.');
      case 'user-desabled':
        return const EmailSigninWithFirebaseException(
            'This user has been disabled. Please contact support for help.');
      default:
        return const EmailSigninWithFirebaseException();
    }
  }
}
