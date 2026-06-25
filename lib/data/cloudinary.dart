import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Cloudinary {
  static const String cloudName = 'dryio4fgy';

  static Future<String> uploadProfileImage({required File imageFile}) async {
    final uri = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );

    final request = http.MultipartRequest('POST', uri);

    request.fields['upload_preset'] = 'kkorgcru';

    request.files.add(
      await http.MultipartFile.fromPath('file', imageFile.path),
    );

    final response = await request.send();

    final responseData = await response.stream.bytesToString();

    final data = jsonDecode(responseData);

    return data['secure_url'];
  }
}
