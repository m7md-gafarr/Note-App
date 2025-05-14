import 'package:note_taking_app/src/core/imports/custom_imports.dart';
import 'package:note_taking_app/src/presentation/add_note/view/add_note_screen.dart';
import 'package:note_taking_app/src/presentation/edit_avatar/view/edit_avatar_screen.dart';

// Home screen displaying a grid of notes with an app bar and floating action button
class HomeScreen extends StatefulWidget {
  // Constructor with optional key
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load notes and avatar when the screen is initialized
    BlocProvider.of<ViewNoteCubit>(context).ViewNote();
    BlocProvider.of<EditAvatarCubit>(context).loadAvatar();
  }

  @override
  Widget build(BuildContext context) {
    // Get cubit instances for avatar and note management
    final editAvatarCubit = BlocProvider.of<EditAvatarCubit>(context);
    final viewNoteCubit = BlocProvider.of<ViewNoteCubit>(context);

    // Build scaffold with app bar, notes grid, and floating action button
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context, editAvatarCubit), // Custom app bar
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Horizontal padding
          child: BlocBuilder<ViewNoteCubit, ViewNoteState>(
            builder: (context, state) {
              // Display notes or empty state based on cubit data
              final notes = viewNoteCubit.list ?? [];
              return notes.isEmpty ? const Nonote() : _buildNotesGrid(notes);
            },
          ),
        ),
      ),
      floatingActionButton:
          _buildFloatingActionButton(context), // Add note button
    );
  }

  // Builds the app bar with title, theme toggle, and avatar
  AppBar _buildAppBar(BuildContext context, EditAvatarCubit avatarCubit) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor:
          Colors.white, // Sets icon colors (though mostly overridden)
      surfaceTintColor: Colors.white, // Controls tint for elevation
      toolbarHeight: 80, // Custom height for app bar
      automaticallyImplyLeading: false, // Remove back button
      actions: [
        _buildTitleSection(), // Title with decorative dividers
        const Spacer(), // Space between title and buttons
        _buildThemeToggleButton(), // Theme toggle button
        _buildAvatar(avatarCubit), // User avatar
      ],
    );
  }

  // Builds the title section with "My Notes" and decorative dividers
  Widget _buildTitleSection() {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Notes',
              style: TextStyle(
                fontFamily: 'font1',
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4), // Space between title and dividers
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1.8,
              endIndent: 80,
            ),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1.5,
              endIndent: 105,
            ),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              endIndent: 130,
            ),
          ],
        ),
      ),
    );
  }

  // Builds the theme toggle button (currently non-functional)
  Widget _buildThemeToggleButton() {
    return ElevatedButton(
      onPressed: () {}, // Placeholder for theme toggle logic
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(side: BorderSide(color: Colors.black)),
        fixedSize: const Size(30, 30), // Fixed button size
        backgroundColor: Colors.white,
      ),
      child: const Icon(
        Iconsax.moon,
        color: Colors.black,
        size: 18,
      ),
    );
  }

  // Builds the user avatar with tap navigation to edit avatar screen
  Widget _buildAvatar(EditAvatarCubit avatarCubit) {
    return BlocBuilder<EditAvatarCubit, EditAvatarState>(
      builder: (context, state) {
        // Use default avatar if path is null
        final avatarPath =
            avatarCubit.avatarPath ?? 'assets/image/avatar/Number=74.png';
        return Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditAvatarScreen(),
                )),
            child: CircleAvatar(
              maxRadius: 21, // Avatar size
              backgroundImage: AssetImage(avatarPath),
            ),
          ),
        );
      },
    );
  }

  // Builds the grid of notes using a woven grid layout
  Widget _buildNotesGrid(List<Notemodel> notes) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(), // Smooth scrolling effect
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2, // Two columns
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        pattern: [
          WovenGridTile(1), // Full-size tile
          WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ), // Smaller tile
        ],
      ),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        // Display each note with tap navigation to edit note screen
        return NoteWidget(
          model: note,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteScreen(
                title: note.Title,
                subtitle: note.SubTitle,
                datetime: note.DataTime,
                color: note.color,
                index: index,
              ),
            ),
          ),
        );
      },
    );
  }

  // Builds the floating action button to navigate to the add note screen
  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNoteScreen(),
        ),
      ),
      elevation: 0,
      shape: const CircleBorder(), // Circular shape
      backgroundColor: Colors.black,
      child: const Icon(
        Iconsax.note_add,
        color: Colors.white,
      ),
    );
  }
}
