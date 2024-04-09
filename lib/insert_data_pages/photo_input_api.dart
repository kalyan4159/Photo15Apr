import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class PhotoInputApi {
  static var userData;
  static var resCode;

  Future<void> addPhoto() async {
   

    try {
      final baseUrl = Uri.parse('https://us-central1-dev-app-4a91c.cloudfunctions.net/photoGallery');
      final addPhotoUrl = Uri.parse('$baseUrl/addPhoto');


      var response = await http.post(
        addPhotoUrl,
      
        body: userData.toJson(),
      );
      resCode = response.statusCode.toString();
    print(resCode);
      if (response.statusCode == 201) {
        print('User created successfully');
        print(response.body);
      } else {
        print('Failed to create user');
        print(response.statusCode);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
