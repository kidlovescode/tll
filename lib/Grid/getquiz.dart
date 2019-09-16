import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tll/Grid/quiz.dart';
import 'package:http/http.dart' as http;

Future<List<Quiz>> fetchQuiz(http.Client client) async {
 // final response = await client.get('http://restcountries.eu/rest/v2/all');

  //final
  http.Response response = await client.get('http://www.kidlovescode.com/gamethai/jason/quiz.json',headers: {'Content-Type': 'application/json'});
 debugPrint(response.body);
 var ss = utf8.decode(response.bodyBytes);
 // debugPrint(ss);
  return compute(parseData, ss);

}

// A function that will convert a response body into a List<Country>
List<Quiz> parseData( responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //  final parsed = json.decode(utf8.decode(responseBody)).cast<Map<String, dynamic>>();
  List<Quiz> list =
      parsed.map<Quiz>((json) => new Quiz.fromJson(json)).toList();
  return list;
}
