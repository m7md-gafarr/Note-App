import 'package:intl/intl.dart';
import 'package:note_taking_app/src/core/imports/custom_imports.dart';

// Screen for adding a new note with title, subtitle, color, and datetime
class AddNoteScreen extends StatefulWidget {
  // Constructor with optional key
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddAndEditNotePageState();
}

class _AddAndEditNotePageState extends State<AddNoteScreen> {
  // Controls form auto-validation
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // Form key for validation and saving
  GlobalKey<FormState> formKey = GlobalKey();
  // Form field values
  String? title, subtitle;
  // Formatted current date for display and storage
  String dateTime = DateFormat('EEEE, MMM d, yyyy').format(DateTime.now());
  // Default note background color
  Color noteColor = const Color(0xffF5F5F5);

  // Saves the note if the form is valid
  void _handleSave() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // Add note via cubit
      BlocProvider.of<AddNoteCubit>(context).addNote(
        noteModel: Notemodel(
          Title: title!,
          SubTitle: subtitle!,
          color: noteColor.value,
          DataTime: dateTime,
        ),
      );
      // Refresh notes list
      BlocProvider.of<ViewNoteCubit>(context).ViewNote();
    } else {
      // Enable auto-validation on error
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build scaffold with a colored background and form
    return Scaffold(
      backgroundColor: noteColor,
      appBar: AppBar(
        backgroundColor: noteColor, // Match note color
        automaticallyImplyLeading: false, // Remove default back button
        actions: [
          _buildAppBarActions(context), // Back and save buttons
        ],
      ),
      body: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          // Show error message on failure
          if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          } else if (state is AddNoteSuccess) {
            // Navigate back on success
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          // Show loading indicator during async operations
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    _buildTitleField(), // Title input
                    _buildDateTimeDisplay(), // Datetime display
                    _buildSubtitleField(), // Subtitle input
                    const SizedBox(height: 50), // Spacing
                    const Divider(
                      color: Colors.black,
                      height: 10,
                      thickness: 1,
                    ),
                    _buildColorPicker(), // Color selection
                    const Divider(
                      color: Colors.black,
                      height: 10,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Builds the app bar actions (back and save buttons)
  Widget _buildAppBarActions(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Full width
      child: Row(
        children: [
          _buildBackButton(context), // Back button
          const Spacer(), // Space between buttons
          _buildSaveButton(), // Save button
        ],
      ),
    );
  }

  // Builds the back button to return to previous screen
  Widget _buildBackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
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
    );
  }

  // Builds the save button to save the note
  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _handleSave,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(side: BorderSide(color: Colors.black)),
        fixedSize: const Size(30, 30),
        backgroundColor: noteColor,
      ),
      child: const Icon(
        Iconsax.save_2,
        color: Colors.black,
        size: 18,
      ),
    );
  }

  // Builds the title input field
  Widget _buildTitleField() {
    return TextFormField(
      autofocus: true, // Auto-focus on load
      onSaved: (value) => title = value,
      validator: (value) => value?.isEmpty ?? true ? 'Enter Title.' : null,
      style: const TextStyle(
        fontFamily: 'font1',
        color: Colors.black,
        fontSize: 40,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Title Note',
        hintStyle: TextStyle(
          fontFamily: 'font1',
          color: Colors.black,
          fontSize: 40,
        ),
      ),
    );
  }

  // Builds the datetime display
  Widget _buildDateTimeDisplay() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        dateTime, // Formatted current date
        style: const TextStyle(
          fontFamily: 'font2',
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }

  // Builds the subtitle input field
  Widget _buildSubtitleField() {
    return TextFormField(
      onSaved: (value) => subtitle = value,
      validator: (value) =>
          value?.isEmpty ?? true ? 'Enter Note Content.' : null,
      maxLines: null, // Allow multiple lines
      keyboardType: TextInputType.multiline,
      scrollPhysics:
          const NeverScrollableScrollPhysics(), // Disable internal scrolling
      style: const TextStyle(
        fontFamily: 'font2',
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter note',
        hintStyle: TextStyle(
          fontFamily: 'font2',
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }

  // Builds the color picker with predefined color options
  Widget _buildColorPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ColorPickerButton(
          color: const Color(0xffb0e9ca), // Light green
          onPressed: () => _changeColor(const Color(0xffb0e9ca)),
        ),
        _ColorPickerButton(
          color: const Color(0xffEED3D9), // Light pink
          onPressed: () => _changeColor(const Color(0xffEED3D9)),
        ),
        _ColorPickerButton(
          color: const Color(0xff81A263), // Green
          onPressed: () => _changeColor(const Color(0xff81A263)),
        ),
        _ColorPickerButton(
          color: const Color(0xffCDF0EA), // Light cyan
          onPressed: () => _changeColor(const Color(0xffCDF0EA)),
        ),
        _ColorPickerButton(
          color: const Color(0xffB5C0D0), // Light blue
          onPressed: () => _changeColor(const Color(0xffB5C0D0)),
        ),
      ],
    );
  }

  // Updates the note color
  void _changeColor(Color newColor) {
    setState(() {
      noteColor = newColor;
    });
  }
}

// Widget for color picker buttons
class _ColorPickerButton extends StatelessWidget {
  // Color and callback for the button
  final Color color;
  final VoidCallback onPressed;

  // Constructor with required color and callback
  const _ColorPickerButton({required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(30, 30),
        backgroundColor: color, // Selected color
      ),
      child: const Text(''), // Empty text for color-only button
    );
  }
}
