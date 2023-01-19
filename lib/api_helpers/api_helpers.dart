import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api_models/api_models.dart';

class NewsHelper {
  NewsHelper._();
  static final NewsHelper newsHelper = NewsHelper._();

  final String url =
      "https://newsapi.org/v2/top-headlines?country=us&category=&apiKey=78003ad7858241e39f6e0bc0864ffbdc";
  Future<News?> fetchAllNewsData() async {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? news = News.fromJson(data: decodeData);

      print(decodeData);

      return news;
    }
    return null;
  }

  final String sport =
      "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=78003ad7858241e39f6e0bc0864ffbdc";
  Future<News?> fetchAllSportsNewsData() async {
    http.Response res = await http.get(Uri.parse(sport));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? sportsNews = News.fromJson(data: decodeData);

      print(decodeData);

      return sportsNews;
    }
    return null;
  }

  final String business =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=78003ad7858241e39f6e0bc0864ffbdc";
  Future<News?> fetchAllBusinessNewsData() async {
    http.Response res = await http.get(Uri.parse(business));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? businessNews = News.fromJson(data: decodeData);

      print(decodeData);

      return businessNews;
    }
    return null;
  }

  final String entertainment =
      "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=78003ad7858241e39f6e0bc0864ffbdc";
  Future<News?> fetchAllEntertainNewsData() async {
    http.Response res = await http.get(Uri.parse(entertainment));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? entertainmentNews = News.fromJson(data: decodeData);

      print(decodeData);

      return entertainmentNews;
    }
    return null;
  }

  final String science =
      "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=78003ad7858241e39f6e0bc0864ffbdc";
  Future<News?> fetchAllScienceNewsData() async {
    http.Response res = await http.get(Uri.parse(science));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? scienceNews = News.fromJson(data: decodeData);

      print(decodeData);

      return scienceNews;
    }
    return null;
  }

  final String health =
      "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=78003ad7858241e39f6e0bc0864ffbdc";
  Future<News?> fetchAllHealthNewsData() async {
    http.Response res = await http.get(Uri.parse(health));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? healthNews = News.fromJson(data: decodeData);

      print(decodeData);

      return healthNews;
    }
    return null;
  }

  final String technology =
      "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=78003ad7858241e39f6e0bc0864ffbdc";
  Future<News?> fetchAllTechnologyNewsData() async {
    http.Response res = await http.get(Uri.parse(technology));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? technologyNews = News.fromJson(data: decodeData);

      print(decodeData);

      return technologyNews;
    }
    return null;
  }
}
