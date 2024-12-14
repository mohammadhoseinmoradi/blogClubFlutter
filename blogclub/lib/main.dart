import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import './data.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// import 'home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextcolor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376aed);

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: WidgetStateProperty.all(const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.avenir)))),
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: const ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: primaryTextcolor),
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.bold,
                  color: primaryTextcolor,
                  fontSize: 24),
              titleSmall: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w200,
                  fontSize: 18),
              titleLarge: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: primaryTextcolor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              bodyMedium: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: secondaryTextColor,
                  fontSize: 12),
              bodyLarge: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.bold,
                  color: primaryTextcolor,
                  fontSize: 18),
              bodySmall: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7b8bb2),
                  fontSize: 10),
              headlineMedium: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 20,
                  color: primaryTextcolor,
                  fontWeight: FontWeight.w700)),
        ),
        // home: Stack(children: [
        //   const Positioned.fill(child: HomeScreen()),
        //   Positioned(bottom: 0, right: 0, left: 0, child: _BootomNavigation())
        // ]),
        home: const SplashScreen());
  }
}

class _BootomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 65,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 20, color: Color(0xaa9b8487))
            ]),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BottomNavigationItem(
                  iconFileName: 'Home.png',
                  activeIconFileName: 'Home.png',
                  title: 'Home',
                ),
                _BottomNavigationItem(
                  iconFileName: 'Articles.png',
                  activeIconFileName: 'Articles.png',
                  title: 'Article',
                ),
                SizedBox(
                  width: 8,
                ),
                _BottomNavigationItem(
                  iconFileName: 'Search.png',
                  activeIconFileName: 'Search.png',
                  title: 'Search',
                ),
                _BottomNavigationItem(
                  iconFileName: 'Menu.png',
                  activeIconFileName: 'Menu.png',
                  title: 'Menu',
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: 65,
            height: 85,
            alignment: Alignment.topCenter,
            child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: const Color(0xff376aed),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: Image.asset('assets/img/icons/plus.png')),
          ),
        )
      ]),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  const _BottomNavigationItem(
      {required this.iconFileName,
      required this.activeIconFileName,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/img/icons/$iconFileName',
        ),
        const SizedBox(
          height: 4,
        ),
        Text(title, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
