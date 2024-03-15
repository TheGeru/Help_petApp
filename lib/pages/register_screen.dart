import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Nombre de usuario:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Ingrese su nombre de usuario',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Email:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Ingrese su correo electrónico',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Contraseña:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Ingrese su contraseña',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Acción para iniciar sesión
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
