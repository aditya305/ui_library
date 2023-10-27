import 'package:flutter/material.dart';
import 'package:ui_library/styles/colors.dart';

class CustomCircleButton extends StatefulWidget {
  final VoidCallback onClickPressed;
  final Color buttonColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  final IconData iconData;

  const CustomCircleButton({
    Key? key,
    required this.onClickPressed,
    this.buttonColor = CustomColors.darkCharcoalGray,
    required this.iconColor,
    this.size = 80,
    this.iconSize = 45.0,
    required this.iconData,
  }) : super(key: key);

  @override
  _CustomCircleButtonState createState() => _CustomCircleButtonState();
}

class _CustomCircleButtonState extends State<CustomCircleButton> {
  bool _isTapped = false;

  get onClickPressed => null;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _isTapped = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            _isTapped = false;
          });
          widget.onClickPressed();
        },
        onTapCancel: () {
          setState(() {
            _isTapped = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(widget.size / 2),
              splashColor: Colors.white.withOpacity(0.5),
              onTap: onClickPressed, // This onTap is required by InkWell
              child: Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isTapped
                      ? widget.buttonColor.withOpacity(0.8)
                      : widget.buttonColor,
                ),
                child: Center(
                  child: Icon(
                    widget.iconData,
                    size: widget.iconSize,
                    color: widget.iconColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
