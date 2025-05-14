import 'package:note_taking_app/src/core/imports/custom_imports.dart';
import 'package:note_taking_app/src/presentation/home/view/home_screen.dart';

// Introduction screen with a welcome page and avatar selection
class IntroductionScreen extends StatefulWidget {
  // Constructor with optional key
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  // Controller for managing PageView navigation
  final PageController _controller = PageController(viewportFraction: 0.99);

  // Marks the intro as seen in SharedPreferences
  Future<void> _markIntroAsSeen() async {
    SharedPreferencesService().saveIntroductionStatus(true);
  }

  @override
  Widget build(BuildContext context) {
    // Build scaffold with a PageView for intro and avatar selection
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: _controller,
          physics:
              const NeverScrollableScrollPhysics(), // Disable swipe navigation
          children: [
            _buildIntroPage(context), // Welcome page
            _buildAvatarSelectionPage(context), // Avatar selection page
          ],
        ),
      ),
    );
  }

  // Builds the introductory page with image, text, and next button
  Widget _buildIntroPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 4), // Space at the top
          _buildIntroImage(context), // Introductory illustration
          const Spacer(flex: 1),
          _buildIntroText(), // Title and description text
          const Spacer(flex: 2),
          _buildNextButton(), // Button to navigate to next page
          const Spacer(flex: 2), // Space at the bottom
        ],
      ),
    );
  }

  // Builds the introductory SVG image
  Widget _buildIntroImage(BuildContext context) {
    return SvgPicture.asset(
      'assets/image/intro.svg',
      height: MediaQuery.of(context).size.width - 110, // Responsive height
    );
  }

  // Builds the introductory text (title and subtitle)
  Widget _buildIntroText() {
    return const Column(
      children: [
        Text(
          'All thoughts.\nOne place.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'font1',
            fontSize: 40,
          ),
        ),
        SizedBox(height: 8), // Spacing between title and subtitle
        Text(
          'Dive right in and clear that mind of yours by writing your thoughts down.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color1,
            fontFamily: 'font2',
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  // Builds the button to navigate to the avatar selection page
  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: () {
        _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic, // Smooth transition animation
        );
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(80, 80), // Fixed button size
        backgroundColor: Colors.black, // Black background
        shape: const CircleBorder(), // Circular shape
      ),
      child: const Icon(
        Iconsax.arrow_right_3,
        color: Colors.white,
      ),
    );
  }

  // Builds the avatar selection page using SelectAvatarWidget
  Widget _buildAvatarSelectionPage(BuildContext context) {
    return SelectAvatarWidget(
      txt1: 'Choose', // Title prefix
      txt2: 'Get Started', // Button text
      onPressed: () {
        _markIntroAsSeen(); // Save intro status
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            )); // Navigate to home screen
      },
      widget: [
        // Generate avatar widgets from avatarlist
        for (var avatar in avatarlist)
          AvatarWidget(
            path: avatar.Path,
            select: avatar.select,
            onTap: () {
              setState(() {
                // Deselect all avatars
                for (var avatar in avatarlist) {
                  avatar.select = false;
                }
                // Select the tapped avatar
                avatar.select = !avatar.select;
                // Save selected avatar via cubit
                BlocProvider.of<EditAvatarCubit>(context)
                    .saveAvatar(avatar.Path);
              });
            },
          ),
      ],
    );
  }
}
