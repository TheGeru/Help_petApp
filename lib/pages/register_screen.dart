import 'package:flutter/material.dart';
import 'package:help_pet_app/pages/map_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 219, 72, 14),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese su correo electrónico',
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
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Ingrese su contraseña',
                  contentPadding: EdgeInsets.all(16.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapScreen()),
                );
              },
              child: const Text('Iniciar sesión'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Acción para iniciar sesión con Google
              },
              child: const Text('Iniciar con Google'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Acción para iniciar sesión con Facebook
              },
              child: const Text('Iniciar con Facebook'),
            ),
          ],
        ),
      ),
    );
  }
}
