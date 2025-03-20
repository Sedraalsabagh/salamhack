import 'package:devloper_app/business_logic/cubit/recommentaion_cubit.dart';
import 'package:devloper_app/presentaion/screen/widget/custom_app_bar.dart';
import 'package:devloper_app/presentaion/screen/widget/opportunity_reco.dart';
import 'package:devloper_app/business_logic/cubit/job_opportunities_cubit.dart';
import 'package:devloper_app/business_logic/cubit/job_opportunities_state.dart';
import 'package:devloper_app/data/repository/Job_opportunities.dart';
import 'package:devloper_app/presentaion/screen/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
Widget showLoadingIndicator() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Image.asset(
      'assets/images/Animation.gif',
        width: 150.0,          
        height: 150.0,
      ),
    ),
  );
}
class _HomePageState extends State<HomePage> {
  var gradientColors = const [Color(0xFF6B1A6B), Color(0xFFB83280)];

  // قائمة محلية تحتوي على أسماء الصور
  final List<String> jobImages = [
    'dev1.jpg',
    'dev2.jpg',
    'dev3.jpg',
    'dev4.jpg',
  ];

  @override
  void initState() {
    super.initState();
    context.read<RecommendationCubit>().fetchRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Home"),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 19),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "    Recommended for you ",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 126, 30, 126),
                ),
              ),
            ),
            SizedBox(
              height: 190,
              child: BlocBuilder<RecommendationCubit, RecommendationState>(
                builder: (context, state) {
                  if (state is RecommendationInitial) {
                    return  Center(child: showLoadingIndicator());
                  } else if (state is RecommendationLoaded) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(16),
                      itemCount: state.recommendations.length,
                      itemBuilder: (context, index) {
                        final jobs = state.recommendations[index];
                        final imageName = jobImages[
                            index % jobImages.length]; // اختيار صورة بشكل دائري

                        return SizedBox(
                          width: 250,
                          child: JobCard(
                            key: ValueKey('${jobs.title}-${jobs.date}'),
                            title: jobs.title,
                            date: jobs.date,
                            imageName:
                                imageName, // تمرير اسم الصورة إلى البطاقة
                          ),
                        );
                      },
                    );
                  } else if (state is RecommendationError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "    All Job Oppertunities ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 126, 30, 126)),
              ),
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => JobCubit(JobRepository())..loadJobs(),
                child: BlocBuilder<JobCubit, JobState>(
                  builder: (context, state) {
                    if (state is JobLoading) {
                      return  Center(child: showLoadingIndicator());
                    } else if (state is JobLoaded) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: state.jobs.length,
                        itemBuilder: (context, index) {
                          final job = state.jobs[index];
                          return FadeInUp(
                            duration:
                                Duration(milliseconds: 500 + (index * 100)),
                            child: Card(
                              color: Colors.white,
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      job.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        // color:    Color(0xFFB83280),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    // const SizedBox(height: 13),
                                    //   Text(
                                    //   job.company,
                                    //   style: const TextStyle(
                                    //     fontSize: 18,
                                    //     // color:    Color(0xFFB83280),
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    const SizedBox(height: 13),
                                    Text(
                                      job.description,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 13),
                                    Text(
                                      "Required Skills: ${job.skills} ",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 13),
                                    Text(
                                      'Experience ${job.experience} years',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 13),
                                    Text(
                                      'Location: ${job.location}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => QuizScreen(
                                                  jobTitle: job.title,
                                                  requiredSkill: job.skills,
                                                  description: job.description,
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            "Take to quiz",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF6B1A6B)),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is JobError) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
              ),
            ),
          ],
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
