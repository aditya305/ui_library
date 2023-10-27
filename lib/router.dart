import 'package:flutter/material.dart';
import 'package:ui_library/main_page.dart';
import 'package:ui_library/ui/ui.dart';

class AppRouter {
  static const String home = '/';
  static const String notesApp = "/sample-one";
  static const String createNote = '/createNote';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => MainPage(),
        );
      case notesApp:
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
