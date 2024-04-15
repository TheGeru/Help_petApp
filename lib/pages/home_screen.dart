import 'package:flutter/material.dart';
import 'dart:async';
import 'package:help_pet_app/pages/loggin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    // Inicia un temporizador para cambiar automáticamente la página cada 5 segundos
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPageIndex < 2) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help-pet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Carrusel de fotos como fondo
            Positioned.fill(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: [
                  Image.network(
                    'https://www.imagenesgratis.org/wp-content/uploads/2023/09/Absolute_Reality_v16_A_cute_dog_the_embodiment_of_charm_and_ch_0.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://www.imagenesgratis.org/wp-content/uploads/2023/09/Absolute_Reality_v16_A_cute_dog_the_epitome_of_adorable_with_f_0.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://www.imagenesgratis.org/wp-content/uploads/2023/09/Absolute_Reality_v16_A_funny_dog_the_embodiment_of_laughter_wi_0.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Encuentra a tu mejor amigo en cualquier parte',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  MyButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

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
            const TextStyle(fontSize: 20),
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
