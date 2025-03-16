import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;
  List<Map<String, dynamic>>? _questions;
  Map<int, int?> _selectedAnswers = {}; // تخزين الإجابة لكل سؤال
  Map<int, bool> _showCorrectAnswers = {}; // تخزين حالة إظهار الإجابة الصحيحة

  void _generateQuestions() {
    setState(() {
      _questions = [
        {
          "question": "What is the Global Interpreter Lock (GIL) in Python?",
          "options": ["A mechanism that prevents multiple threads from executing Python bytecode simultaneously",
           "A feature that speeds up multithreading in Python", "A lock that restricts Python from running on multiple cores"],
          "correctIndex": 0,
        },
        
        {
          "question": " What is monkey patching in Python?",
          "options": ["A debugging technique used in Python",
           "A way to handle exceptions in Python", "A process of dynamically modifying a class or module at runtime"],
          "correctIndex": 2,
        },
        {
          "question": "What is the purpose of metaclasses in Python?",
          "options": ["To store metadata about Python objects","To define how classes behave and control their creation", 
          "To improve runtime performance"],
          "correctIndex": 1,
        }
      ];
      _selectedAnswers.clear();
      _showCorrectAnswers.clear();
    });
  }

  void _selectAnswer(int questionIndex, int selectedIndex) {
    setState(() {
      // منع تغيير الإجابة إذا كانت الإجابة قد تم تحديدها مسبقًا
      if (_selectedAnswers[questionIndex] == null) {
        _selectedAnswers[questionIndex] = selectedIndex;
        _showCorrectAnswers[questionIndex] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  title: const Text(
    'Quiz Generator',
    style: TextStyle(
        color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300),
  ),
  centerTitle: true,
  flexibleSpace: Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromARGB(255, 91, 45, 240),
      Color.fromARGB(255, 141, 20, 141),
    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
  ),
),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.work_rounded),
                prefixIconColor: Colors.deepPurple,
                labelText: "Enter a job Description",
                labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  _isButtonEnabled = text.isNotEmpty;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isButtonEnabled ? _generateQuestions : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(  
                  (states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.deepPurpleAccent.withOpacity(0.5);
                    }
                    return Colors.deepPurple;
                  },
                ),
              ),
              child: const Text(
                "Generate",
                style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 16),
            if (_questions != null)
              Expanded(
                child: ListView.builder(
                  itemCount: _questions!.length,
                  itemBuilder: (context, questionIndex) {
                    final question = _questions![questionIndex];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question["question"],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            ...List.generate(question["options"].length, (index) {
                              return RadioListTile<int>(
                                title: Text(question["options"][index]),
                                value: index,
                                groupValue: _selectedAnswers[questionIndex],
                                onChanged: (value) {
                                  _selectAnswer(questionIndex, value!);
                                },
                              );
                            }),
                            if (_showCorrectAnswers[questionIndex] == true)
                              Text(
                                _selectedAnswers[questionIndex] == question["correctIndex"]
                                    ? "Correct! ✅"
                                    : "Wrong! \n The correct answer is:  ${question["options"][question["correctIndex"]]} ❌",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _selectedAnswers[questionIndex] == question["correctIndex"]
                                        ? Colors.green
                                        : Colors.red),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
