import 'package:devloper_app/presentaion/ResumATS.dart';
import 'package:devloper_app/presentaion/screen/widget/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/cv_cubit.dart';
import '../../data/models/cvmodel.dart';
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
      body: BlocConsumer<CvCubit, CvState>(
        listener: (context, state) {
          if (state is CVSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('CV submitted successfully')),
            );
          } else if (state is CVFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.error}')),
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
                              builder: (context) => const PersonalDetails(),
                            ),
                          );
                        }),
                    ListItem(
                      icon: Icons.school,
                      title: 'Education',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: BlocProvider.of<CvCubit>(context),
                              child: const EducationScreen(),
                            ),
                          ),
                        );
                      },
                    ),
                    ListItem(
                        icon: Icons.play_lesson,
                        title: 'Courses',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CoursesScreen(),
                            ),
                          );
                        }),
                    ListItem(
                        icon: CupertinoIcons.text_badge_star,
                        title: 'Skills',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SkillsScreen(),
                            ),
                          );
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
                              builder: (context) => const ExperienceScreen(),
                            ),
                          );
                        }),
                    ListItem(
                        icon: Icons.rocket_launch,
                        title: 'Projects',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProjectsScreen(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final cubit = BlocProvider.of<CvCubit>(context);
                  final cvModel = CVModel(
                    education: cubit.educationList,
                  );
                  cubit.createCV(cvModel); // ارسال بيانات السيرة الذاتية
                },
                child: const Text("Submit information"),
              ),
              BlocBuilder<CvCubit, CvState>(
                builder: (context, state) {
                  Widget content;

                  if (state is CVInitial) {
                    content = const SizedBox(); // أو يمكن عرض شيء افتراضي
                  } else if (state is CVLoading) {
                    content = const Center(child: CircularProgressIndicator());
                  } else if (state is CVSuccess) {
                    content = Column(
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ElevatedButton(
                            onPressed: () async {
                              // عرض السيرة الذاتية على شاشة الـ ATS
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AtsResumePdfScreen(
                                      resume: state.response),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor:
                                  const Color.fromARGB(255, 91, 45, 240),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 91, 45, 240)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text('View ATS Resume',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ],
                    );
                  } else if (state is CVFailure) {
                    content = Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(state.error,
                            style: const TextStyle(color: Colors.red)),
                      ],
                    );
                  } else {
                    content = const SizedBox();
                  }

                  return SingleChildScrollView(child: content);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
