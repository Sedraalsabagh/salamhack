// import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';


class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment:Alignment.centerLeft,
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600,decorationStyle: TextDecorationStyle.dotted),
            ),
            // DottedDashedLine(
            //         height: 1,
            //         width: 120,
            //         dashSpace: 3,
            //         axis: Axis.horizontal,
            //         dashColor: Colors.red,
            //         dashWidth: 2,
            //         strokeWidth: 2),
          ],
        ),
      ),
    );
  }
}
