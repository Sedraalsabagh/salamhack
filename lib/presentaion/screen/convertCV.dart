import 'package:devloper_app/presentaion/ResumATS.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import '../../business_logic/cubit/resume_cubit.dart';
import '../../business_logic/cubit/resume_state.dart';
import '../../data/repository/convertcvrepository.dart';
import '../../data/webService/convertcvwebserver.dart';
import 'dart:typed_data';

class ConvertCvScreen extends StatefulWidget {
  const ConvertCvScreen({super.key});

  @override
  State<ConvertCvScreen> createState() => _ConvertCvScreenState();
}

class _ConvertCvScreenState extends State<ConvertCvScreen> {
  final LinearGradient myGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 91, 45, 240),
      Color.fromARGB(255, 141, 20, 141),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResumeCubit(ResumeRepository(ResumeWebService())),
      child: Scaffold(
        backgroundColor: const Color(0xfff8f9fD),
        appBar: AppBar(
          title: const Text(
            'Convert CV',
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: myGradient),
          ),
        ),
        body: BlocBuilder<ResumeCubit, ResumeState>(
          builder: (context, state) {
            Widget content;

            if (state is ResumeInitial) {
              content = _buildUploadCard(context);
            } else if (state is ResumeLoading) {
              content = const Center(child: CircularProgressIndicator());
            } else if (state is ResumeLoaded) {
              content = Column(
                children: [
                  _buildUploadCard(context, uploaded: true),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  AtsResumePdfScreen(resume: resumeModel)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color.fromARGB(255, 91, 45, 240),
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
            } else if (state is ResumeError) {
              content = Column(
                children: [
                  _buildUploadCard(context),
                  const SizedBox(height: 20),
                  Text(state.message,
                      style: const TextStyle(color: Colors.red)),
                ],
              );
            } else {
              content = const SizedBox();
            }

            return SingleChildScrollView(child: content);
          },
        ),
      ),
    );
  }

  Widget _buildUploadCard(BuildContext context, {bool uploaded = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          child: Column(
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return myGradient.createShader(bounds);
                },
                blendMode: BlendMode.srcIn,
                child: const Icon(Icons.upload_file, size: 48),
              ),
              const SizedBox(height: 16),
              Text(
                uploaded
                    ? 'Resume uploaded successfully'
                    : 'No resume uploaded',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    Uint8List? fileBytes = result.files.single.bytes;
                    String fileName = result.files.single.name;

                    if (fileBytes != null) {
                      context
                          .read<ResumeCubit>()
                          .convertResume(fileBytes as Uint8List, fileName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Failed to read file.')),
                      );
                    }
                  }
                },
                icon: const Icon(Icons.attach_file),
                label: const Text('Upload Resume'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 91, 45, 240),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
