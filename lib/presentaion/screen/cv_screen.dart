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
      appBar: AppBar(
        title: const Text('ATS CV'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal Details Section
            const Text(
              "Personal Details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Username: "),
                    Text("Email: "),
                    Text("Phone: "),
                    Text("Location: "),
                    Text("LinkedIn: "),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Skills Section
            const Text(
              "Skills",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Python: Advanced"),
                    Text("Django Rest Framework: Intermediate"),
                    Text("PostgreSQL: Intermediate"),
                    Text("Docker: Beginner"),
                    Text("React.js: Beginner"),
                    Text("Git & GitHub: Intermediate"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Education Section
            const Text(
              "Education",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                        "Bachelor in Computer Science - Al-Sham Private University (2021 - 2025)"),
                    Text(
                        "Focused on software engineering, machine learning, and backend development."),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Projects Section
            const Text(
              "Projects",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Forsa Tech"),
                    Text(
                        "A job portal web and mobile application that connects job seekers with opportunities."),
                    Text("GitHub: https://github.com/safaabouzaid/forsa-tech"),
                    SizedBox(height: 10),
                    Text("Task Management API"),
                    Text(
                        "Developed a RESTful API for task management using Django Rest Framework."),
                    Text("GitHub: https://github.com/safaabouzaid/task-api"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Experience Section
            const Text(
              "Experience",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                        "Software Developer Intern at Tech Solutions Co. (2024-01 to 2024-06)"),
                    Text(
                        "Developed and optimized RESTful APIs using Django Rest Framework."),
                    SizedBox(height: 10),
                    Text("Freelance Backend Developer (2023-07 to Present)"),
                    Text(
                        "Designed and developed backend systems for various clients."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
