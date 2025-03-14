import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'custom_field.dart';

class SkillForm extends StatelessWidget {
  final int index;
  final VoidCallback onRemove;
  final List<TextEditingController> controllers;
  const SkillForm({
    super.key,
    required this.index,
    required this.onRemove,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
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
                      'Skill ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: onRemove,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6, left: 6, top: 12),
                child: Column(
                  children: [
                    _buildCustomField(context, 'Skill Name', Icons.star, controllers[0]),
                    _buildCustomField(context, 'Proficiency Level', Icons.bar_chart, controllers[1]),  
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomField(BuildContext context, String hint, IconData icon, TextEditingController controller) {
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
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
