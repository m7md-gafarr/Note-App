import 'package:note_taking_app/src/core/imports/custom_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotemodelAdapter());
  await Hive.openBox<Notemodel>(HiveService.NOTES_BOX);

  await SharedPreferencesService().init();
  final _seen = await SharedPreferencesService().getIntroductionStatus();
  runApp(MyApp(appRouter: AppRouter(), seen: _seen));
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter, this.seen});

  final AppRouter appRouter;
  final bool? seen;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
        BlocProvider(create: (context) => ViewNoteCubit()),
        BlocProvider(create: (context) => EditNoteCubit()),
        BlocProvider(create: (context) => EditAvatarCubit()),
      ],
      child: Builder(
        builder: (context) {
          // Initialize ScreenUtil
          ScreenUtil.init(
            context,
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
          );

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: seen == null
                ? AppRoutesName.homePageScreenRoute
                : (seen!
                    ? AppRoutesName.introPageScreenRoute
                    : AppRoutesName.homePageScreenRoute),
            theme: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? getThemeColorDark(context)
                : getThemeColorLight(context),
          );
        },
      ),
    );
  }
}
