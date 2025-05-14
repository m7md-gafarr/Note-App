import 'package:note_taking_app/src/core/imports/custom_imports.dart';

// A widget that displays a date in a styled container, likely for a history or calendar view
class HistoryWidget extends StatelessWidget {
  // Constructor with optional key
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Build a container with fixed dimensions and rounded corners
    return Container(
      height: 100,
      width: 60,
      decoration: const BoxDecoration(
        color: Colors.black, // Black background
        borderRadius: BorderRadius.all(
          Radius.circular(20), // Rounded corners
        ),
      ),
      // Column to display day, date, and month vertically
      child: const Column(
        children: [
          Spacer(flex: 2), // Space at the top
          Text(
            "Sun",
            style: TextStyle(
              fontFamily: "font2",
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Text(
            "15",
            style: TextStyle(
              fontFamily: "font2",
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          Text(
            "Sep",
            style: TextStyle(
              fontFamily: "font2",
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Spacer(flex: 2), // Space at the bottom
        ],
      ),
    );
  }
}

// A function that returns a similar date widget with an additional border
Widget _widget() {
  // Build a container with fixed dimensions, rounded corners, and a border
  return Container(
    height: 100,
    width: 60,
    decoration: BoxDecoration(
      color: Colors.black, // Black background
      borderRadius: const BorderRadius.all(
        Radius.circular(20), // Rounded corners
      ),
      border: Border.all(width: 2, color: Colors.black), // Black border
    ),
    // Column to display day, date, and month vertically
    child: const Column(
      children: [
        Spacer(flex: 2), // Space at the top
        Text(
          "Sun",
          style: TextStyle(
            fontFamily: "font2",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        Text(
          "15",
          style: TextStyle(
            fontFamily: "font2",
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        Text(
          "Sep",
          style: TextStyle(
            fontFamily: "font2",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        Spacer(flex: 2), // Space at the bottom
      ],
    ),
  );
}
