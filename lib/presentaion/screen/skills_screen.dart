import 'package:flutter/material.dart';
import 'widget/skill_form.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final List<List<TextEditingController>> _skillControllers = []; // ✅ قائمة لمتحكمات النماذج

  @override
  void initState() {
    super.initState();
    _addSkillForm(); // ✅ إضافة نموذج افتراضي عند فتح الشاشة
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Skills",
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
                return SkillForm(
                  key: ValueKey(index),
                  index: index,
                  controllers: _skillControllers[index], 
                  onRemove: () => _removeSkillForm(index),
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
                        content: Text("Skills saved successfully!"),
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
