import 'package:flutter/material.dart';
import 'package:project/favorite_provider.dart';
import 'finished_provider.dart';
import 'home_screen.dart';
import 'favorite_screen.dart';
import 'package:provider/provider.dart';
import 'finished_screen.dart';


void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => FinishedProvider()),
      ],
    child: MaterialApp(
      title: 'CSCI410 Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const HomePage(),
    ),
    );
  }

  class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    int currentIndex=0;
    List screens=[
      const HomeScreen(),
      const FavoriteScreen(),
      const FinishedScreen(),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("ComicsVerse",
            style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white24,
        ),
        body: screens[currentIndex],
        backgroundColor: Colors.grey,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white24,
          currentIndex: currentIndex,
          onTap: (value){
            setState(() => currentIndex=value);
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white54,

          items: const[
            BottomNavigationBarItem(
              label:"Home",
              icon:Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label:"Favorite",
              icon:Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label:"Finished",
              icon:Icon(Icons.check_circle),
            ),
          ],
        ),
      );
    }
  }



