import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_jp_design_challenge/src/features/startingPage/presentation/jp_choose_snack_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF).withValues(alpha: 0),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFFFFFFF).withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.all(30),
                width: 370,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Feeling Snackish Today?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Explore Angi´s most popular snack selection\nand get instantly happy.",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    // Text.rich(
                    //   TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: "Explore Angi´s most popular snack selection",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       TextSpan(text: "\n"),
                    //       TextSpan(
                    //         text: "and get instantly happy.",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ],
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    SizedBox(height: 25),

                    // Gradient border + glow
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Color(0xFFE970C4)],
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.3],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 6),
                            color: Color(0xFFE970C4).withValues(alpha: 0.4),
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                          BoxShadow(
                            offset: Offset(0, 8),
                            color: Color(0xFFF69EA3).withValues(alpha: 0.3),
                            blurRadius: 30,
                            spreadRadius: 6,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(1.2),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFE970C4), Color(0xFFF69EA3)],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChooseSnackScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 200,
                              height: 48,
                              constraints: BoxConstraints(
                                minWidth: 100,
                                minHeight: 40,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Order Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
