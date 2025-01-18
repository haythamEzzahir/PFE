import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
              color: Color.fromRGBO(255, 223, 0, 1),
               borderRadius: BorderRadius.circular(17),
            ),
            child: Image.asset(
              'assets/images/bus.png',
               width: 111,
               height: 111,
            )
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
