import 'package:flutter/material.dart';
import 'package:ui_library/ui/ui.dart';

class AppRouter {
  static const String home = '/';
  static const String createNote = '/createNote';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => SampleOne(),
        );
      case createNote:
        return MaterialPageRoute(
          builder: (_) => CustomCreateNote(),
        );
      default:
        return null;
    }
  }
}
