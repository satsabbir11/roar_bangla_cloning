import 'package:flutter/material.dart';
import './topper_scroll.dart';

class MyAppBody extends StatefulWidget {
  const MyAppBody({Key? key}) : super(key: key);

  @override
  State<MyAppBody> createState() => _MyAppBodyState();
}

class _MyAppBodyState extends State<MyAppBody> {
  @override
  Widget build(BuildContext context) {
    return const TopperScroll();
  }
}
