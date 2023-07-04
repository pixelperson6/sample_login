class SignupEmailWithFirebaseFailure {
  final String message;

  const SignupEmailWithFirebaseFailure([this.message = 'An Unknown error occured.']);

  factory SignupEmailWithFirebaseFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignupEmailWithFirebaseFailure('Please enter a strong password.');
      case 'invalid-email':
        return const SignupEmailWithFirebaseFailure(
            'Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignupEmailWithFirebaseFailure(
            'An account already exists for that email.');
      case 'operation-not-allowed':
        return const SignupEmailWithFirebaseFailure(
            'Operation is not allowed. Please contact support.');
      case 'user-desabled':
        return const SignupEmailWithFirebaseFailure(
            'This user has been disabled. Please contact support for help.');
      default:
        return const SignupEmailWithFirebaseFailure();
    }
  }
}
