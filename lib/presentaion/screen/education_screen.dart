// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'widget/education_form.dart';
// import 'package:animate_do/animate_do.dart';
// import 'custom_field.dart';
// import 'cubit/education_cubit.dart'; // تأكد من أنك تستخدم الـ Cubit المناسب

// class EducationScreen extends StatefulWidget {
//   const EducationScreen({super.key});

//   @override
//   _EducationScreenState createState() => _EducationScreenState();
// }

// class _EducationScreenState extends State<EducationScreen> {
//   // قائمة من controllers لإدارة النصوص في كل بطاقة تعليمية
//   List<List<TextEditingController>> controllers = [];

//   @override
//   void dispose() {
//     // لا تنسى التخلص من الـ controllers بعد الانتهاء
//     for (var controllerList in controllers) {
//       for (var controller in controllerList) {
//         controller.dispose();
//       }
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Education",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 19,
//                 fontWeight: FontWeight.w300)),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF5B2DF0), Color(0xFF8D148D)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: BlocBuilder<EducationCubit, EducationState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: state.educationList.length,
//                   itemBuilder: (context, index) {
//                     if (controllers.length <= index) {
//                       // إضافة TextEditingController جديد لكل بطاقة
//                       controllers.add([
//                         for (var i = 0; i < 5; i++) TextEditingController()
//                       ]);
//                     }
//                     return EducationForm(
//                       index: index,
//                       controllers: controllers[index], // إرسال الـ controllers
//                       onRemove: () {
//                         context.read<EducationCubit>().removeEducation(index);
//                         controllers
//                             .removeAt(index); // إزالة الـ controller عند الحذف
//                       },
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         context.read<EducationCubit>().addEducation();
//                         // إضافة controllers جديد لكل بطاقة
//                         controllers.add([
//                           for (var i = 0; i < 5; i++) TextEditingController()
//                         ]);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepPurpleAccent,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 24, vertical: 12),
//                       ),
//                       icon: const Icon(Icons.add, color: Colors.white),
//                       label: const Text("Add",
//                           style: TextStyle(color: Colors.white, fontSize: 16)),
//                     ),
//                     const SizedBox(width: 20),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         // تنفيذ منطق الحفظ هنا
//                         for (var controllerList in controllers) {
//                           // طباعة البيانات المدخلة في الـ controllers
//                           for (var controller in controllerList) {
//                             print(controller.text);
//                           }
//                         }
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content:
//                                   Text("Education data saved successfully!"),
//                               backgroundColor: Colors.purple),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.purple,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 24, vertical: 12),
//                       ),
//                       icon: const Icon(Icons.save, color: Colors.white),
//                       label: const Text("Save",
//                           style: TextStyle(color: Colors.white, fontSize: 16)),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
