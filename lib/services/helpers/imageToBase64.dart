import 'dart:convert';
import 'dart:io';

Future<String> fileToBase64(File file) async {
  List<int> imageBytes = await file.readAsBytes();
  return base64Encode(imageBytes);
}
