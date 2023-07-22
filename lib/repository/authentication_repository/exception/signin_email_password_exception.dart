class SignInWithEmailAndPasswordFailure {
  final String message;

  const SignInWithEmailAndPasswordFailure([this.message = "an Error Occured"]);

  factory SignInWithEmailAndPasswordFailure.code(String code) {
    switch(code) {
      case 'weak-password' :
        return const SignInWithEmailAndPasswordFailure('Please enter a stronger password');
      case 'Invalid-Email' :
        return const SignInWithEmailAndPasswordFailure('Email is not valid or badly formatted');
      case 'Email-already-in-user' :
        return const SignInWithEmailAndPasswordFailure('an account already exists for that email');
      case 'Operation-not-allowed' :
        return const SignInWithEmailAndPasswordFailure('Operation is not allowed, please contact support');
      case 'User-disabled' :
        return const SignInWithEmailAndPasswordFailure('This user has been disabled');

      default: return SignInWithEmailAndPasswordFailure();
    }
  }
}