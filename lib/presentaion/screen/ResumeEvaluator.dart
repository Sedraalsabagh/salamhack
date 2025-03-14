import 'package:flutter/material.dart';
import 'dart:convert';

class ResumeEvaluatorApp extends StatefulWidget {
  const ResumeEvaluatorApp({super.key});

  @override
  State<ResumeEvaluatorApp> createState() => _ResumeEvaluatorAppState();
}

class _ResumeEvaluatorAppState extends State<ResumeEvaluatorApp> {
  final TextEditingController _jobDescriptionController =
      TextEditingController();
  Map<String, dynamic>? evaluationResult;

  void evaluateResume() {
    String jobDescription = _jobDescriptionController.text;
    if (jobDescription.isEmpty) return;

    // Simulated API response
    String jsonResponse =
        '{"match_percentage": 0.1, "missing_keywords": ["Python", "Django", "Flask", "SQLAlchemy", "Data Science", "Machine Learning", "Deep Learning", "TensorFlow", "PyTorch", "Pandas", "NumPy", "Scikit-learn"], "improvement_tips": "The resume lacks mention of Python, which is explicitly required in the job description. Consider adding projects or experience demonstrating proficiency in Python and relevant libraries."}';

    setState(() {
      evaluationResult = json.decode(jsonResponse);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Resume Evaluator'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4A15F4), Color(0xFF6B1A6B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _jobDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Enter Job Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: evaluateResume,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: const Color(0xFF4A15F4),
                ),
                child: const Text(
                  'Evaluate Resume',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              evaluationResult != null
                  ? Expanded(child: _buildResult())
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResult() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Match Percentage: ${evaluationResult!["match_percentage"] * 100}%',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('Missing Keywords:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Wrap(
            children:
                evaluationResult!["missing_keywords"].map<Widget>((keyword) {
              return Chip(label: Text(keyword));
            }).toList(),
          ),
          const SizedBox(height: 10),
          const Text('Improvement Tips:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(evaluationResult!["improvement_tips"],
              style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
