// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bus_tracker/pages/view_buses.dart';

class EmailVerificationPage extends StatefulWidget {
  final String email;
  const EmailVerificationPage({super.key , required this.email});
  
  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
   
  // Error message visibility
  String? errorMessage;

  bool isValidCode() {
    // Check if all the entered values are digits and the length is 4
    String code = controllers.map((c) => c.text).join();
    return code.length == 4 && code.contains(RegExp(r'^\d+$'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'TRIPS'),
      body: _buildBody(context),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Bus Image
          Image.asset(
            'assets/images/bus.png',
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),

          // Title
          const Text(
            "Verify your email",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          // Subtitle
          Text(
            "Please enter the 4-digit code sent to ${widget.email}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),

          // Code Input Fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return SizedBox(
                width: 60,
                height: 60,
                child: TextField(
                  controller: controllers[index],
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 3) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              );
            }),
          ),

          // Error message (if any)
          if (errorMessage != null)
            Text(
              errorMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

          ElevatedButton(
            onPressed: () {
              String code = controllers.map((c) => c.text).join();

              if (!isValidCode()) {
                setState(() {
                  errorMessage = "Please enter a valid 4-digit code.";
                });
              } else {
                setState(() {
                  errorMessage = null; // Clear error if valid
                });
                print("Verification code: $code");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewBuses()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: yellowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
            ),
            child: const Text(
              "CONFIRM",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
