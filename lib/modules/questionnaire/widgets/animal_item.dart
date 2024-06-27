import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:measure_ap/constants/colors_sizes.dart';
import 'package:measure_ap/modules/questionnaire/widgets/show_full_image.dart';

import '../../../common/widgets/global_text_widget.dart';

class AnimalItem extends StatelessWidget {
  final bool? isSelected;
  final String title;
  final String image;
  final Function(bool) onChanged;

  const AnimalItem({super.key, this.isSelected, required this.title, required this.image, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.scaleDown
                    ),
                  ),
                ),
                onTap: (){
                  FullScreenHelper.showImage(context, key: ObjectKey(image), image: image, callback: onChanged);
                },
              ),
              const SizedBox(
                width: 20,
              ),
              GlobalTextWidget.title(title),
              Expanded(child: Container()),
              Switch(
                value: isSelected ?? false,
                onChanged: onChanged,
                activeColor: Colors.white,
                activeTrackColor: secondaryColor,
                inactiveTrackColor: Colors.black45,
              )
            ],
          ),
        ),
      ],
    );
  }
}
