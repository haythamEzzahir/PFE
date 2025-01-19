import 'package:flutter/material.dart';

// COLORS :
const Color yellowBar = Color.fromRGBO(255, 223, 0, 1); // Replace with your actual color


// FONTS :
const TextStyle boldTextStyle = TextStyle(
  fontSize: 24,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);


// WIDGETS :

//appBar

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final TextStyle? titleTextStyle;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.backgroundColor = yellowBar,
    this.titleTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: onBackPressed ?? () => Navigator.pop(context), // Default action
      ),
      title: Text(
        title,
        style: titleTextStyle ?? boldTextStyle,
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Default AppBar height
}




// Backgroud
Widget BackgroundWidget({List<Widget> children = const []}) {
  return Scaffold(
  body: SafeArea(
    child: Stack(
      alignment: Alignment.center,
      children: [
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
                color: yellowBar,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Padding(
                padding: const EdgeInsets.all(17),
                child: Image.asset(
                  'assets/images/bus.png',
                ),
              ),
            ),
      ],
    )
    ),
  );
}



// bottomBar
class CustomBottomBar extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const CustomBottomBar({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 68,
        width: double.infinity,
        color: yellowBar, // Customize the color if needed
        alignment: Alignment.center,
        child: Text(
          text,
          style:boldTextStyle,  // Customize the text color if needed
          
        ),
      ),
    );
  }
}

 



//textField



class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.isPassword = false,
    this.controller,
    this.labelStyle,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, // Line color
            width: 1.0,         // Line thickness
          ),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword, // Hides the text if true
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle ??
              TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
          border: InputBorder.none, // Removes default border
          contentPadding: EdgeInsets.only(bottom: 5.0),
        ),
        
      ),
       
    );
  }
}
