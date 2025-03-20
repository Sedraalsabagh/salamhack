import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devloper_app/data/models/cvmodel.dart';
import 'package:devloper_app/business_logic/cubit/cv_cubit.dart';
import 'widget/custom_field.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final List<List<TextEditingController>> _experienceControllers = [];

  @override
  void initState() {
    super.initState();
    _addExperienceForm();
  }

  @override
  void dispose() {
    for (var controllerList in _experienceControllers) {
      for (var controller in controllerList) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  void _addExperienceForm() {
    setState(() {
      _experienceControllers.add([
        TextEditingController(), // Job Title
        TextEditingController(), // Company
        TextEditingController(), // Start Date
        TextEditingController(), // End Date
        TextEditingController(), // Description
      ]);
    });
  }

  void _removeExperienceForm(int index) {
    if (_experienceControllers.length > 1) {
      setState(() {
        _experienceControllers[index]
            .forEach((controller) => controller.dispose());
        _experienceControllers.removeAt(index);
      });
    }
  }

  /// حفظ بيانات الخبرات عبر Cubit
  void _saveExperienceDetails() {
    final cubit = BlocProvider.of<CvCubit>(context);

    for (var controllers in _experienceControllers) {
      if (controllers[0].text.isEmpty ||
          controllers[1].text.isEmpty ||
          controllers[2].text.isEmpty ||
          controllers[3].text.isEmpty ||
          controllers[4].text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all the fields')),
        );
        return;
      }
      List<ExperienceCV> experinceList = [];
      for (var controllers in _experienceControllers) {
        // Ensure there are at least 5 controllers
        if (controllers.length >= 5) {
          experinceList.add(
            ExperienceCV(
              jobTitle: controllers[0].text.trim(),
              company: controllers[1].text.trim(),
              startDate: controllers[2].text.trim(),
              endDate: controllers[3].text.trim(),
              description: controllers[4].text.trim(),
            ),
          );
        }
      }
      cubit.updateExperience(experinceList);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Experience",
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
              itemCount: _experienceControllers.length,
              itemBuilder: (context, index) {
                return Padding(
                  key: ValueKey(index),
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomField(
                        controller: _experienceControllers[index][0],
                        icon: Icons.work,
                        hint: "Job Title",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Required'
                            : null,
                      ),
                      const SizedBox(height: 10),
                      CustomField(
                        controller: _experienceControllers[index][1],
                        icon: Icons.business,
                        hint: "Company",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Required'
                            : null,
                      ),
                      const SizedBox(height: 10),
                      CustomField(
                        controller: _experienceControllers[index][2],
                        icon: Icons.date_range,
                        hint: "Start Date",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Required'
                            : null,
                      ),
                      const SizedBox(height: 10),
                      CustomField(
                        controller: _experienceControllers[index][3],
                        icon: Icons.date_range,
                        hint: "End Date",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Required'
                            : null,
                      ),
                      const SizedBox(height: 10),
                      CustomField(
                        controller: _experienceControllers[index][4],
                        icon: Icons.description,
                        hint: "Description",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Required'
                            : null,
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () => _removeExperienceForm(index),
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
                  onPressed: _addExperienceForm,
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
                  onPressed: _saveExperienceDetails,
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
