import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final FirebaseAuth _auth=FirebaseAuth.instance;


  // Login Method
  Future<UserCredential> SignInWithEmailAndPassword(String email, password) async{
    try{
      UserCredential userCredential= await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

//   Register Method
  Future<UserCredential> SignUpWithEmailAndPassword(String email, password)async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;

    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

//Sign Out
  Future <void> signOut() async{
    return await _auth.signOut();

}
}