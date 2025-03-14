import 'package:flutter/material.dart';
import 'widget/experience_form.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

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
    for (var controllers in _experienceControllers) {
      for (var controller in controllers) {
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
        _experienceControllers[index].forEach((controller) => controller.dispose());
        _experienceControllers.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Experience",
            style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300)),
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
                return ExperienceForm(
                  key: ValueKey(index),
                  index: index,
                  controllers: _experienceControllers[index],
                  onRemove: () => _removeExperienceForm(index),
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
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text("Add", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Experience data saved successfully!"),
                        backgroundColor: Colors.purple,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: const Text("Save", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
