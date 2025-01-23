import 'package:flutter/material.dart';
import 'package:bus_tracker/pages/constants.dart';
import 'package:bus_tracker/pages/virefy.dart';

final _formKey = GlobalKey<FormState>();

class Creataccount extends StatelessWidget {
  const Creataccount({super.key});

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
                  const SizedBox(
                    height: 100,
                  ),
                  const Text("Creat account",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  const CustomTextField(
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 50),
                  const CustomTextField(
                    labelText: 'Password',
                    isPassword: true,
                    // controller: passwordController,
                  ),
                  const SizedBox(height: 50),
                  const CustomTextField(
                    labelText: 'Re-enter Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 50),
                  const CustomTextField(
                    labelText: 'Mobile #',
                    isPassword: false,
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EmailVerificationPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: yellowBar,
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
