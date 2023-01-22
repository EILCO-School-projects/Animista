import 'package:animista/config/firebase_options.dart';
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
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        LoginPage.routeName: (_) => const LoginPage(),
        HomePage.routeName: (_) => const HomePage(),
        AnimeDetailsPage.routeName: (_) => AnimeDetailsPage()
      },
    );
  }
}
