import 'package:flutter/material.dart';
import 'package:ui_library/router.dart';
import 'package:ui_library/styles/styles.dart';
import 'package:ui_library/ui/ui.dart';
import 'package:ui_library/widgets/widgets.dart';

class SampleOne extends StatefulWidget {
  const SampleOne({Key? key}) : super(key: key);

  @override
  State<SampleOne> createState() => _SampleOneState();
}

class _SampleOneState extends State<SampleOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                ),
                children: [
                  CustomCircleButton(
                    onClickPressed: () {},
                    iconData: Icons.drag_handle,
                    iconColor: CustomColors.base,
                  ),
                  Text(
                    "My \nNotes",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const CustomTabBarView(),
                ],
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCircleButton(
                      onClickPressed: () =>
                          Navigator.pushNamed(context, AppRouter.createNote),
                      buttonColor: CustomColors.darkGray,
                      iconSize: 30.0,
                      iconColor: CustomColors.base,
                      iconData: Icons.add,
                    ),
                    CustomConstants.spaceHorizontal10,
                    CustomCircleButton(
                      onClickPressed: () {},
                      buttonColor: CustomColors.base,
                      iconSize: 30.0,
                      iconColor: CustomColors.grayBase,
                      iconData: Icons.mic,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
