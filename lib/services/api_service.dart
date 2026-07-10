import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class ApiService {
  static const String baseUrl =
      "https://fakenews.squirro.com/news/sport";

  static Future<List<News>> getNews() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json =
            jsonDecode(response.body);

        final List newsList = json["news"];

        return newsList
            .map((e) => News.fromJson(e))
            .toList();
      } else {
        throw Exception(
            "Status Code : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}