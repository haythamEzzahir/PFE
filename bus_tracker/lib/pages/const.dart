import 'package:flutter/material.dart';

class AppColors {
  static const Color yellow = Color.fromRGBO(255, 223, 0, 1);
}

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.yellow,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black), // Arrow icon
        onPressed: () {
          Navigator.pop(context); // Go back to the previous screen
        },
      ),
      title: const Text(
        'TRIPS',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true, // Centers the title
      elevation: 0, // Removes shadow
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
