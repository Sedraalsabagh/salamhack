import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String date;
  final String imageUrl;
  const JobCard(
      {super.key,
      required this.title,
      required this.date,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:
              Image.asset(imageUrl, width: 70, height: 80, fit: BoxFit.cover),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          date,
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Icon(Icons.favorite_border),
      ),
    );
  }
}
