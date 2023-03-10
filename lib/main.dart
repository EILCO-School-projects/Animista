import 'package:animista/config/dependencies.dart';
import 'package:animista/config/firebase_options.dart';
import 'package:animista/guards/login_guard.dart';
import 'package:animista/pages/anime_details_page.dart';
import 'package:animista/pages/home_page.dart';
import 'package:animista/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //Ensure Bindings init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginGuard.routeName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        LoginGuard.routeName: (_) => LoginGuard(),
        LoginPage.routeName: (_) => LoginPage(),
        HomePage.routeName: (_) => const HomePage(),
        AnimeDetailsPage.routeName: (_) => const AnimeDetailsPage()
      },
    );
  }
}
