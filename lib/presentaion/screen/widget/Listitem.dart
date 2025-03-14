import 'package:flutter/material.dart';
import '../../../constants/Colors.dart';

class ListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ListItem({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: ShaderMask(
          shaderCallback: (Rect bounds) {
            return MyColors.myGreadient1.createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: Icon(icon, size: 28),
        ),
        title: Text(title),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
<<<<<<< HEAD
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => PersonalDetails(),
        //     ),
        //   );
        // },
=======
        onTap: onTap, // استخدام الـ Callback بدلاً من شاشة ثابتة
>>>>>>> 7b09cbda9806e8b0980fdbe764ee14ba1af69356
      ),
    );
  }
}
