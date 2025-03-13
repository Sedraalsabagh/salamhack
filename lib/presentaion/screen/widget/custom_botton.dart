import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55, 
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4A15F4), 
            Color(0xFF6B1A6B),
          ],
          begin: Alignment.centerLeft, 
          end: Alignment.centerRight, 
        ),
        borderRadius: BorderRadius.circular(16), 
        boxShadow: [
          BoxShadow(
            color: const Color(0xff4a1548).withOpacity(0.3),
            offset: const Offset(0, 10), 
            blurRadius: 20, 
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, 
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16, 
          ),
        ),
      ),
    );
  }
}
