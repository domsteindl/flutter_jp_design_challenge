import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_jp_design_challenge/icons/my_icons.dart';

class ChooseSnackScreen extends StatefulWidget {
  const ChooseSnackScreen({super.key});

  @override
  State<ChooseSnackScreen> createState() => _ChooseSnackScreenState();
}

class _ChooseSnackScreenState extends State<ChooseSnackScreen> {
  final categories = ["All categories", "Salty", "Sweet", "Delicate"];
  final List<Product> products = [
    Product(
      name: "Mogli's Cup",
      description: "Strawberry ice cream",
      price: 8.99,
      likes: 200,
      imagePath: "assets/grafiken/cat_cupcakes_3D.png",
    ),
    Product(
      name: "Balu's Cup",
      description: "Pistachio ice cream",
      price: 8.99,
      likes: 165,
      imagePath: "assets/grafiken/Ice_cream.png",
    ),
    Product(
      name: "Smiling David",
      description: "Ice cone",
      price: 3.99,
      likes: 310,
      imagePath: "assets/grafiken/ice_cream_stick_3D.png",
    ),
    Product(
      name: "Kai in a Cone",
      description: "Ice cone",
      price: 3.99,
      likes: 290,
      imagePath: "assets/grafiken/Icecream_3D.png",
    ),
  ];
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/backgrounds/bg_mainscreen.png",
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 14.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 25,
                  children: [
                    Text(
                      "Choose Your Favorite\nSnack",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(categories.length, (index) {
                          final selected = index == selectedIndex;
                          if (index == 0) {
                            return Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black12,
                                    const Color.fromARGB(200, 238, 117, 198),
                                  ],
                                ),

                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  width: 1,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.white,
                                  ),
                                  dropdownColor: Colors.black87,
                                  value: categories[0],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  selectedItemBuilder: (context) {
                                    return categories.map((snackCategory) {
                                      return SizedBox(
                                        width: 127,
                                        child: Row(
                                          children: [
                                            Transform.translate(
                                              offset: Offset(6, 0),
                                              child: Image.asset(
                                                "assets/details/Lunch.png",
                                                width: 24,
                                                height: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(snackCategory),
                                          ],
                                        ),
                                      );
                                    }).toList();
                                  },
                                  items: categories
                                      .map(
                                        (snackCategory) => DropdownMenuItem(
                                          value: snackCategory,
                                          child: Text(snackCategory),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedIndex = categories.indexOf(
                                        value!,
                                      );
                                    });
                                  },
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => selectedIndex = index),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 13,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: selected
                                      ? Colors.white.withValues(alpha: 0.8)
                                      : Colors.white.withValues(alpha: 0.2),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  categories[index],
                                  style: TextStyle(
                                    color: selected
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Stack(
                      children: [
                        // Background image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                            child: Image.asset("assets/details/cut_card.png"),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFE970C4),
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '4.8',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Bottom-left button
                        Positioned(
                          bottom: 35,
                          left: 16,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFE970C4),
                                  blurRadius: 12,
                                  spreadRadius: -4,
                                  offset: Offset(0, 6),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFFE970C4),
                                width: 1,
                              ),
                              gradient: LinearGradient(
                                colors: [Color(0xFFBB8DE1), Color(0xFF908CF5)],
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Order Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Bottom-right burger image
                        Positioned(
                          bottom: -15,
                          right: 0,
                          child: Image.asset(
                            'assets/grafiken/Burger_3D.png',
                            width: 200, // adjust as needed
                            height: 200,
                          ),
                        ),

                        // Top-left Description
                        Positioned(
                          left: 16,
                          top: 16,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Angi\'s Yummy Burger',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Delish vegan burger',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'that tastes like heaven',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 15),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        MyIcons.jpCurrency,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '13.99',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'We Recommend',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 270,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Container(
                            width: 190,
                            margin: const EdgeInsets.only(right: 22),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFBB8DE1), Color(0xFF908CF5)],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: GestureDetector(
                                    onTap: () {
                                      // DetailsScreen
                                    },
                                    child: Image.asset(
                                      product.imagePath,
                                      width: double.infinity,
                                      height: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  product.description,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Spacer(),
                                Text(
                                  product.price.toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite,
                                      size: 16,
                                      color: Colors.pinkAccent,
                                    ),
                                    const SizedBox(width: 4),
                                    Text("${product.likes}"),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final int likes;
  final String imagePath;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.likes,
    required this.imagePath,
  });
}
