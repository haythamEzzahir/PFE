import 'package:bus_tracker/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OTPVerificationPage extends StatefulWidget {
  final String email;

  const OTPVerificationPage({super.key, required this.email});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  String? errorMessage;

  void verifyOTP() async {
    try {
      // Combine the OTP digits into a single string
      String otp = controllers.map((controller) => controller.text).join();

      // For demonstration, we assume the OTP is correct if it's not empty
      // In a real app, you would validate the OTP with your backend or Firebase
      if (otp.length == 4) {
        User user = FirebaseAuth.instance.currentUser!;

        // Reload user to get the latest email verification status
        await user.reload();
        user = FirebaseAuth.instance.currentUser!;

        if (user.emailVerified) {
          // Update Firestore to mark email as verified
          await FirebaseFirestore.instance.collection('users').doc(widget.email).update({
            'emailVerified': true,
          });

          // Navigate to login page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          setState(() {
            errorMessage = "Email not verified. Please check your email and verify.";
          });
        }
      } else {
        setState(() {
          errorMessage = "Invalid OTP. Please enter a 4-digit code.";
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Error verifying OTP: $e";
      });
    }
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
          Image.asset(
            'assets/images/bus.png',
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          const Text(
            "Verify your email",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "Please enter the 4-digit code sent to your email.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
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
            onPressed: verifyOTP,
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