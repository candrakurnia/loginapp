class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "an Error Occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch(code) {
      case 'weak-password' :
        return const SignUpWithEmailAndPasswordFailure('Please enter a stronger password');
      case 'Invalid-Email' :
        return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted');
      case 'Email-already-in-user' :
        return const SignUpWithEmailAndPasswordFailure('an account already exists for that email');
      case 'Operation-not-allowed' :
        return const SignUpWithEmailAndPasswordFailure('Operation is not allowed, please contact support');
      case 'User-disabled' :
        return const SignUpWithEmailAndPasswordFailure('This user has been disabled');

      default: return SignUpWithEmailAndPasswordFailure();
    }
  }
}