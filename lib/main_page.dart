import 'package:flutter/material.dart';
import 'package:ui_library/router.dart';
import 'package:ui_library/styles/constants.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
            bottom: 0.0,
          ),
          children: [
            CustomConstants.spaceVerticle15,
            Text(
              "Brewnbeer",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
            CustomConstants.spaceVerticle15,
            InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                AppRouter.notesApp,
              ),
              hoverColor: Colors.transparent,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7.0,
                    vertical: 10.0,
                  ),
                  child: ListTile(
                    title: Text(
                      "Notes",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    subtitle: Text(
                      "Take beautiful, searchable collaborative notes with the note-taking app.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Icon(
                      Icons.north_east,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
