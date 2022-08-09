import 'package:flutter/material.dart';
import '../widgets/appbar/apk_bar.dart';
import '../widgets/body/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApkBar(),
      body: const MyAppBody(),
    );
  }
}
