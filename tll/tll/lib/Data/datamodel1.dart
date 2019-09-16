/*
Data model for querying alphabet
 */


class AlphabetDataModel {
  String name;
  String audiofile;
  String flag;

  AlphabetDataModel({this.name, this.flag, this.audiofile});

  factory AlphabetDataModel.fromJson(Map<String, dynamic> json) {
    return new AlphabetDataModel(
      name: json['name'] as String,
      flag: json['pic_alphabet'] as String,
      audiofile: json['audio'] as String,

      //capital: json['capital'] as String,
    );
  }
}
