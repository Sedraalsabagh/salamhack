import 'package:devloper_app/business_logic/cubit/job_opportunities_cubit.dart';
import 'package:devloper_app/business_logic/cubit/job_opportunities_state.dart';
import 'package:devloper_app/data/repository/Job_opportunities.dart';
import 'package:devloper_app/presentaion/screen/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';


class JobListScreen extends StatelessWidget {
  const JobListScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobCubit(JobRepository())..loadJobs(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Job opportunities',style: TextStyle(color: Colors.white)),
        centerTitle: true,
         leading: const Icon(Icons.arrow_back, color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 91, 45, 240),
                  Color.fromARGB(255, 141, 20, 141),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),),
        body: BlocBuilder<JobCubit, JobState>(
          builder: (context, state) {
            if (state is JobLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is JobLoaded) {
              return ListView.builder(
                itemCount: state.jobs.length,
                itemBuilder: (context, index) {
                  final job = state.jobs[index];
                  return FadeInUp(
                    duration: Duration(milliseconds: 500 + (index * 100)),
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              job.description,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${job.skills}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                             const SizedBox(height: 10),
                            Text(
                              'Experience ${job.experience}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'location: ${job.location}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 10),
                            
                            Container(
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
                                child: const Text('Take to Quiz',style: TextStyle(color: Colors.purple),)
                              ),
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
    );
  }
}