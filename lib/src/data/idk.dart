import 'package:firebase_auth/firebase_auth.dart';


class AuthGuard{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> canActivate()async{
    final user  =  _auth.currentUser;
    return user != null;
  }
}
 