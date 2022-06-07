import 'dart:convert';

import 'package:api_provider/models/models.dart';
import 'package:http/http.dart' as http;

class GetApiClass {
  Future<CustomApiProvider<ApiDemo>> getData() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=2a61185ef6a27f400fd92820ad9e8537&page=1'),
    );
    if (response.statusCode == 200) {
      return CustomApiProvider(
        data: ApiDemo.fromJson(jsonDecode(response.body)),
        statusCode: 200,
      );
    } else {
      return CustomApiProvider(statusCode: 400);
    }
  }
}
