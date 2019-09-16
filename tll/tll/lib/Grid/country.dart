class Country {
  String name;
  String audiofile;
  String flag;

  Country({this.name, this.flag, this.audiofile});

  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(
      name: json['name'] as String,
      flag: json['pic_alphabet'] as String,
      audiofile: json['audio'] as String,

      //capital: json['capital'] as String,
    );
  }
}
