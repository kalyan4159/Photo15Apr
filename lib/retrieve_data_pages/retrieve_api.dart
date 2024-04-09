import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'retrieve_class.dart';

class RetrieveApi {
  Future<List<RetriveDataclass>?> retrieveUser() async {
    var baseUrl = Uri.parse('https://us-central1-dev-app-4a91c.cloudfunctions.net/photoGallery');
    var addPhotoUrl = Uri.parse('$baseUrl/getAllPhotos');
    
    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var res = await http.get(addPhotoUrl, headers: headers);

    if (res.statusCode == 200) {
      var jsonData = res.body;
      return retriveDataclassFromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
