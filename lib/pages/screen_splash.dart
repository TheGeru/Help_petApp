import 'package:flutter/material.dart';
import 'package:help_pet_app/pages/home_screen.dart';
import 'package:rive/rive.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen with Rive Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late BuildContext _context; // Guardar referencia al contexto

  @override
  void initState() {
    super.initState();
    // Establecer un temporizador para navegar a la pantalla principal después de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      // Navegar a la pantalla principal
      Navigator.of(_context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFA6100), // Color de fondo con formato hexadecimal
      body: Center(
        child: RiveAnimation.asset('assets/help-pet_logo.riv'),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _context = context; // Obtener el contexto en didChangeDependencies()
  }
}
