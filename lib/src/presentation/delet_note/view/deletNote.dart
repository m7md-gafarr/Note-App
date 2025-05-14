import 'package:note_taking_app/src/core/imports/custom_imports.dart';

// Screen for confirming the deletion of a note
class DeleteNoteScreen extends StatelessWidget {
  // Constructor with optional index of the note to delete
  DeleteNoteScreen({super.key, this.index});

  // Index of the note to be deleted
  int? index;

  @override
  Widget build(BuildContext context) {
    // Build scaffold with app bar and confirmation UI
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Remove default back button
        actions: [
          // Back button to return to previous screen
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              fixedSize: const Size(30, 30),
              backgroundColor: Colors.black,
            ),
            child: const Icon(
              Iconsax.arrow_left_2,
              color: Colors.white,
              size: 18,
            ),
          ),
          const Spacer(flex: 1), // Space to align button to the left
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width, // Full screen width
            height: MediaQuery.of(context).size.height - 150, // Adjusted height
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 3), // Space at the top
                  // Deletion illustration
                  SvgPicture.asset(
                    'assets/image/delet.svg',
                    height: MediaQuery.of(context).size.width -
                        110, // Responsive height
                  ),
                  const Spacer(flex: 1),
                  // Confirmation title
                  const Text(
                    'You sure\nabout this ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'font1',
                      fontSize: 40,
                    ),
                  ),
                  const Spacer(flex: 1),
                  // Informational text about note recovery
                  const Text(
                    'If you delete this note, threat not, you can still find it in the bin.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color1,
                      fontFamily: 'font2',
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(flex: 2),
                  // Delete button to confirm note deletion
                  ElevatedButton(
                    onPressed: () async {
                      // Delete note from Hive storage
                      await Hive.box<Notemodel>(hiveBox).deleteAt(index!);
                      // Refresh notes list
                      BlocProvider.of<ViewNoteCubit>(context).ViewNote();
                      // Navigate back to home screen
                      Navigator.pop(context); // Close delete screen
                      Navigator.pop(context); // Close edit screen
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize:
                          const Size(double.maxFinite, 60), // Full-width button
                      backgroundColor:
                          const Color(0xffffe3e3), // Light red background
                      elevation: 0,
                      side: const BorderSide(color: Colors.red), // Red border
                    ),
                    child: const Text(
                      'Delete this note',
                      style: TextStyle(
                        fontFamily: 'font2',
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2), // Space at the bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
