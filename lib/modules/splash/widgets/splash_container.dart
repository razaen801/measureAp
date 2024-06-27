import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:measure_ap/constants/colors_sizes.dart';
import 'package:measure_ap/constants/assets_paths.dart';

class SplashContainer extends StatelessWidget {
  const SplashContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: width * .25),
          child: SvgPicture.asset(
            bannerImageSvg,
          ),
        ),
      ),
    );
  }
}
