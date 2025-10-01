import 'package:flutter/material.dart';
import 'package:flutter_jp_design_challenge/src/features/startingPage/presentation/jp_start_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/backgrounds/bg_startscreen.png',
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 110,
              left: 2,
              child: Image.asset('assets/grafiken/chick_cupcakes_3D.png'),
            ),
            Positioned.fill(
              top: 320,
              child: Image.asset('assets/details/T2.png', fit: BoxFit.fitWidth,),
            ),
            StartScreen(),
          ],
        ),
      ),
    );
  }
}
