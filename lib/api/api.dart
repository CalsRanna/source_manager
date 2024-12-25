import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:source_manager/model/source.dart';

class Api {
  static const String baseUrl = "http://127.0.0.1:8080";

  Future<List<Source>> getSources() async {
    var url = Uri.parse('$baseUrl/api/source');
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    return (data as List).map((e) => Source.fromJson(e)).toList();
  }

  Future<Source> getSource(int id) async {
    var url = Uri.parse('$baseUrl/api/source/$id');
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    return Source.fromJson(data);
  }
}
