import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:http/http.dart' as Http;

import '../service/LocalDataBase/localdata.dart';

class ApiClient  {
  final String? appBaseUrl;
  static final String noInternetMessage = 'connection_to_api_server_failed';
  final int timeoutInSeconds = 30;

  String? token;
  Map<String, String>? _mainHeaders;




  ApiClient({this.appBaseUrl}) {
    if(Foundation.kDebugMode) {
      print('Token: $getToken()');
      // Logger().i("runn ");
    }

    getToken().then((value){
      // Logger().w(value);
      updateHeader(
        value??"",
      );
    });

  }

  getToken() async {

    var tokenx = await LocalDataGet().getData();

    return tokenx.get('token');
  }

  void updateHeader(String token) {
    Map<String, String> _header = {};
    _header.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    // Logger().e(token);
    _mainHeaders = _header;
    Logger().d(_mainHeaders);
  }

   Future getData({String? uri, Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        // Logger().i(uri);
        Logger().i(appBaseUrl!+uri!);
        // Logger().i("https://staging.somriddhi.com/api/app/learner/quiz/token-check");
        Logger().w(_mainHeaders);
      }
      Http.Response _response = await Http.get(
        Uri.parse(appBaseUrl!+uri!),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));

        Logger().i(jsonDecode(_response.body));

      return jsonDecode(_response.body);
    } catch (e) {
      print('------------${e.toString()}');
      return null;
    }
  }

  Future postData({String? uri, dynamic body, Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');

        Logger().d('====> API Body: $body');
        // log()

      }
      Http.Response _response = await Http.post(
        Uri.parse(appBaseUrl!+uri!),
        body: jsonEncode(body),
        headers: _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      Logger().i(jsonDecode(_response.body));
      return jsonDecode(_response.body);
    } catch (e) {
      return print(e.toString());
    }
  }

  Future postMultipartData({String? uri, Map<String, String>? body, List<MultipartBody>? multipartBody, Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body with ${multipartBody!.length} picture');
      }
      Http.MultipartRequest _request = Http.MultipartRequest('POST', Uri.parse(appBaseUrl!+uri!));
      _request.headers.addAll(headers ?? _mainHeaders!);
      for(MultipartBody multipart in multipartBody!) {
        if(multipart.file != null) {
          Uint8List _list = await multipart.file.readAsBytes();
          _request.files.add(Http.MultipartFile(
            multipart.key, multipart.file.readAsBytes().asStream(), _list.length,
            filename: '${DateTime.now().toString()}.png',
          ));
        }
      }
      _request.fields.addAll(body!);
      Http.Response _response = await Http.Response.fromStream(await _request.send());
      Logger().i(jsonDecode(_response.body));
      return jsonDecode(_response.body);
    } catch (e) {
      return null;
    }
  }

  Future<Response?> putData(String? uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body');
      }
      Http.Response _response = await Http.put(
        Uri.parse(appBaseUrl!+uri!),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return null;
    }
  }


  Future<Response?> deleteData(String uri, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      Http.Response _response = await Http.delete(
        Uri.parse(appBaseUrl!+uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return null;
    }
  }

  Response handleResponse(Http.Response response, String uri) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    }catch(e) {}

    if(Foundation.kDebugMode) {
      Logger().i('====> API Header: [] $uri\n${_body}');
    }
    return _body;
  }
}

class MultipartBody {
  String key;
  File file;

  MultipartBody(this.key, this.file);
}