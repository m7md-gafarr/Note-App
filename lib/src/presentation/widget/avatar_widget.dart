import 'package:note_taking_app/src/core/imports/custom_imports.dart';

// A widget that displays an avatar with selection state and tap functionality
class AvatarWidget extends StatelessWidget {
  // Constructor with required parameters for tap callback, image path, and selection state
  AvatarWidget({
    super.key,
    required this.onTap,
    required this.path,
    required this.select,
  });

  // Path to the avatar image asset
  String path;
  // Indicates if the avatar is selected
  bool select;
  // Callback function for tap events
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // Build a tappable container with the avatar image
    return GestureDetector(
      onTap: onTap, // Trigger the provided callback on tap
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          // Show green border if selected, transparent otherwise
          border: Border.all(
            color: select ? Colors.green : Colors.transparent,
            width: 4,
          ),
          // Circular shape for the avatar
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          // Display the avatar image
          image: DecorationImage(
            image: AssetImage(path),
            fit: BoxFit.cover, // Ensure image fits within the container
          ),
        ),
      ),
    );
  }
}
