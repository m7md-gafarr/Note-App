import 'package:note_taking_app/src/core/imports/custom_imports.dart';

// A widget that displays a note with title, subtitle, and tap functionality
class NoteWidget extends StatelessWidget {
  // Constructor with required note model and optional tap callback
  NoteWidget({super.key, required this.model, required this.onTap});

  // The note data model containing title, subtitle, and color
  final Notemodel model;
  // Callback function for tap events
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // Build a tappable container with note content
    return InkWell(
      onTap: onTap, // Trigger the provided callback on tap
      child: Container(
        decoration: BoxDecoration(
          color: Color(model.color), // Background color from note model
          borderRadius: const BorderRadius.all(
            Radius.circular(20), // Rounded corners
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0), // Inner padding for content
          child: Column(
            children: [
              // Display note title aligned to the left
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  model.Title,
                  maxLines: 2, // Limit to 2 lines
                  overflow: TextOverflow.ellipsis, // Ellipsis for overflow
                  style: const TextStyle(
                    fontFamily: 'font2',
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ),
              // Divider below title
              const Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 50,
                  child: Divider(
                    color: Colors.black,
                    height: 10,
                    thickness: 0.6,
                  ),
                ),
              ),
              // Display note subtitle aligned to the left
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  model.SubTitle,
                  softWrap: true, // Allow text to wrap
                  style: const TextStyle(
                    fontFamily: 'font2',
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.fade, // Fade effect for overflow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
