import 'package:flutter/material.dart';

class CvScreen extends StatefulWidget {
  const CvScreen({super.key});

  @override
  State<CvScreen> createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("ATS CV ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),),
      ),
    );
  }
}