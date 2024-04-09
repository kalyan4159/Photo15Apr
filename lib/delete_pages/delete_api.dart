
import 'package:http/http.dart' as http;

import 'dart:convert';


class DeleteApi {
  

 Future<void> deleteUser(String id) async {
  try {
    final deleteUrl = Uri.parse('https://us-central1-dev-app-4a91c.cloudfunctions.net/photoGallery/deletePhoto');
     final body = jsonEncode({'id': id});
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
     
    var response = await http.delete(deleteUrl,
    headers: headers,  body: body);

    print('Request URL: $deleteUrl');
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 204) {
      print('Photo deleted successfully.');
    } else {
      print('Failed to delete photo. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Failed to delete photo. Error: $e');
  }
}


  }
