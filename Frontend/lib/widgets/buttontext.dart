import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: SizeConfig.blockSizeV! * 13.5,
        width: SizeConfig.blockSizeV! * 100,
        child: TextButton(
          onPressed: onPressed,
          child: Text(buttonName,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white))),
          style: TextButton.styleFrom(backgroundColor: bgColor),
        ),
      ),
    );
  }
}
