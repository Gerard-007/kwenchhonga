import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:kwenchhonga/utils/constants.dart';
import 'package:kwenchhonga/utils/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  // get
  Future getData(String url) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("login");
    // String url = "$baseUrl/api/auth/user/";
    url = baseUrl + url;
    var _response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );
    // print(jsonDecode(_response.body));
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      return _response.body;
    } else {
      const LoadingScreen();
      print(_response.statusCode);
    }
  }

  //Another get method
  Future getDataV2(String url) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("login");
    url = baseUrl + url;
    var _response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      return json.decode(_response.body);
    } else {
      const LoadingScreen();
      // ignore: avoid_print
      print(_response.statusCode);
    }
  }

  // post data
  Future<http.Response> postData(String url, Map<String, dynamic> body) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("login");
    url = baseUrl + url;
    //About to send data
    print("About to send data...");
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: json.encode(body),
    );
    print("Data sent successfully...");
    return response;
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   // ignore: avoid_print
    //   print("Data submited sucessfully.");
    //   return response;
    // } else {
    //   throw Exception("Something went wrong.");
    // }
  }

  //update
  Future updateData(String url, Map<String, dynamic> body) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("login");
    // String url = "$baseUrl/api/auth/user/";
    url = baseUrl + url;
    var response = await http.put(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: json.encode(body),
    );
    return response;
    //throw UnimplementedError();
  }

  // patch for uploading file....
  Future<http.StreamedResponse> patchImage(String url, String filePath) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("login");
    url = baseUrl + url;

    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath("avatar", filePath));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token",
    });
    var response = request.send();
    return response;
  }

  // delete
  Future<http.StreamedResponse> deleteData(String url) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("login");
    // String url = "$baseUrl/api/auth/user/";
    url = baseUrl + url;
    var request = http.Request(
      "DELETE",
      Uri.parse(url),
    );
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token",
    });
    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 204) {
      // ignore: avoid_print
      print("plan was deleted successfully");
      return response;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
