import 'package:flutter/material.dart';
import '../../api/wp_post_api.dart';
import '../../models/post.dart';
import 'package:jiffy/jiffy.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final String currentTime= Jiffy(DateTime.now()).format('MMM do yy');

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
                  height: 460,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    image: DecorationImage(
                      //fit: BoxFit.cover,
                      image: NetworkImage(
                          posts[index].yoastHeadJson.ogImage[0].url.toString()),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 330, bottom: 10.0, left: 10.0, right: 10.0,),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 10.0, top: 10.0,),
                                child: Text("বই ও সিনেমা", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,),),
                              ),
                              Container(
                                child: Text("***"),
                              ),
                            ],
                          ),
                         Container(
                           child:  Text(
                             posts[index].title.rendered.toString(),
                             style: const TextStyle(fontSize: 20,),
                           ),
                         ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text( Jiffy(posts[index].date.toString()).format('MMM do yy'), style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(posts[index].postMetaFields.views[0].toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
