import 'package:note_taking_app/src/core/imports/custom_imports.dart';

// A widget that displays a list of avatars for selection with a title and action button
class SelectAvatarWidget extends StatelessWidget {
  // Constructor with required parameters for avatar widgets, button action, and text
  SelectAvatarWidget({
    super.key,
    required this.widget,
    required this.onPressed,
    required this.txt1,
    required this.txt2,
  });

  // List of avatar widgets to display
  List<Widget> widget;
  // Callback function for the action button
  void Function()? onPressed;
  // Text for the title (e.g., "Choose")
  String txt1;
  // Text for the button (e.g., "Get Started")
  String txt2;

  @override
  Widget build(BuildContext context) {
    // Build a column with title, avatar grid, and action button
    return Column(
      children: [
        // Display the title with padding
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            '$txt1 your avatar', // Title text, e.g., "Choose your avatar"
            style: const TextStyle(
              fontFamily: 'font1',
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Spacer(flex: 1), // Space between title and avatars
        // Display avatars in a wrap layout
        Wrap(
          alignment: WrapAlignment.center, // Center the avatars
          spacing: 60, // Horizontal spacing between avatars
          runSpacing: 30, // Vertical spacing between rows
          children: widget, // List of avatar widgets
        ),
        const Spacer(flex: 1), // Space between avatars and button
        // Action button with full-width styling
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ElevatedButton(
            onPressed: onPressed, // Trigger the provided callback on press
            style: ElevatedButton.styleFrom(
              fixedSize:
                  const Size(double.maxFinite, 60), // Full-width, fixed height
              backgroundColor: Colors.black, // Black background
              elevation: 0, // No shadow
            ),
            child: Text(
              txt2, // Button text, e.g., "Get Started"
              style: const TextStyle(
                fontFamily: 'font2',
                color: Colors.white,
                fontSize: 21,
              ),
            ),
          ),
        ),
        const Spacer(flex: 1), // Space at the bottom
      ],
    );
  }
}
