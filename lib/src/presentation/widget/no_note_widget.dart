import 'package:note_taking_app/src/core/imports/custom_imports.dart';

// A widget that displays an animation when no notes are available
class Nonote extends StatelessWidget {
  // Constructor with optional key
  const Nonote({super.key});

  @override
  Widget build(BuildContext context) {
    // Center the animation in the parent widget
    return Center(
      child: Lottie.asset(
        'assets/animation/note.json', // Path to the Lottie animation file
      ),
    );
  }
}
