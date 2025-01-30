
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
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  void signUserIn() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Validate email format

    if (!emailRegex.hasMatch(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email address')),
      );
      return;
    }

    // If all validations pass, navigate to the next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ViewBuses()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'TRIPS',
        ),
        body:
      
         Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/images/bus.png',
                    height: 80,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

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

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "forgot password?",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Mybutton(onTap: signUserIn, text: "Sign in"),

                  const SizedBox(height: 50),

                  // google authentification

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: Colors.grey[400],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text("Or continue with"),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                     const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       squareTile(imagePath: 'assets/images/googleL.png'),

                     SizedBox(width: 20,),

                       squareTile(imagePath: 'assets/images/appleLogo.png'),

                     ],
                   ),

                  const SizedBox(
                    height: 30,
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a menber?'),
                      SizedBox(width: 5),
                      Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
