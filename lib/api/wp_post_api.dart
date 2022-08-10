import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<WpPost>> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://bdbasics.com/wp-json/wp/v2/posts');
    var response = await client.get(uri);
    try {
      var json = response.body;
      return wpPostFromJson(json);
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
