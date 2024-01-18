// import 'package:connect_firebase/models/user.dart';
import 'package:connect_firebase/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Iniciar sesión con correo y contraseña
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // print('Autenticacion correcta: ${result.user}');
      return result.user;
    } catch (e) {
      print('Error al iniciar sesión: $e');
      return null;
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }

}
