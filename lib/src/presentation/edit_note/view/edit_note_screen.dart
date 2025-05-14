import 'package:note_taking_app/src/core/imports/custom_imports.dart';

// Screen for editing an existing note with title, subtitle, color, and datetime
class EditNoteScreen extends StatefulWidget {
  // Note properties (title, subtitle, color, index) are optional; datetime is required
  String? title, subtitle;
  int? color, index;
  var datetime;

  // Constructor with optional parameters
  EditNoteScreen({
    super.key,
    this.title,
    this.subtitle,
    this.color,
    required this.datetime,
    this.index,
  });

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNoteScreen> {
  // Form key for validation and saving
  final GlobalKey<FormState> _formKey = GlobalKey();
  // Controls form auto-validation
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    // Build scaffold with a colored background and form
    return Scaffold(
      backgroundColor: Color(widget.color!), // Note background color
      appBar: _buildAppBar(), // Custom app bar with actions
      body: _buildBody(context), // Form with note fields
    );
  }

  // Builds the app bar with back, save, and delete buttons
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(widget.color!), // Match note color
      automaticallyImplyLeading: false, // Remove default back button
      actions: [
        _buildAppBarActions(), // Action buttons
      ],
    );
  }

  // Builds the row of action buttons (back, save, delete)
  Widget _buildAppBarActions() {
    return Row(
      children: [
        _buildBackButton(), // Back button
        const Spacer(), // Space between buttons
        _buildSaveButton(), // Save button
        _buildDeleteButton(), // Delete button
      ],
    );
  }

  // Builds the back button to return to previous screen
  Widget _buildBackButton() {
    return _buildActionButton(
      icon: Iconsax.arrow_left_2,
      onPressed: () => Navigator.pop(context),
    );
  }

  // Builds the save button to save note changes
  Widget _buildSaveButton() {
    return _buildActionButton(
      icon: Iconsax.save_2,
      onPressed: _saveNote,
    );
  }

  // Builds the delete button to navigate to delete confirmation
  Widget _buildDeleteButton() {
    return _buildActionButton(
      icon: Iconsax.note_remove,
      onPressed: () => _navigateToDeletePage(),
    );
  }

  // Builds a generic action button with specified icon and callback
  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(), // Circular shape
        fixedSize: const Size(30, 30), // Fixed size
        backgroundColor: Color(widget.color!), // Match note color
      ),
      child: Icon(icon, color: Colors.black, size: 18),
    );
  }

  // Navigates to the delete note screen
  void _navigateToDeletePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeleteNoteScreen(index: widget.index),
      ),
    );
  }

  // Saves the note if the form is valid
  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Update note via cubit
      BlocProvider.of<EditNoteCubit>(context).editNote(
        notemodel: Notemodel(
          Title: widget.title!,
          SubTitle: widget.subtitle!,
          color: widget.color!,
          DataTime: widget.datetime.toIso8601String(),
        ),
        index: widget.index!,
      );
      // Refresh notes list
      BlocProvider.of<ViewNoteCubit>(context).ViewNote();
    } else {
      // Enable auto-validation on error
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  // Builds the form with title, datetime, subtitle, and color picker
  Widget _buildBody(BuildContext context) {
    return BlocConsumer<EditNoteCubit, EditNoteState>(
      listener: (context, state) {
        // Navigate back on successful note edit
        if (state is EditNoteSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        // Show loading indicator during async operations
        return ModalProgressHUD(
          inAsyncCall: state is AddNoteLoading,
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    _buildTitleField(), // Title input
                    _buildDateTimeText(), // Datetime display
                    _buildSubtitleField(), // Subtitle input
                    const SizedBox(height: 50), // Spacing
                    _buildColorPicker(), // Color selection
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Builds the title input field
  Widget _buildTitleField() {
    return TextFormField(
      initialValue: widget.title,
      autofocus: true, // Auto-focus on load
      onSaved: (value) => widget.title = value,
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
  Widget _buildDateTimeText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        widget.datetime.toString(), // Display datetime as string
        style: const TextStyle(
          fontFamily: 'font2',
          color: color1,
          fontSize: 15,
        ),
      ),
    );
  }

  // Builds the subtitle input field
  Widget _buildSubtitleField() {
    return TextFormField(
      initialValue: widget.subtitle,
      onSaved: (value) => widget.subtitle = value,
      validator: (value) =>
          value?.isEmpty ?? true ? 'Enter Note Content.' : null,
      maxLines: null, // Allow multiple lines
      keyboardType: TextInputType.multiline,
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
    return Column(
      children: [
        const Divider(
          color: Colors.black,
          height: 10,
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildColorButton(const Color(0xffb0e9ca)), // Light green
            _buildColorButton(const Color(0xffEED3D9)), // Light pink
            _buildColorButton(const Color(0xff81A263)), // Green
            _buildColorButton(const Color(0xffEEEEEE)), // Light gray
            _buildColorButton(const Color(0xffB5C0D0)), // Light blue
          ],
        ),
        const Divider(
          color: Colors.black,
          height: 10,
          thickness: 1,
        ),
      ],
    );
  }

  // Builds a color selection button
  Widget _buildColorButton(Color color) {
    return ElevatedButton(
      onPressed: () => _setColor(color),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(30, 30),
        backgroundColor: color,
      ),
      child: const Text(''), // Empty text for color-only button
    );
  }

  // Updates the note color
  void _setColor(Color color) {
    setState(() {
      widget.color = color.value; // Store color as integer
    });
  }
}
