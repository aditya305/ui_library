import 'package:flutter/material.dart';
import 'package:ui_library/styles/constants.dart';
import 'package:ui_library/ui/ui.dart';
import 'package:ui_library/widgets/widgets.dart';

class CustomTabBarView extends StatefulWidget {
  const CustomTabBarView({Key? key});

  @override
  _CustomTabBarViewState createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomConstants.spaceVerticle15,
          Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8.0, // Adjust spacing between chips as needed
                children: [
                  CustomActionChip(
                    label: const Text("All"),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    selected: _selectedIndex == 0,
                  ),
                  CustomActionChip(
                    label: const Text("Important"),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    selected: _selectedIndex == 1,
                  ),
                  CustomActionChip(
                    label: const Text("To-do"),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    selected: _selectedIndex == 2,
                  ),
                ],
              ),
            ),
          ),
          CustomConstants.spaceVerticle15,
          CustomNotesView(),
        ],
      ),
    );
  }
}
