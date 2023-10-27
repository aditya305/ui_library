import 'package:flutter/material.dart';
import 'package:ui_library/styles/styles.dart';

class CustomActionChip extends StatelessWidget {
  final Widget label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color labelColor;
  final double borderRadius;
  final EdgeInsets padding;
  final bool selected;

  const CustomActionChip({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.labelColor = CustomColors.base,
    this.borderRadius = 30.0,
    this.padding = EdgeInsets.zero,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Center(child: label),
      onPressed: onPressed,
      backgroundColor: selected ? CustomColors.darkGray : backgroundColor,
      labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: selected ? Colors.white : labelColor,
          ),
      shape: selected
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: const BorderSide(
                color: CustomColors.grayBase,
              ),
            )
          : const StadiumBorder(),
    );
  }
}
