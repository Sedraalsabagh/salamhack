import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../business_logic/cubit/cv_cubit.dart';
import '../../data/models/cvmodel.dart';
import 'widget/custom_field.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController githubController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    githubController.dispose();
    linkedinController.dispose();
    super.dispose();
  }

  void savePersonalDetails() {
    final cvCubit = context.read<CvCubit>();

    final cvModel = CVModel(
      // usename: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      location: locationController.text,
      githubLink: githubController.text,
      linkedinLink: linkedinController.text,
    );

    cvCubit.createCV(cvModel);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Details',
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCustomField(context, 'Name', Icons.person, nameController),
              _buildCustomField(
                  context, 'Address', Icons.home, locationController),
              _buildCustomField(context, 'Email', Icons.email, emailController),
              _buildCustomField(context, 'Phone', Icons.phone, phoneController),
              _buildCustomField(
                  context, 'GitHub Link', EvaIcons.github, githubController),
              _buildCustomField(context, 'LinkedIn Account', EvaIcons.linkedin,
                  linkedinController),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: savePersonalDetails,
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomField(BuildContext context, String hint, IconData icon,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 650),
            delay: const Duration(milliseconds: 200),
            child: Form(
              child: Column(
                children: [
                  CustomField(
                    controller: controller,
                    icon: icon,
                    hint: hint,
                    gradientColors: [Colors.purple, Colors.deepPurpleAccent],
                    validator: (value) => value == null || value.isEmpty
                        ? 'This field cannot be empty'
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
