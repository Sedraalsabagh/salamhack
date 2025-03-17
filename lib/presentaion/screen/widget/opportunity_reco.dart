import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String date;
  final String imageUrl;
  final List<Color> gradientColors;

  const JobCard({
    Key? key,
    required this.title,
    required this.date,
    required this.imageUrl,
    this.gradientColors = const [Color(0xFF6B1A6B), Color(0xFFB83280)],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imageUrl,
            width: 70,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF101010),
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
