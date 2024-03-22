//import 'package:countertest/features/user_auth/presentation/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


abstract class UserAuthRepository {
  Future<void> registerUser({//metodo, a este metodo le pasamos tres parametros para el registro
    required String email,
    required String password,
    required String username,
  });

  Future<void> loginUser({//metodo similar pero para iniciar sesion
    required String email,
    required String password,
  });
}

class FirebaseAuthRepository implements UserAuthRepository {
  FirebaseAuthRepository({required FirebaseAuth firebaseAuth})//constructor
      : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> registerUser({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Agregar la lógica para guardar el nombre de usuario en Firebase
    } on FirebaseAuthException catch (e) {
      final String errorMessage =
          'Error de autenticación de Firebase: ${e.code} - ${e.message}';
      debugPrint(errorMessage);
      throw errorMessage;
    }
  }

  @override
  Future<void> loginUser({
    required String email,
    required String password,

  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      final String errorMessage =
          'Error de autenticación de Firebase: ${e.code} - ${e.message}';
      debugPrint(errorMessage);
      throw errorMessage;
    }
  }
}
