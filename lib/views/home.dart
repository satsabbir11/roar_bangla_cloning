import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../widgets/appbar/apk_bar.dart';
import '../widgets/body/topper_scroll.dart';
import '../widgets/body/banner.dart';
import '../widgets/body/post.dart';


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
      //body: TopperScroll(),
      body: Column(
        children: [
          Container(
            height: 40,
            child: TopperScroll(),
          ),
          Container(
            height: 200,
            child: Banners(),
          ),
          Container(
            height: 440,
            margin: const EdgeInsets.only(top: 10.0),
            child: Post(),
          ),
        ],
      )
    );
  }
}
