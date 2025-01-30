import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'verify.dart'; // Your verification page
import 'constants.dart';

final _formKey = GlobalKey<FormState>();

class Creataccount extends StatelessWidget {
  Creataccount({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  Future<void> _verifyPhoneNumber(BuildContext context) async {
    String phoneNumber = _mobileController.text.trim();

    // Ensure the phone number is in the correct format (e.g., +1234567890)
    if (!phoneNumber.startsWith('+')) {
      phoneNumber = '+212$phoneNumber';
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-sign-in if the verification is completed automatically
          await FirebaseAuth.instance.signInWithCredential(credential);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmailVerificationPage(
                email: _emailController.text,
                verificationId: '', // Not needed here
              ),
            ),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification failed: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          // Navigate to the verification page with the verificationId
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmailVerificationPage(
                email: _emailController.text,
                verificationId: verificationId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout if needed
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'TRIPS'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    "Create account",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomTextField(
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      if (!emailRegex.hasMatch(value)) {
                        return 'Invalid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  CustomTextField(
                    labelText: 'Password',
                    isPassword: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  CustomTextField(
                    labelText: 'Re-enter Password',
                    isPassword: true,
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  CustomTextField(
                    labelText: 'Mobile #',
                    isPassword: false,
                    keyboardType: TextInputType.phone,
                    controller: _mobileController,
                  ),
                  const SizedBox(height: 90),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _verifyPhoneNumber(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form validation failed')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 50),
                    ),
                    child: const Text(
                      "CREATE ACCOUNT",
                      style: boldTextStyle,
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
