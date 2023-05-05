import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:music_app/modle/music.dart';
import 'dart:convert' as convert;

class Apimusic {
  final String url = "https://storage.googleapis.com/uamp/catalog.json";
  List<Music> musicList = [];
 

  Future<List<Music>> gitAllMusic() async {
    Uri urI = Uri.parse(url);
    try {
      Response response = await http.get(urI);
      if (response.statusCode == 200) {
        late final data = response.body;
        Map<String, dynamic> responsedata = convert.jsonDecode(data);
        List result = responsedata['music'] as List<dynamic>;
        musicList = result.map((e) => Music.fromJson(e)).toList();
        return musicList;
      } else {
        return throw ('Sum error has hapen');
      }
    } catch (e) {
      return throw ('Sum error has hapen in request ');
    }
  }
}
