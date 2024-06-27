import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:measure_ap/constants/colors_sizes.dart';

class FullScreenHelper extends StatefulWidget {
  final String image;
  final Function(bool) callback;
  const FullScreenHelper(this.image, this.callback,{super.key});

  static void showImage(BuildContext context,  {required Key key, required String image, required Function(bool) callback}) =>
      showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: true,
        builder: (_) => FullScreenHelper(image,callback, key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  @override
  State<FullScreenHelper> createState() => _FullScreenHelperState();
}

class _FullScreenHelperState extends State<FullScreenHelper> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/100;
    double height = MediaQuery.of(context).size.height/100;
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(0.7),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: width*90,
              width: width*90,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.scaleDown
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            left: 50,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                widget.callback(false);
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close,color: secondaryColor,size: 50,),
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            right: 50,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                widget.callback(true);
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check,color: primaryColor,size: 50,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
