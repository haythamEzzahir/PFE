import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bus_tracker/pages/list_buses.dart';

class ViewBuses extends StatelessWidget {
  ViewBuses({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Trips",
        showLogoutButton: true,
        onLogoutPressed: signUserOut,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50, // Adjust size as needed
              backgroundColor: Colors.grey[300], // Default background
              backgroundImage: user.photoURL != null
                  ? NetworkImage(user.photoURL!) // Load from URL
                  : null,
              child: user.photoURL == null
                  ? const Icon(Icons.person, size: 50, color: Colors.grey)
                  : null, // Show default icon if no image
            ),
             const SizedBox(
                height: 40),
            Text(
              'Hi ' + user.email! + "!",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 40), // Space between greeting and first button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BusListPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: yellowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 100,
                ),
              ),
              child: const Text(
                'VIEW BUSES',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'or',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
                height: 20), // Space between 'or' and the next button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewBuses()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: yellowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 100,
                ),
              ),
              child: const Text(
                'CREATE ROUTE',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
