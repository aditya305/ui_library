import 'dart:math';

import 'package:flutter/material.dart';

class CustomNotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0, // Adjust spacing between notes
            mainAxisSpacing: 10.0, // Adjust spacing between notes
            childAspectRatio:
                1.0, // This will make notes maintain a 1:1 aspect ratio
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              Color bgColor = getRandomColor();
              Color textColor = getTextColor(bgColor);

              return Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor, // Function to get random colors
                      borderRadius: getNoteShape(
                          index), // Function to get different shapes
                    ),
                    child: Center(
                      child: Text(
                        'Note $index',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: 100, // Number of notes (you can change this as needed)
          ),
        ),
      ],
    );
  }

  // Function to generate random colors for notes
  Color getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  // Function to get different shapes for notes
  BorderRadius getNoteShape(int index) {
    switch (index % 3) {
      case 0:
        return BorderRadius.circular(10.0);
      case 1:
        return BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        );
      case 2:
        return BorderRadius.only(
          topRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
        );
      default:
        return BorderRadius.circular(10.0);
    }
  }

  // Function to get text color based on background color's brightness
  Color getTextColor(Color bgColor) {
    return bgColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}
