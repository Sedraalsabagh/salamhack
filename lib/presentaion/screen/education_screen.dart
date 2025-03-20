import 'package:devloper_app/data/models/cvmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/cv_cubit.dart';
import '../../data/models/convertcvmodel.dart';
import 'widget/custom_field.dart';
import 'profile_screen.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final List<List<TextEditingController>> _educationControllers = [];

  @override
  void initState() {
    super.initState();
    _addEducationForm();
  }

  @override
  void dispose() {
    for (var controllerList in _educationControllers) {
      for (var controller in controllerList) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  void _addEducationForm() {
    setState(() {
      _educationControllers.add([
        TextEditingController(), // University Name
        TextEditingController(), // Degree
        TextEditingController(), // Field of Study
        TextEditingController(), // Start Year
        TextEditingController(), // End Year
      ]);
    });
  }

  void _removeEducationForm(int index) {
    if (_educationControllers.length > 1) {
      setState(() {
        _educationControllers[index]
            .forEach((controller) => controller.dispose());
        _educationControllers.removeAt(index);
      });
    }
  }

  void _saveEducationDetails() {
    final cubit = BlocProvider.of<CvCubit>(context);

    for (var controllers in _educationControllers) {
      if (controllers[0].text.isEmpty ||
          controllers[1].text.isEmpty ||
          controllers[2].text.isEmpty ||
          controllers[3].text.isEmpty ||
          controllers[4].text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill all the fields')),
        );
        return;
      }
      final education = EducationCV(
        institution: controllers[0].text,
        degree: controllers[1].text,
        description: controllers[2].text,
        startDate: controllers[3].text,
        endDate: controllers[4].text,
      );
      cubit.addEducation(education);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Education",
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5B2DF0), Color(0xFF8D148D)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _educationControllers.length,
              itemBuilder: (context, index) {
                return Padding(
                  key: ValueKey(index),
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomField(
                        controller: _educationControllers[index][0],
                        icon: Icons.school,
                        hint: "University Name",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 10),
                      CustomField(
                        controller: _educationControllers[index][1],
                        icon: Icons.book,
                        hint: "Degree",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 10),
                      CustomField(
                        controller: _educationControllers[index][2],
                        icon: Icons.work,
                        hint: "Field of Study",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 10),
                      CustomField(
                        controller: _educationControllers[index][3],
                        icon: Icons.date_range,
                        hint: "Start Year",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 10),
                      CustomField(
                        controller: _educationControllers[index][4],
                        icon: Icons.date_range,
                        hint: "End Year",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () => _removeEducationForm(index),
                          icon: const Icon(Icons.remove_circle,
                              color: Colors.redAccent),
                        ),
                      ),
                      const Divider(thickness: 1.5),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: _addEducationForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text("Add",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _saveEducationDetails,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: const Text("Save",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
