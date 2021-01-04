import 'dart:convert';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' show Client, Response;

// Resources
import 'package:chatquick/app/resource/http_resource.dart';

// Stores
import 'package:chatquick/app/stores/config.dart';

class HttpProvider implements HttpResource {

  final Client _client = Client();
  final Config _config = Get.find<Config>();

  String _baseUrl = '';
  
  HttpProvider() {
    _baseUrl = _config.prod ? _config.urlLoginProd : _config.urlLoginDev;
  }

  @override
  Future<Response> httpGet(String url) {
    return _client.get(_baseUrl + url);
  }
  
  @override
  Future<Response> httpPost(String url, Map body) {
    return _client.post(
      _baseUrl + url,
      headers:{"content-type": "application/json; charset=UTF-8", "Accept": "application/json" },
      body: json.encode(body)
    );
  }
  
}