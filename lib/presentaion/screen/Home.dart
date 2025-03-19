import 'package:devloper_app/business_logic/cubit/recommentaion_cubit.dart';
import 'package:devloper_app/presentaion/screen/widget/opportunity_reco.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<RecommendationCubit>().fetchRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Job Opportunities"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocBuilder<RecommendationCubit, RecommendationState>(
          builder: (context, state) {
            if (state is RecommendationInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RecommendationLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.recommendations.length,
                itemBuilder: (context, index) {
                  final job = state.recommendations[index];
                  return JobCard(
                    key: ValueKey(
                        '${job.title}-${job.date}'), // Ensure unique keys
                    title: job.title,
                    date: job.date,
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
