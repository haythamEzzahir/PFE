import 'package:bus_tracker/pages/auth_page.dart';
import 'package:bus_tracker/pages/constants.dart';
// import 'package:bus_tracker/pages/login.dart';
import 'package:bus_tracker/pages/creatAccount.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// Import the next page

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background Image
            Positioned(
              child: Image.asset(
                'assets/images/bg.png',
                width: double.infinity,
                height: double.infinity, // Replace with your image asset
                fit: BoxFit.cover, // Ensures the image covers the entire screen
              ),
            ),

            // Content Layer: Positioned Widgets, Text, and other UI components
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 80), // Adds space from the top

                  // Widget 1 - First Text
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Welcome!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 180),
                  Container(
                    width: 146,
                    height: 146,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 223, 0, 1),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Image.asset(
                      'assets/images/bus.png', // Replace with your bus image asset
                      width: 111,
                      height: 111,
                    ),
                  ),

                  // Adds flexible space between widgets

                  // Widget 3 - Text "TRIPS"
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'BusTrack',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 180),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()),
                        );
                      },
                    
                        child: const Text("Create Account",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        text: 'Sign Up',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const AuthPage()),
          );
        },
      ),
    );
  }
}
