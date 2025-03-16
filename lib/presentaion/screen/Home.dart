import 'package:devloper_app/constants/Colors.dart';
import 'package:devloper_app/presentaion/screen/widget/opportunity_reco.dart';

import 'package:flutter/material.dart';

import 'widget/bouttom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> jobs = [
    {
      "title": "Business Analyst",
      "date": "26 Apr, 6:30 PM",
      "image": "assets/images/forsa2.jpg"
    },
    {
      "title": "Web Developer",
      "date": "26 Apr, 6:30 PM",
      "image": "assets/images/forsa3.jpg"
    },
    {
      "title": "Mobile Developer",
      "date": "26 Apr, 6:30 PM",
      "image": "assets/images/forsa3.jpg"
    },
    {
      "title": "Mobile Developer",
      "date": "26 Apr, 6:30 PM",
      "image": "assets/images/forsa3.jpg"
    },
    {
      "title": "Mobile Developer",
      "date": "26 Apr, 6:30 PM",
      "image": "assets/images/forsa3.jpg"
    },
    {
      "title": "Mobile Developer",
      "date": "26 Apr, 6:30 PM",
      "image": "assets/images/forsa3.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: false,
        title: const UserGreeting(username: "SedraAlsabbagh"),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 20,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 238, 19, 19),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 253, 253),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Job Opportunities",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Column(
                  children: jobs.map((job) {
                    return JobCard(
                      title: job["title"]!,
                      date: job["date"]!,
                      imageUrl: job["image"]!,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserGreeting extends StatelessWidget {
  final String username;

  const UserGreeting({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 16),
      child: Column(
        children: [
          Text("Hi, $username",
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("How are you today?", style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
