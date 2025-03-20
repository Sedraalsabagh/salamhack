import 'package:devloper_app/presentaion/screen/widget/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // ة
import '../../business_logic/cubit/cv_cubit.dart';
import '../../data/repository/CVRepository.dart';
import '../../data/webService/CVWebServices.dart';
import 'course_screen.dart';
import 'education_screen.dart';
import 'experience_screen.dart';
import 'personal_details.dart';
import 'project_screen.dart';
import 'widget/Listitem.dart';
import 'widget/section_title.dart';
import 'skills_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fD),
      appBar: const CustomAppBar(title: "Create Your Resume"),
      body: BlocProvider(
        create: (_) => CvCubit(CVRepository(cvWebServices: CVWebServices())),
        child: BlocConsumer<CvCubit, CvState>(
          listener: (context, state) {
            if (state is CVSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('S')),
              );
            } else if (state is CVFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(': ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 24),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 16),
                    children: [
                      const SectionTitle(title: 'Sections'),
                      ListItem(
                          icon: Icons.person_pin,
                          title: 'Personal Details',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PersonalDetails()));
                          }),
                      ListItem(
                          icon: Icons.school,
                          title: 'Education',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EducationScreen()));
                          }),
                      ListItem(
                          icon: Icons.play_lesson,
                          title: 'Courses',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CoursesScreen()));
                          }),
                      ListItem(
                          icon: CupertinoIcons.text_badge_star,
                          title: 'Skills',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SkillsScreen()));
                          }),
                      const SizedBox(height: 10),
                      const SectionTitle(title: 'More Sections'),
                      ListItem(
                          icon: Icons.workspace_premium,
                          title: 'Experience',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ExperienceScreen()));
                          }),
                      ListItem(
                          icon: Icons.rocket_launch,
                          title: 'Projects',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProjectsScreen()));
                          }),
                    ],
                  ),
                ),
                // BottomButton(),
              ],
            );
          },
        ),
      ),
    );
  }
}
