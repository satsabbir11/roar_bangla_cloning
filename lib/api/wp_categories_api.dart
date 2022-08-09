import '../models/categories.dart';
import 'package:http/http.dart' as http;

class RemoteService{
  Future<List<WpPost>?> getPosts() async{
    var client = http.Client();
    var uri = Uri.parse('https://blog.hellobcs.com/wp-json/wp/v2/categories');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return wpPostFromJson(json);
    }
    return null;
  }
}