import 'package:flutter/material.dart';
import 'package:ui_library/styles/styles.dart';
import 'package:ui_library/widgets/custom_circular_button_widget.dart';

class CustomCreateNote extends StatelessWidget {
  CustomCreateNote({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: CustomColors.pastelYellow,
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
            bottom: 10.0,
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCircleButton(
                  onClickPressed: () => Navigator.pop(context),
                  buttonColor: CustomColors.grayBase.withOpacity(0.3),
                  iconSize: 27.0,
                  iconColor: CustomColors.grayBase,
                  iconData: Icons.arrow_back,
                ),
                CustomCircleButton(
                  onClickPressed: () => Navigator.pop(context),
                  buttonColor: CustomColors.grayBase.withOpacity(0.3),
                  iconSize: 27.0,
                  iconColor: CustomColors.grayBase,
                  iconData: Icons.ios_share,
                ),
              ],
            ),
            CustomConstants.spaceVerticle10,
          ],
        ),
      ),
    );
  }
}
