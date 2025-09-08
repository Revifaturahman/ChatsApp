import 'package:chatsapp/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreenPage extends StatelessWidget {
  const IntroductionScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      PageViewModel(
        title: "Selamat Datang di AingChat",
        body:
            "Aplikasi chat sederhana, cepat, dan asik buat ngobrol sama teman.",
        image: const Icon(
          Icons.chat_bubble_outline,
          size: 120,
          color: Colors.white,
        ),
        decoration: const PageDecoration(
          pageColor: Color(0xFF00BCD4), // cyan
          titleTextStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyTextStyle: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ),
      PageViewModel(
        title: "Aman & Mudah Digunakan",
        body:
            "Nikmati pengalaman chatting dengan tampilan simpel dan keamanan terjaga.",
        image: const Icon(Icons.lock_outline, size: 120, color: Colors.white),
        decoration: const PageDecoration(
          pageColor: Color(0xFF4CAF50), // hijau
          titleTextStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyTextStyle: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ),
      PageViewModel(
        title: "Mulai Chat Sekarang!",
        body: "Buat obrolan lebih seru bersama teman-teman hanya di AingChat.",
        image: const Icon(Icons.send, size: 120, color: Colors.white),
        decoration: const PageDecoration(
          pageColor: Color(0xFF673AB7), // ungu
          titleTextStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyTextStyle: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ),
    ];

    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text("Skip", style: TextStyle(color: Colors.black54)),
        showNextButton: true,
        next: const Text("NEXT >>"),
        done: const Text(
          "Mulai",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginPage()),
          );
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(8.0),
          activeSize: const Size(20.0, 8.0),
          activeColor: Theme.of(context).colorScheme.primary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
