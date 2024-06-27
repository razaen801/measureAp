import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';

import '../../../constants/assets_paths.dart';

class HeaderWithDate extends StatelessWidget {
  const HeaderWithDate({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM, yyyy').format(now);
    String day = DateFormat('EEEE').format(now);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              foregroundImage: AssetImage(doctorAvatarImage),
            ),
            SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalTextWidget.content("Welcome back"),
                GlobalTextWidget.title("Dr. Johnson"),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GlobalTextWidget.content(
              day,
              textAlign: TextAlign.right,
            ),
            GlobalTextWidget.title(
              formattedDate,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ],
    );
  }
}
