import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Win11App());
}

class Win11App extends StatelessWidget {
  const Win11App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ? here goes material app
    return MaterialApp(
      // ? title of the app
      title: "Windows 11 Flutter demo",

      // ? removing debug check banner
      debugShowCheckedModeBanner: false,

      // ? Here comes home screen
      home: Win11HomeScreen(),
    );
  }
}

class Win11HomeScreen extends StatelessWidget {
  const Win11HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: AssetImage(
            //       'assets/images/Windows-11-Default-Dark-Wallpaper.jpg',
            //     )

            //     )
            ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              "assets/images/Windows-11-Default-Dark-Wallpaper.jpg",
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: WindowsTaskBar(),
            ),
            Positioned(
              bottom: getProportionalHeight(0.05, context),
              right: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.4,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WindowsTaskBar extends StatelessWidget {
  const WindowsTaskBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30.0,
            sigmaY: 30.0,
          ),
          child: Container(
            height: getProportionalHeight(0.05, context),
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: PinnedIcons(),
            ),
          ),
        ),
      ),
    );
  }
}

class PinnedIcons extends StatelessWidget {
  const PinnedIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(2),
          child: Image.asset(
            'assets/images/win11_logo-removebg-preview.png',
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          CupertinoIcons.search,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          CupertinoIcons.add,
          color: Colors.white,
        )
      ],
    );
  }
}

getProportionalHeight(double percent, context) {
  return MediaQuery.of(context).size.height * percent;
}
