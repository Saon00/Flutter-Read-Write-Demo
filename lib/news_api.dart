
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model.dart';

// NewsDataModel ta amra nijera dichi
Future<List<NewsDataModel>> getNews() async{
  Uri uri = Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2021-12-06&to=2021-12-06&sortBy=popularity&apiKey=e764eb4fa32b4c3bbc75ea11a7116d88');

  final response = await http.get(uri);

  if(response.statusCode == 200 || response.statusCode == 201){
    Map<String, dynamic> map = json.decode(response.body);

    List _articlesList = map['articles'];

    List<NewsDataModel> newsList = _articlesList.map((jsonData) => NewsDataModel.fromJson(jsonData)).toList();

    print(_articlesList);
    return newsList;
  }
  else{
    print('error');
    return [];
  }


}