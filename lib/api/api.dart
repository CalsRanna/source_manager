import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:source_manager/model/debug_result.dart';
import 'package:source_manager/model/source.dart';

class Api {
  String get baseUrl {
    // if (kDebugMode) return 'http://192.168.31.180:8080';
    var uri = Uri.base;
    var host = uri.host;
    var port = kDebugMode ? 8080 : uri.port;
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

  Future<void> storeSource(Source source) async {
    var url = Uri.parse('$baseUrl/api/source');
    var response = await http.post(url, body: jsonEncode(source.toJson()));
    if (response.statusCode < 200 || response.statusCode >= 300) {
      var data = jsonDecode(response.body);
      throw Exception('[${response.statusCode}] ${data['message']}');
    }
  }

  Future<void> updateSource(Source source) async {
    var url = Uri.parse('$baseUrl/api/source/${source.id}');
    var response = await http.put(url, body: jsonEncode(source.toJson()));
    if (response.statusCode < 200 || response.statusCode >= 300) {
      var data = jsonDecode(response.body);
      throw Exception('[${response.statusCode}] ${data['message']}');
    }
  }

  Future<void> destroySource(int id) async {
    var url = Uri.parse('$baseUrl/api/source/$id');
    var response = await http.delete(url);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      var data = jsonDecode(response.body);
      throw Exception('[${response.statusCode}] ${data['message']}');
    }
  }

  Future<DebugResult> debugSource(
    int id, {
    String type = 'search',
    String? url,
  }) async {
    var uri = Uri.parse('$baseUrl/api/debugging');
    var body = {'source_id': id, 'type': type};
    if (url != null) body['url'] = url;
    var response = await http.post(uri, body: jsonEncode(body));
    var data = jsonDecode(response.body);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('[${response.statusCode}] ${data['message']}');
    }
    return DebugResult.fromJson(data);
  }
}
