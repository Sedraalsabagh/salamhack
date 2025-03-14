import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'course_screen.dart';
import 'education_screen.dart';
import 'personal_details.dart';
import 'project_screen.dart';
import 'widget/Listitem.dart';
import 'widget/bottom_button.dart';
import 'widget/section_title.dart';
import 'skills_screen.dart'; // استيراد شاشة المهارات

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fD),
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 91, 45, 240),
            Color.fromARGB(255, 141, 20, 141),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: [
                const SectionTitle(title: 'Sections'),
                ListItem(icon: Icons.person_pin, title: 'Personal Details', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalDetails()));
                }),
                ListItem(icon: Icons.summarize_rounded, title: 'Summary', onTap: () {}),
                ListItem(icon: Icons.school, title: 'Education', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EducationScreen()));
                }),
                  ListItem(icon: Icons.play_lesson, title: 'Courses', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CoursesScreen()));
                }),
                ListItem(icon: CupertinoIcons.text_badge_star, title: 'Skills', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SkillsScreen()));
                }),

                const SizedBox(height: 10),
                const SectionTitle(title: 'More Sections'),
                ListItem(icon: Icons.workspace_premium, title: 'Experience', onTap: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => const ExperienceScreen()));
                 }),
              
                ListItem(icon: Icons.rocket_launch, title: 'Projects', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProjectsScreen()));
                }),
             
              ],
            ),
          ),
          BottomButton(),
        ],
      ),
    );
  }
}
