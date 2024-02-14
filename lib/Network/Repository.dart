import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_list_app/Model/AlbumModel.dart';

class Repository {
  final _baseUrl =
      "https://65c6ad5be7c384aada6deb27.mockapi.io/api/v1/get-list-view";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/List'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Album> album = it.map((e) => Album.fromJson(e)).toList();
        return album;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String title, String content) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/List'),
          body: {"title": title, "content": content});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {}
  }
}
