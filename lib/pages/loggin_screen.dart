import 'package:flutter/material.dart';
import 'package:help_pet_app/pages/map_screen.dart';
import 'package:help_pet_app/pages/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  //* FUNCION DE VALIDACION DE INICIO DE SESION CON FIREBASE

  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        //! WARNING A REVISAR
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } on FirebaseAuthException catch (e) {
      final String errorMessage =
          'Error de autenticación de Firebase: ${e.code} - ${e.message}';
      debugPrint(errorMessage);
      //! MEJORA DE MANEJO DE MENSAJES
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error de inicio de sesión: ${e.message}'),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión',
            style: TextStyle(color: Colors.blue)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFDF2F8C), Color(0xFFFC9A3E)],
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  onChanged: (value) =>
                      email = value, //* CAPTURAMOS EL VALOR DEL INPUT DE CORREO
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su correo electrónico',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  onChanged: (value) => password = value,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su contraseña',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => loginUser(
                    email: email, password: password, context: context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Iniciar sesión',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Acción para iniciar sesión con Google
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Iniciar con Google',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Acción para iniciar sesión con Facebook
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Iniciar con Facebook',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
                child: const Text('No tienes una cuenta? Registrate',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}