import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:source_manager/model/source.dart';

class Api {
  String get baseUrl {
    if (kDebugMode) return 'http://192.168.31.181:8080';
    var uri = Uri.base;
    var host = uri.host;
    var port = uri.port;
    return 'http://$host:$port';
  }

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
