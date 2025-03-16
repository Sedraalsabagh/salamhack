import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
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
  String? selectedFilePath;

  void evaluateResume() {
    String jobDescription = _jobDescriptionController.text;
    if (jobDescription.isEmpty || selectedFilePath == null) return;

    // Simulated API response
    String jsonResponse =
        '{"match_percentage": 0.1, "missing_keywords": ["Python", "Django", "Flask"], "improvement_tips": "The resume lacks mention of Python, which is explicitly required in the job description."}';

    setState(() {
      evaluationResult = json.decode(jsonResponse);
    });
  }

  Future<void> pickResumeFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false, // يسمح باختيار ملف واحد فقط
      );

      if (result != null) {
        setState(() {
          selectedFilePath = result.files.single.path!;
        });
        print("تم اختيار الملف: $selectedFilePath");
      } else {
        print("لم يتم اختيار أي ملف.");
      }
    } catch (e) {
      print("خطأ أثناء اختيار الملف: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Resume Evaluator',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
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
              Container(
                margin: const EdgeInsets.only(
                    top: 8, bottom: 15, left: 10, right: 10),
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  border: Border.all(color: Colors.purple, width: 1),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 0, right: 3, left: 7),
                      child: Icon(
                        Icons.info_sharp,
                        size: 20,
                        color: Colors.purple,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "In order to be able to evaluate your CV you must upload it.",
                        style:
                            TextStyle(color: Color.fromARGB(255, 23, 22, 22)),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: pickResumeFile,
                style: ElevatedButton.styleFrom(
                  iconSize: 20,
                  iconAlignment: IconAlignment.start,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: Colors.purple,
                ),
                label: const Text(
                  "Upload Resume",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                icon: const Icon(Icons.upload_file, color: Colors.white),
                // child: Row(
                //   children: [
                //     const Text('Upload Resume', style: TextStyle(color: Colors.white, fontSize: 16)),
                //   ],
                // ),
              ),
              if (selectedFilePath != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Selected File: ${selectedFilePath!.split('/').last}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              const SizedBox(height: 18),
              TextField(
                controller: _jobDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Enter Job Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
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
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color(0xFF4A15F4),
                ),
                child: const Text('Evaluate Resume',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(height: 10),
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
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color:Colors.deepPurpleAccent)),
          const SizedBox(height: 10),
          const Text('Missing Keywords:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Wrap(
            spacing: BorderSide.strokeAlignCenter,
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
