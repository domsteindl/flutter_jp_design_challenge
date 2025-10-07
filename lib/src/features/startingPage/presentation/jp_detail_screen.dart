import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_jp_design_challenge/icons/my_icons.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String imagePath;
  final double price;
  final int likes;

  const ProductDetailPage({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.likes,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  String selectedSize = "M";

  double get sizeMultiplier {
    switch (selectedSize) {
      case "S":
        return 0.8;
      case "L":
        return 1.2;
      case "M":
      default:
        return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.price * quantity * sizeMultiplier;

    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.3),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
          heightFactor: 0.88,
          widthFactor: 1.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: Container(
              color: Colors.grey[900],
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    top: -400,
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: Colors.white.withValues(alpha: 0.2)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.favorite_outline,
                                        color: Colors.pinkAccent),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.likes.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                widget.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                                "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(MyIcons.jpCurrency, color: Colors.white, size: 18,),
                                  Text(
                                    "${(widget.price * sizeMultiplier).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                height: 1,
                                color: Colors.white.withValues(alpha: 0.3),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text("Ingredients",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: const [
                                          Icon(Icons.local_dining,
                                              color: Colors.white, size: 20),
                                          SizedBox(width: 6),
                                          Icon(Icons.spa,
                                              color: Colors.white, size: 20),
                                          SizedBox(width: 6),
                                          Icon(Icons.grass,
                                              color: Colors.white, size: 20),
                                          SizedBox(width: 6),
                                          Icon(Icons.eco,
                                              color: Colors.white, size: 20),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text("Reviews",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: List.generate(
                                          5,
                                          (_) => const Icon(Icons.star,
                                              color: Colors.yellow, size: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, color: Colors.white, size: 30),
                    ),
                  ),
                
                  Positioned(
                    bottom: 100,
                    left: 50,
                    right: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                   
                        Row(
                          children: ["S", "M", "L"].map((size) {
                            bool isSelected = selectedSize == size;
                            return GestureDetector(
                              onTap: () => setState(() => selectedSize = size),
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.pinkAccent
                                      : Colors.white.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  size,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) setState(() => quantity--);
                              },
                              icon: const Icon(Icons.remove_circle_outline,
                                  color: Colors.white),
                            ),
                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            IconButton(
                              onPressed: () => setState(() => quantity++),
                              icon: const Icon(Icons.add_circle_outline,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 50,
                    right: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.pinkAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                              color: Colors.pinkAccent, width: 2),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Text(
                            "Order Now  • ",
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Icon(MyIcons.jpCurrency, color: Colors.white,),
                           Text(
                            "${totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
