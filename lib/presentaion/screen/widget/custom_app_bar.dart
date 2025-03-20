import 'package:flutter/material.dart';
import '../../../constants/Colors.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Container(),
      title: Text(
        title,
        style: const TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300),
      ),
      flexibleSpace: Container(
            decoration: BoxDecoration(gradient: MyColors.myGreadient1),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
