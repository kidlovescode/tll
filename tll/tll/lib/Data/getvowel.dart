import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tll/Data/datamodel2.dart';
import 'package:http/http.dart' as http;

Future<List<VowelDataModel>> fetchData(http.Client client, String filename) async {
  // final response = await client.get('http://restcountries.eu/rest/v2/all');

  final response = await client.get(filename);
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseData, response.body);
}

// A function that will convert a response body into a List<Country>
List<VowelDataModel> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<VowelDataModel> list =
  parsed.map<VowelDataModel>((json) => new VowelDataModel.fromJson(json)).toList();
  return list;
}
