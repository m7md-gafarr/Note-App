import 'package:note_taking_app/src/core/imports/custom_imports.dart';

class EditAvatarScreen extends StatefulWidget {
  const EditAvatarScreen({super.key});

  @override
  State<EditAvatarScreen> createState() => _EditavatarPageState();
}

class _EditavatarPageState extends State<EditAvatarScreen> {
  // Method to handle avatar selection and saving
  void _selectAvatar(int index) {
    setState(() {
      // Deselect all avatars
      for (var avatar in avatarlist) {
        avatar.select = false;
      }

      // Select the tapped avatar
      avatarlist[index].select = true;

      // Save the selected avatar path using the EditAvatarCubit
      BlocProvider.of<EditAvatarCubit>(context)
          .saveAvatar(avatarlist[index].Path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SelectAvatarWidget(
          txt1: "Edit",
          txt2: "Save Edit",
          onPressed: () {
            // Pop the current screen and reload the avatar after editing
            Navigator.pop(context);
            BlocProvider.of<EditAvatarCubit>(context).loadAvatar();
          },
          widget: [
            // Create AvatarWidget for each avatar in the list
            for (var i = 0; i < avatarlist.length; i++)
              AvatarWidget(
                path: avatarlist[i].Path,
                select: avatarlist[i].select,
                onTap: () => _selectAvatar(i), // Handle avatar selection
              ),
          ],
        ),
      ),
    );
  }
}
