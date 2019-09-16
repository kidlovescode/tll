class Planet {
  final String id;
  final String name;
  final String location;
  final String distance;
  final String gravity;
  final String description;
  final String image;

  const Planet({this.id, this.name, this.location, this.distance, this.gravity,
    this.description, this.image});
}

List<Planet> planets = [
  const Planet(
    id: "1",
    name: "อ่านพยัญชนะ",
    location: "เรียนรู้คำนาม",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "คำนาม ใช้เรียก คน สัตว์ สิ่งของ",
    image: "images/mars.png",
  ),
  const Planet(
    id: "2",
    name: "อ่านสระ",
    location: "Milkyway Galaxy",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "Lorem ipsum...",
    image: "images/neptune.png",
  ),
  const Planet(
    id: "3",
    name: "อ่านคำ",
    location: "Milkyway Galaxy",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "Lorem ipsum...",
    image: "images/moon.png",
  ),
  const Planet(
    id: "4",
    name: "ประลอง",
    location: "Milkyway Galaxy",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "Lorem ipsum...",
    image: "images/mercury.png",
  ),

];