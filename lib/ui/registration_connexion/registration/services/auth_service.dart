/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _firebase = FirebaseAuth.instance;

class AuthService {
  Future<void> createUser({
    required name,
    required phone,
    required email,
    required password,
    imageFile,
  }) async {
    try {
      final userCredental = await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final storageRef =
          FirebaseStorage.instance.ref().child('user_images').child(
                '${userCredental.user!.uid}.jpg',
              );
      await storageRef.putFile(imageFile);
      // ignore: unused_local_variable
      final imageUrl = await storageRef.getDownloadURL();
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        throw Exception('Ce utilisateur existe déjà');
      }
      if (error.code == 'invalid-email') {
        throw Exception('Adresse email invalide');
      }
      if (error.code == 'weak-password') {
        throw Exception('Utiliser un mot de passe fort');
      }
    }
  }

  Future<void> connectUser({required email, required password}) async {
    try {
      // ignore: unused_local_variable
      final userCredential = await _firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        throw Exception("Ce utilisateur n'existe pas");
      }
      if (error.code == 'invalid-email') {
        throw Exception('Adresse email invalide');
      }
      if (error.code == 'wrong-password') {
        throw Exception('Mot de passe incorrect');
      }
    }
  }

  Future<void> disconnectUser() async {
    await _firebase.signOut();
  }

  /* Future<void> updateUser() async{
    
  }*/
}
*/