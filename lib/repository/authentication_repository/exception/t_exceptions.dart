class TExceptions implements Exception {
  final String message;

  const TExceptions([this.message = 'An Error Occurred']);

  factory TExceptions.fromCode(String code) {
   switch (code) {
     case 'email-already-use' :
       return const TExceptions('Email telah ada');
     case 'Invalid-Email' :
       return const TExceptions('Email is not valid or badly formatted');
     case 'weak-password' :
       return const TExceptions('Please enter a stronger password');
     case 'Email-already-in-user' :
       return const TExceptions('an account already exists for that email');
     case 'Operation-not-allowed' :
       return const TExceptions('Operation is not allowed, please contact support');
     case 'User-disabled' :
       return const TExceptions('This user has been disabled');

     default: return TExceptions();
   }
  }
}