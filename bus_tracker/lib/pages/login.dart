import 'package:bus_tracker/pages/view_buses.dart';
import 'package:flutter/material.dart';
import 'package:bus_tracker/pages/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'TRIPS',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    "Sign in",
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
                      final emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
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
                    
                  ),
                  const SizedBox(height: 100),
                  Image.asset(
                    'assets/images/bus.png',
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 110),
                    ),
                    onPressed: () {
                // Handle form submission
                 if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                } else {
                  print('Email: ${_emailController.text}');
                  print('Password: ${_passwordController.text}');
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ViewBuses()),
                      );
                }
              },
                    child: const Text(
                      "SIGN IN",
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
