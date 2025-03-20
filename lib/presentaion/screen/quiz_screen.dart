// import 'package:animate_do/animate_do.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/quiz_cubit.dart';
import '../../data/repository/quiz.dart';
import '../../data/webService/quizWebServices.dart';

class QuizScreen extends StatefulWidget {
  final String? jobTitle;
  final String? requiredSkill;
  final String? description;

  const QuizScreen({Key? key, this.jobTitle, this.requiredSkill, this.description})
      : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _requiredSkillController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // متغير لتخزين عنوان الـ AppBar الذي سيتم تحديثه بناءً على المدخلات
  String? _quizAppBarTitle;

  @override
  void initState() {
    super.initState();
    // تعبئة الحقول بمعلومات الفرصة إذا وُجدت
    if (widget.jobTitle != null) {
      _titleController.text = widget.jobTitle!;
    }
    if (widget.requiredSkill != null) {
      _requiredSkillController.text = widget.requiredSkill!;
    }
    if (widget.description != null) {
      _descriptionController.text = widget.description!;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _requiredSkillController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
Widget showLoadingIndicator() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Image.asset(
        'assets/images/Animation.gif',  
        width: 150.0,          
        height: 150.0,
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    final questionsRepository = QuestionsRepository(
      questionsWebServices: QuestionsWebServices(),
    );

    return BlocProvider(
      create: (_) => QuizCubit(questionsRepository: questionsRepository),
      child: Scaffold(
        appBar: AppBar(
          // يستخدم العنوان الذي أدخله المستخدم إن وجد، وإلا يظهر العنوان الافتراضي
          title: Text(
            _quizAppBarTitle ?? 'MCQ Quiz',
            style: const TextStyle(
              color: Colors.white, 
              fontSize: 20, 
              fontWeight: FontWeight.w500
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
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
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is QuizInitial) {
              return _buildInitialForm(context);
            } else if (state is QuizLoading) {
              return  Center(child: showLoadingIndicator());
            } else if (state is QuizLoaded) {
              return _buildAllQuestions(context, state);
            } else if (state is QuizError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text("Unknown state"));
          },
        ),
      ),
    );
  }

  Widget _buildInitialForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 15, left: 10, right: 10),
              height: 65,
              decoration: BoxDecoration(
                color: Colors.purple[50],
                border: Border.all(color: Colors.purple, width: 1),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 0, right: 3, left: 7),
                    child: Icon(
                      Icons.info_sharp,
                      size: 22,
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "In order to be able to view and answer the questions\n  you must fill in the following fields",
                        style: TextStyle(
                          color: Color.fromARGB(255, 23, 22, 22),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            FadeInDown(
              duration: const Duration(milliseconds: 650),
              delay: const Duration(milliseconds: 200),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: '  Job Title ',
                        labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey),
                        prefixIcon: Icon(Icons.work_rounded, color: Colors.purple),
                      ),
                    ),
                    const SizedBox(height: 28),
                    TextFormField(
                      controller: _requiredSkillController,
                      decoration: const InputDecoration(
                        labelText: '  Required Skill',
                        labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey),
                        prefixIcon: Icon(Icons.workspace_premium, color: Colors.purple),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: '  Description',
                        labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey),
                        prefixIcon: Icon(Icons.description_rounded, color: Colors.purple),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 34),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(17),
                        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        backgroundColor: const Color.fromARGB(255, 154, 70, 168),
                      ),
                      onPressed: () {
                        // تحديث عنوان الـ AppBar بناءً على قيمة job title المدخلة
                        setState(() {
                          _quizAppBarTitle = _titleController.text;
                        });
                        final title = _titleController.text;
                        final requiredSkill = _requiredSkillController.text;
                        final description = _descriptionController.text;
                        context.read<QuizCubit>().fetchQuiz(
                          title: title,
                          requiredSkill: requiredSkill,
                          description: description,
                        );
                      },
                      label: const Text(
                        'View Questions',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAllQuestions(BuildContext context, QuizLoaded state) {
    return ListView.builder(
      itemCount: state.questions.length,
      itemBuilder: (context, index) {
        final question = state.questions[index];
        final selectedAnswer = (index < state.userAnswers.length) ? state.userAnswers[index] : -1;
        final isAnswered = selectedAnswer != -1;
        final isCorrect = isAnswered && (selectedAnswer == question.correctAnswerIndex);
        final backgroundColor = isAnswered
            ? (isCorrect ? Colors.green.shade100 : Colors.purple.shade100)
            : Colors.white;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCirc,
            color: backgroundColor,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.questionText,
                  style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                Column(
                  children: List.generate(question.answers.length, (answerIdx) {
                    return RadioListTile<int>(
                      title: Text(
                        question.answers[answerIdx],
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87),
                      ),
                      value: answerIdx,
                      groupValue: selectedAnswer,
                      onChanged: isAnswered
                          ? null
                          : (val) {
                              context.read<QuizCubit>().selectAnswerForQuestion(index, answerIdx);
                            },
                    );
                  }),
                ),
                if (isAnswered && isCorrect)
                  const Text(
                    'Correct ✅',
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
                  )
                else if (isAnswered && !isCorrect)
                  Text(
                    'Wrong ❌\nThe correct answer is :  ${question.answers[question.correctAnswerIndex]}',
                    style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w700),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
