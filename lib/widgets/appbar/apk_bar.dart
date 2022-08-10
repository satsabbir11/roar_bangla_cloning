import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApkBar extends AppBar {
  @override
  // TODO: implement title
  Widget? get title => Container(
        padding: const EdgeInsets.all(10.0),
        child: const Image(
          image: AssetImage('assets/images/logo_dark.png'),
          width: 120,
          height: 50,
        ),
      );

  @override
  // TODO: implement actions
  List<Widget>? get actions => const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Image(
            image: AssetImage('assets/images/search_dark.png'),
            width: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Image(
            image: AssetImage('assets/images/language.png'),
            width: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Image(
            image: AssetImage('assets/images/hamburger_dark.png'),
            width: 20,
          ),
        ),
      ];

  @override
  // TODO: implement backgroundColor
  Color? get backgroundColor => CupertinoColors.systemBackground;
}
