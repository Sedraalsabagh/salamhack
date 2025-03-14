import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:animate_do/animate_do.dart';

import 'widget/custom_field.dart';

class PersonalForm extends StatefulWidget {
  final int index;
  final VoidCallback onRemove;

  const PersonalForm({super.key, required this.index, required this.onRemove});

  @override
  _PersonalFormState createState() => _PersonalFormState();
}

class _PersonalFormState extends State<PersonalForm> {
  // إنشاء متغيرات TextEditingController لكل حقل
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }
=======
import 'package:icons_plus/icons_plus.dart';
import 'widget/custom_field.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});
>>>>>>> 7b09cbda9806e8b0980fdbe764ee14ba1af69356

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController githubController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    githubController.dispose();
    linkedinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: const BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Personal ${widget.index + 1}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: widget.onRemove,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6, left: 6, top: 12),
                child: Column(
                  children: [
                    _buildCustomField(
                        context, 'Name', Icons.person, _nameController),
                    _buildCustomField(
                        context, 'Email', Icons.email, _emailController),
                    _buildCustomField(
                        context, 'Phone', Icons.phone, _phoneController),
                    _buildCustomField(
                        context, 'Address', Icons.home, _addressController),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
=======
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
              _buildCustomField(context, 'Address', Icons.home, addressController),
              _buildCustomField(context, 'Email', Icons.email, emailController),
              _buildCustomField(context, 'Phone', Icons.phone, phoneController),
              _buildCustomField(context, 'Date of Birth', Icons.cake, dobController),
              _buildCustomField(context, 'GitHub Link', EvaIcons.github, githubController),
              _buildCustomField(context, 'LinkedIn account', EvaIcons.linkedin, linkedinController),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
>>>>>>> 7b09cbda9806e8b0980fdbe764ee14ba1af69356
    );
  }

  Widget _buildCustomField(
<<<<<<< HEAD
    BuildContext context,
    String hint,
    IconData icon,
    TextEditingController controller,
  ) {
=======
      BuildContext context, String hint, IconData icon, TextEditingController controller) {
>>>>>>> 7b09cbda9806e8b0980fdbe764ee14ba1af69356
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
<<<<<<< HEAD
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
=======
                    validator: (value) => value == null || value.isEmpty
                        ? 'This field cannot be empty'
                        : null,
>>>>>>> 7b09cbda9806e8b0980fdbe764ee14ba1af69356
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
