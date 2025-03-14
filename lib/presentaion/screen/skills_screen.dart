// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'widget/skill_form.dart';

// ///🚀

// class SkillsScreen extends StatelessWidget {
//   const SkillsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Skills",
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
//       body: BlocBuilder<SkillsCubit, SkillsState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: state.skillsList.length,
//                   itemBuilder: (context, index) {
//                     return SkillForm(
//                       index: index,
//                       onRemove: () {
//                         context.read<SkillsCubit>().removeSkill(index);
//                       },
//                     );
//                   },
//                 ),
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.all(16.0),
//               //   child: ElevatedButton(
//               //     onPressed: () {
//               //       context.read<SkillsCubit>().addSkill();
//               //     },
//               //     style: ElevatedButton.styleFrom(
//               //       backgroundColor:Colors.deepPurpleAccent,
//               //       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               //     ),
//               //     child: const Text("+  Add", style: TextStyle(color: Colors.white, fontSize: 16)),
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end, // توزيع الزرين
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         context.read<SkillsCubit>().addSkill();
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
//                     SizedBox(
//                       width: 20,
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content: Text("Projects saved successfully!"),
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
