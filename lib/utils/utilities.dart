import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/colors_sizes.dart';

class Utility {
  static int getAgeFromDOB(String birthDateString) {
    DateTime birthDate = DateTime.parse(birthDateString);
    DateTime currentDate = DateTime.now();
    int years = currentDate.year - birthDate.year;

    // Check if the birthday hasn't occurred yet this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      years--;
    }
    return years;
  }

  static showToastMessage({bool isErrorMessage = false, required String message}){
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      textColor: Colors.white,
      backgroundColor: isErrorMessage ? secondaryColor : primaryColor,
    );
  }

  static showCustomDialog(
    BuildContext context, {
    required String title,
    required String content,
    String okBtnText = "Ok",
    String? cancelBtnText,
    VoidCallback? additionalCancelFunction,
    required VoidCallback okBtnFunction,
  }) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: primaryColor,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: GlobalTextWidget.title(
                title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            child: Text(
              content,
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              onPressed: okBtnFunction,
              child: Text(
                okBtnText,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            cancelBtnText != null
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    child: Text(
                      cancelBtnText,
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                    onPressed: () {
                      if (additionalCancelFunction != null) {
                        Navigator.pop(context);
                        additionalCancelFunction();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  )
                : Container(),
          ],
        );
      },
    );
  }

  static void showInfoDialog(
      BuildContext context, {
        required String title,
        required String content,
        bool isCupertino = false,
      }) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    if (Platform.isAndroid) {
      isCupertino = false;
    }
    if (Platform.isIOS) {
      isCupertino = true;
    }
    if (isCupertino) {
      showCupertinoDialog(
          context: context,
          builder: (builder) {
            return CupertinoAlertDialog(
              title: Text(
                title,
              ),
              content: Text(
                content,
              ),
              actions: [
                CupertinoDialogAction(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            );
          });
    } else {
      showDialog(
          barrierDismissible: false,
          useRootNavigator: false,
          context: context,
          builder: (_) {
            return SizedBox(
              width: width * 90,
              child: AlertDialog(
                title: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GlobalTextWidget.title(
                      title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                content: Text(
                  content,
                ),
                actions: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                      child: GlobalTextWidget.content(
                        "Ok",
                      ),
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          });
    }
  }
}
