import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ConvertCvScreen extends StatefulWidget {
  const ConvertCvScreen({super.key});

  @override
  State<ConvertCvScreen> createState() => _ConvertCvScreenState();
}

class _ConvertCvScreenState extends State<ConvertCvScreen> {
  PlatformFile? uploadedFile;

  final LinearGradient myGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 91, 45, 240),
      Color.fromARGB(255, 141, 20, 141),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  Future<void> pickResume() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );

    if (result != null) {
      setState(() {
        uploadedFile = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
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
                      uploadedFile == null
                          ? 'No resume uploaded'
                          : 'Uploaded: ${uploadedFile!.name}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: pickResume,
                      icon: const Icon(Icons.attach_file),
                      label: const Text('Upload Resume'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 91, 45, 240),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (uploadedFile != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ViewResumeScreen(fileName: uploadedFile!.name),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 91, 45, 240),
                  side:
                      const BorderSide(color: Color.fromARGB(255, 91, 45, 240)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('View ATS Resume',
                    style: TextStyle(fontSize: 16)),
              ),
            ),
        ],
      ),
    );
  }
}

class ViewResumeScreen extends StatelessWidget {
  final String fileName;

  const ViewResumeScreen({super.key, required this.fileName});

  @override
  Widget build(BuildContext context) {
    final LinearGradient myGradient = const LinearGradient(
      colors: [
        Color.fromARGB(255, 91, 45, 240),
        Color.fromARGB(255, 141, 20, 141),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fD),
      appBar: AppBar(
        title: const Text(
          'ATS Resume',
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: myGradient),
        ),
      ),
      body: Center(
        child: Text(
          'Here is your ATS Resume:\n$fileName',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
