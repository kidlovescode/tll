/*
Data model for querying vowel
 */


class VowelDataModel {
  String name;
  String audiofile;
  String pic;

  VowelDataModel({this.name, this.pic, this.audiofile});

  factory VowelDataModel.fromJson(Map<String, dynamic> json) {
    return new VowelDataModel(
      name: json['name'] as String,
      pic: json['pic_vowel'] as String,
      audiofile: json['audio'] as String,

      //capital: json['capital'] as String,
    );
  }
}
