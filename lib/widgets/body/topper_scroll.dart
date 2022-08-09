import 'package:flutter/material.dart';
import '../../api/wp_categories_api.dart';
import '../../models/categories.dart';

class TopperScroll extends StatefulWidget {
  const TopperScroll({Key? key}) : super(key: key);

  @override
  State<TopperScroll> createState() => _TopperScrollState();
}

class _TopperScrollState extends State<TopperScroll> {
  List<WpPost>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 50,
        child: Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                //width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  posts![index].name.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
            ],
          );
        },
      ),
    ));
  }
}
