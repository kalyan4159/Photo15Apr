import 'package:http/http.dart' as http;

import 'dart:convert';

class UpdateApi {
  Future<void> updateIsLiked(String id,bool isLiked) async {
   
   try {
    final isLikedUrl = Uri.parse('https://us-central1-dev-app-4a91c.cloudfunctions.net/photoGallery/isLiked');
    
     final body = jsonEncode({'id': id,'isLiked':isLiked});
    
      final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var response= await http.put(
      isLikedUrl,
      headers: headers,
      body: body
    );


     print('Request URL: $isLikedUrl');
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
     print('Request Body: $body');
   
   if(response.statusCode==200) {
     print('Sucessfully Isliked updated');
   } 
   else {
    print('Not updated $response.statusCode');
    print('Response body $response.body');
   }

  }
  catch (e) {
    print('Failed to Update iSliked. Error: $e');
  }
}
}