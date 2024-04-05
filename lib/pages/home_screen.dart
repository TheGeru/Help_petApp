import 'package:flutter/material.dart';
import 'package:help_pet_app/pages/loggin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help-pet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, // Esto quita la etiqueta de "debug"
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFDF2F8C), Color(0xFFFC9A3E)],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                title: const Text('Help-Pet'),
                backgroundColor:
                    Colors.transparent, // Hace que el AppBar sea transparente
                elevation: 0, // Quita la sombra del AppBar
              ),
            ),
            Positioned.fill(
              top: AppBar()
                  .preferredSize
                  .height, // Asegura que el contenido comience debajo del AppBar
              child: const MyHomePage(title: 'Help-pet'),
            ),
          ],
        ),
      ),
    );
  }
}

//_-----------------------------------------------

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image(
            image: NetworkImage(
              'https://img.pikbest.com/origin/09/09/20/93spIkbEsT8SV.png!sw800',
            ),
            height: 240,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

//_----------------------------------------------------
class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(fontSize: 20), // Tamaño del texto del botón
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 20, horizontal: 38)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.white, width: 2),
          )),
        ),
        child: const Text('Lets start'),
      ),
    );
  }
}

//----------------------------------------------------
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Text(
            'Encuentra a tu mejor amigo en cualquier parte',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'Bienvenido a Help-pet, una herramienta la cual te lleva a estar siempre cerca de tu mascota',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          MyImageWidget(),
          SizedBox(height: 5),
          MyButtonWidget(),
        ],
      ),
    );
  }
}

