import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:help_pet_app/repository/user_auth_repository.dart';
import 'package:logger/logger.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final UserAuthRepository _authRepository =
      FirebaseAuthRepository(firebaseAuth: FirebaseAuth.instance);
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    String username = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 219, 72, 14),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Email:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (value) => email = value,
              decoration: const InputDecoration(
                hintText: 'Ingrese su correo electrónico',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Contraseña:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (value) => password = value,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Ingrese su contraseña',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nombre de usuario:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (value) => username = value,
              decoration: const InputDecoration(
                hintText: 'Ingrese su nombre de usuario',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _authRepository.registerUser(
                      email: email, password: password, username: username);
                } on FirebaseAuthException catch (e) {
                  _logger.e('Error durante el registro: ${e.message}');
                } on FirebaseException catch (e) {
                  _logger.e('Error durante el registro: ${e.message}');
                } catch (e) {
                  _logger.e('Error durante el registro: $e');
                }
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
