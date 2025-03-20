import 'package:devloper_app/data/models/convertcvmodel.dart';
import 'package:devloper_app/presentaion/ResumATS.dart';
import 'package:devloper_app/presentaion/screen/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import '../../constants/Colors.dart';
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
class _ConvertCvScreenState extends State<ConvertCvScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResumeCubit(ResumeRepository(ResumeWebService())),
      child: Scaffold(
        backgroundColor: const Color(0xfff8f9fD),
        appBar: const CustomAppBar(title: "Convert Your Resume"),
        body: BlocBuilder<ResumeCubit, ResumeState>(
          builder: (context, state) {
            Widget content;

            if (state is ResumeInitial) {
              content = _buildUploadCard(context);
            } else if (state is ResumeLoading) {
              content =  Center(child: showLoadingIndicator());
            } else if (state is ResumeLoaded) {
              content = Column(
                children: [
                  _buildUploadCard(context, uploaded: true),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        print("\n the resume from the state screen" +
                            state.resume.toString() +
                            "\n DONE");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  AtsResumePdfScreen(resume: state.resume)),
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
        color:Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          child: Column(
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return MyColors.myGreadient1.createShader(bounds);
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
