import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:devloper_app/business_logic/cubit/evaluations_cubit.dart';
import 'package:devloper_app/business_logic/cubit/evaluations_state.dart';
import 'package:devloper_app/data/models/evaluation.dart';

class ResumeEvaluatorApp extends StatefulWidget {
  const ResumeEvaluatorApp({super.key});

  @override
  State<ResumeEvaluatorApp> createState() => _ResumeEvaluatorAppState();
}

class _ResumeEvaluatorAppState extends State<ResumeEvaluatorApp> {
  final TextEditingController _jobDescriptionController =
      TextEditingController();

  // متغيرات للتفريق بين الويب والمنصات الأخرى
  String? selectedFilePath;
  Uint8List? selectedFileBytes;
  String? selectedFileName;

  Future<void> pickResumeFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        if (kIsWeb) {
          // في الويب لا يوجد مسار فعلي للملف، لذلك نستخدم البايتات
          selectedFileBytes = result.files.single.bytes;
          selectedFileName = result.files.single.name;
          setState(() {});
          debugPrint('File (web) chosen: $selectedFileName');
        } else {
          // في المنصات الأخرى يمكننا الحصول على المسار
          selectedFilePath = result.files.single.path;
          setState(() {});
          debugPrint('File (mobile/desktop) chosen: $selectedFilePath');
        }
      } else {
        debugPrint('لم يتم اختيار أي ملف.');
      }
    } catch (e) {
      debugPrint('خطأ أثناء اختيار الملف: $e');
    }
  }

  void evaluateResume() {
    final jobDescription = _jobDescriptionController.text;
    if (jobDescription.isEmpty) return;

    context.read<ResumeCubit>().evaluateResume(
          jobDescription: jobDescription,
          filePath: selectedFilePath,
          fileBytes: selectedFileBytes,
          fileName: selectedFileName,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Resume Evaluator',
          style: TextStyle(color: Colors.white),
        ),
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
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      "In order to be able to evaluate your CV, you must upload it",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 25),
                    TextButton.icon(
                      onPressed: pickResumeFile,
                      label: const Text(
                        'Upload Resume',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.purple,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      ),
                      icon: Icon(
                        Icons.upload_file,
                        size: 22,
                        color: Colors.purple,
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (kIsWeb && selectedFileName != null)
              Text('Selected File (Web): $selectedFileName'),
            if (!kIsWeb && selectedFilePath != null)
              Text('Selected File (Mobile/Desktop): $selectedFilePath'),
            const SizedBox(height: 25),
            TextField(
              controller: _jobDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Enter Job Description',
                labelStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
                prefixIcon: Icon(
                  Icons.work_rounded,
                  color: Color(0xFF4A15F4),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 13),
            ElevatedButton(
              onPressed: evaluateResume,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: Color(0xFF4A15F4),
              ),
              child: const Text('Evaluate Resume',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ResumeCubit, ResumeState>(
                builder: (context, state) {
                  if (state is ResumeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ResumeLoaded) {
                    return _buildResult(state.result);
                  } else if (state is ResumeError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResult(ResumeEvaluationResult result) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Match Percentage: ${result.matchPercentage * 100}%'),
          const SizedBox(height: 10),
          const Text('Missing Keywords:'),
          Wrap(
            spacing: 6.0,
            children: result.missingKeywords
                .map((keyword) => Chip(label: Text(keyword)))
                .toList(),
          ),
          const SizedBox(height: 10),
          const Text('Improvement Tips:'),
          Text(result.improvementTips),
        ],
      ),
    );
  }
}
