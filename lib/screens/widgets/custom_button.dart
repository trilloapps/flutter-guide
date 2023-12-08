import 'package:flutter/material.dart';
import '../../utils/config_color.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.buttonName,
    required this.onPressed,
    this.buttonColor = menuColor,
    this.height,
    this.width,
    this.radius = 12,
    this.textSize = 16,
    this.textWeight = FontWeight.w500,
    this.elevation = 10.0, // Adjust the elevation value as needed
    this.pressColor,
  });

  final String buttonName;
  final VoidCallback onPressed;
  final Color buttonColor;
  final double? height;
  final double? width;
  final double radius;
  final double textSize;
  final FontWeight textWeight;
  final double elevation; // Added elevation property
  final Color? pressColor; // Updated pressColor to allow null

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation, // Set the elevation
      borderRadius: BorderRadius.circular(radius),
      color: menuColor,
      shadowColor: pressColor,
      child: InkWell(
        onTap: onPressed,
        splashColor:
        pressColor ?? Colors.grey[400], // Use default if pressColor is null
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          height: height ?? 50.0,
          width: width ?? 300.0,
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: textSize,
                fontWeight: textWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
