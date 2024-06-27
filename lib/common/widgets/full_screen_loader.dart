import 'dart:async';

import 'package:flutter/material.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/colors_sizes.dart';

class LoaderPrimaryFull extends StatefulWidget {
  String? loadingText;

  LoaderPrimaryFull({
    super.key,
    this.loadingText,
  });

  // show and hide loader Dialog

  static void show(BuildContext context, {required Key key, String loadingText = 'Loading assessment...'}) =>
      showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoaderPrimaryFull(key: key, loadingText: loadingText),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  @override
  State<LoaderPrimaryFull> createState() => _LoaderPrimaryFullState();
}

class _LoaderPrimaryFullState extends State<LoaderPrimaryFull> {
  bool _isLoadingTimeLonger = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
          () {
        if (!mounted) return;

        setState(
              () {
            _isLoadingTimeLonger = true;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery
        .of(context)
        .platformBrightness == Brightness.light;

    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width:MediaQuery.of(context).size.width / 4,
              child: LinearProgressIndicator(
                color: primaryColor,
              ),
            ),
            GlobalTextWidget.content(widget.loadingText ?? "Loading assessment...", isBold: true,),
          ],
        ),
      ),
      // Column(
      //   mainAxisSize: MainAxisSize.min,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         LinearProgressIndicator(
      //           color: primaryColor,
      //         ),
      //       ],
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           width: 250,
      //           child: GlobalTextWidget.title("Loading assessment..."),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
      backgroundColor: Colors
          .white, // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
    );
  }
}
