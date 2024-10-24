import 'package:flutter/material.dart';

Widget customEditableField({
  required String inputText,
  required VoidCallback? onTap,
  EdgeInsetsGeometry padding = const EdgeInsets.all(10),
  double borderRadius = 8.0,
  Color borderColor = Colors.grey,
  Color backgroundColor = Colors.white,
  IconData icon = Icons.arrow_forward_ios,
  double iconSize = 16.0,
  Color iconColor = Colors.grey,
  EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 16),
}) {
  return Padding(
    padding: margin,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                   child: Text(inputText),
                  ),
                  Icon(icon, size: iconSize, color: iconColor),
                ],
              ),
            )
        ]
        
        ),
      ),
    ),
  );
}



