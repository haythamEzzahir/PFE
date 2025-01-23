import 'package:flutter/material.dart';
import 'package:bus_tracker/pages/welcome.dart'; // Import the Welcome page

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    // Navigate to the Welcome page after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: Alignment.center, children: [
          Image.asset(
            'assets/images/bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: 146,
            height: 146,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 223, 0, 1),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Image.asset(
              'assets/images/bus.png',
              width: 111,
              height: 111,
            ),
          ),
          const Positioned(
            top: 81,
            child: Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 494,
            child: Text(
              'TRIPS',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
