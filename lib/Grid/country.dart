/*class Country {
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
*/

class Country {
  String name;
  String nativeName;
  String flag;
  String capital;
  Country({this.name, this.flag, this.capital,this.nativeName});
  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(
      name: json['name'] as String,
      nativeName: json['nativeName'] as String,
      flag: json['flag'] as String,
      capital: json['capital'] as String,
    );
  }
}
