import 'package:flutter/material.dart';

class ChooseSnackScreen extends StatefulWidget {
  const ChooseSnackScreen({super.key});

  @override
  State<ChooseSnackScreen> createState() => _ChooseSnackScreenState();
}

class _ChooseSnackScreenState extends State<ChooseSnackScreen> {
  final categories = ["All categories", "Salty", "Sweet", "Delicate"];
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
                  spacing: 20,
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
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0,
                              ),
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 1,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white.withValues(alpha: 0.2),
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
                                                offset: Offset(4, 0),
                                                child: Image.asset("assets/details/Lunch.png", width: 24, height: 24,
                                                color: Colors.white,),
                                              ),
                                              SizedBox(width: 8),
                                              Text(snackCategory),

                                              // right arrow
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
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,),
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
