import 'package:shop_eazy/store_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100.withValues(alpha: 200),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150.0),
                      topRight: Radius.circular(150.0),
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: -20,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "ShopEazy",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => StoreScreen()),
                );
              },
              child: Text(
                "Get Started",
                style: TextStyle(color: Colors.orange.shade300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
