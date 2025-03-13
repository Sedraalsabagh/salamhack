import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../business_logic/cubit/personal_detalis_cubit.dart';
import 'widget/custom_field.dart';


class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalDetailsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Personal Details',
            style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300),
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
                _buildCustomField(context, 'Name', Icons.person, (value) => context.read<PersonalDetailsCubit>().updateName(value)),
                _buildCustomField(context, 'Address ', Icons.home, (value) => context.read<PersonalDetailsCubit>().updateAddress(value)),
                _buildCustomField(context, 'Email', Icons.email, (value) => context.read<PersonalDetailsCubit>().updateEmail(value)),
                _buildCustomField(context, 'Phone', Icons.phone, (value) => context.read<PersonalDetailsCubit>().updatePhone(value)),
                _buildCustomField(context, 'Date of Birth ', Icons.cake, (value) => context.read<PersonalDetailsCubit>().updateDateOfBirth(value)),
                _buildCustomField(context, 'GitHub Link', EvaIcons.github, (value) => context.read<PersonalDetailsCubit>().updateWebsite(value)),
                _buildCustomField(context, 'LinkedIn account ', EvaIcons.linkedin, (value) => context.read<PersonalDetailsCubit>().updateLinkedIn(value)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomField(BuildContext context, String hint, IconData icon, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: [ 
          FadeInDown(
                        duration: const Duration(milliseconds: 650),
                        delay: const Duration(milliseconds: 200),
                        child: Form(
                          // key: _formKey,
                          child: Column(
                            children: [
          CustomField(
            controller: TextEditingController(),
            icon: icon,
            hint: hint,
            gradientColors: [Colors.purple, Colors.deepPurpleAccent],
            validator: (value) => value == null || value.isEmpty ? 'This field cannot be empty' : null,
          ),
        ],
      ),
    ))]));
  }

  // Widget _buildPhotoUploadButton() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         "Photo (Optional)",
  //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  //       ),
  //       const SizedBox(height: 8),
  //       InkWell(
  //         onTap: () {
  //           // وظيفة اختيار الصورة
  //         },
  //         borderRadius: BorderRadius.circular(8),
  //         child: Container(
  //           width: 60,
  //           height: 60,
  //           decoration: BoxDecoration(
  //             color: Colors.grey[300],
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: const Icon(Icons.add, size: 32, color: Colors.grey),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
