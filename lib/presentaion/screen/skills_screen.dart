import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/cv_cubit.dart';
import '../../data/models/cvmodel.dart';
import 'widget/custom_field.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final List<List<TextEditingController>> _skillControllers = [];

  @override
  void initState() {
    super.initState();
    _addSkillForm();
  }

  @override
  void dispose() {
    for (var controllerList in _skillControllers) {
      for (var controller in controllerList) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  void _addSkillForm() {
    setState(() {
      _skillControllers.add([
        TextEditingController(), // Skill Name
        TextEditingController(), // Proficiency Level
      ]);
    });
  }

  void _removeSkillForm(int index) {
    setState(() {
      _skillControllers[index].forEach((controller) => controller.dispose());
      _skillControllers.removeAt(index);
    });
  }

  void saveSkills() {
    final cvCubit = context.read<CvCubit>();

    final skills = _skillControllers.map((controllers) {
      final name = controllers[0].text;
      final level = controllers[1].text;
      return Skill(skill: name, level: level);
    }).toList();

    cvCubit.addSkills(skills);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Skills saved successfully!"),
        backgroundColor: Colors.purple,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Skills",
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
              itemCount: _skillControllers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomField(
                        controller: _skillControllers[index][0],
                        icon: Icons.star_border,
                        hint: "Skill Name",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a skill name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      CustomField(
                        controller: _skillControllers[index][1],
                        icon: Icons.bar_chart,
                        hint: "Proficiency Level",
                        gradientColors: const [
                          Color(0xFF5B2DF0),
                          Color(0xFF8D148D)
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter proficiency level';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.delete,
                              color: Color.fromARGB(255, 241, 60, 175)),
                          onPressed: () => _removeSkillForm(index),
                        ),
                      ),
                      const Divider(thickness: 1),
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
                  onPressed: _addSkillForm,
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
                  onPressed: saveSkills,
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
