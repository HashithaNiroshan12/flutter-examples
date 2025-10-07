import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:version_3_22_8/features/demo/presentation/domain/entities/poto.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(
    Uri.parse('https://jsonplaceholder.typicode.com/photos'),
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List<Object?>).cast<Map<String, Object?>>();

  return parsed.map<Photo>(Photo.fromJson).toList();
}
