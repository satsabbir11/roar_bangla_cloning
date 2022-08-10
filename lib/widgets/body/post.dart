import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../api/wp_post_api.dart';
import '../../models/post.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  List<WpPost> posts = [];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await RemoteService().getPosts();
    setState(() {
      posts = res;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    image: DecorationImage(
                      //fit: BoxFit.cover,
                      image: NetworkImage(posts[index].yoastHeadJson.ogImage[0].url.toString()),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(posts[index].title.rendered.toString(),),
                  ),
                ),
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
