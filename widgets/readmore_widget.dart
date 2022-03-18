import 'package:egy_services/Screens/home/helpers/Getx/read_more_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomReadMore extends StatelessWidget {
  CustomReadMore({
    Key? key, //required String? data,

    @required color,
    @required fontSize,
    @required fontFamily,
    @required textColor,
    required this.data,
  }) : super(key: key);

  final String? data;
  Color? color;
  double? fontSize;
  String? fontFamily;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return readMore(
        data: data,
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        textColor: textColor);
  }

  Widget readMore({
    required String? data,
    int? linesNum,
    @required Color? color,
    @required double? fontSize,
    @required String? fontFamily,
    @required Color? textColor,
  }) {
    String subData = getSubString(data!);
    //String? presentedText = subData;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<ReadMoreController>(
        init: ReadMoreController(totalText: data, subText: subData),
        builder: ((controller) {
          return RichText(
            text: TextSpan(
              style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: controller.istotal! ? data : subData,
                  style: TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontSize: fontSize,
                    fontFamily: fontFamily,
                  ),
                ),
                TextSpan(
                    style: TextStyle(
                      color: Color(0xff3ABEF0),
                      overflow: TextOverflow.ellipsis,
                      fontSize: fontSize,
                      fontFamily: fontFamily,
                    ),
                    text: !controller.istotal!
                        ? 'اقرأ المزيد.. '
                        : ' ..اقرأ اقل ',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        controller.putData(isTotal: !controller.istotal!);
                      })
              ],
            ),
            textScaleFactor: 1,
          );
        }),
      ),
    );
  }
}
