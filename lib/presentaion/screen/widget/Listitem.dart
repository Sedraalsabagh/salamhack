import 'package:flutter/material.dart';
import '../../../constants/Colors.dart';
import '../personal_details.dart';

class ListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const ListItem({super.key, required this.icon, required this.title});

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
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => PersonalDetails(),
        //     ),
        //   );
        // },
      ),
    );
  }
}
