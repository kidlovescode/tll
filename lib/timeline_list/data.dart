import 'package:flutter/material.dart';
var Lesson = new LessonData();
class LessonData {
  var lesson = ["พยัญชนะ","พยัญชนะประสม","","สระ","ผสมพยัญชนะและสระ","คำและสระ","คำและสระไม่ออกเสียง","สระเสียงสูง","สระเสียงต่ำ"];
  var topic = [{"พยัญชนะ","ประเภท","พยัญชนะประสม","เดี่ยว"},{"อักษรควบแท้","อักษรควบไม่แท้"},{"สระไม่ออกเสียง","สระออกเสียง"},{"พยัญชนะ","ประเภท","พยัญชนะประสม","เดี่ยว"},{"พยัญชนะ","ประเภท","พยัญชนะประสม","เดี่ยว"},{"พยัญชนะ","ประเภท","พยัญชนะประสม","เดี่ยว"},
    {"พยัญชนะ","ประเภท","พยัญชนะประสม","เดี่ยว"},{"พยัญชนะ","ประเภท","พยัญชนะประสม","เดี่ยว"}];
}
class Doodle {
  final String name;
  final String time;
  final String content;
  final String doodle;
  final Color iconBackground;
  final Icon icon;
  const Doodle(
      {this.name,
        this.time,
        this.content,
        this.doodle,
        this.icon,
        this.iconBackground});
}


 List<Doodle> doodles = [
  Doodle(
      name: Lesson.lesson[0].toString(),
      time: Lesson.topic[0].toString(),
      content:
      "",
      doodle:
      "http://www.kidlovescode.com/gamethai/pic/menu/kidread1.jpg",
      icon: Icon(Icons.star, color: Colors.white),
      iconBackground: Colors.cyan),
  Doodle(
      name: Lesson.lesson[1].toString(),
      time: Lesson.topic[1].toString(),
      content:
      " ",
      doodle:
    "http://www.kidlovescode.com/gamethai/pic/menu/kidread2.jpg",
      icon: Icon(
        Icons.chrome_reader_mode,
        color: Colors.white,
      ),
      iconBackground: Colors.redAccent),
  Doodle(
      name: Lesson.lesson[2].toString(),
      time: Lesson.topic[2].toString(),
      content:
      "",
      doodle:
      "http://www.kidlovescode.com/gamethai/pic/menu/kidread3.gif",
      icon: Icon(
        Icons.visibility,
        color: Colors.black87,
        size: 32.0,
      ),
      iconBackground: Colors.yellow),
  Doodle(
      name: Lesson.lesson[3].toString(),
      time: Lesson.topic[3].toString(),
      content:
      "Biruni is regarded as one of the greatest scholars of the Golden Age of Muslim civilisation and was well versed in physics, mathematics, astronomy, and natural sciences, and also distinguished himself as a historian, chronologist and linguist. He studied almost all fields of science and was compensated for his research and strenuous work. Royalty and powerful members of society sought out Al-Biruni to conduct research and study to uncover certain findings.",
      doodle:
      "http://www.kidlovescode.com/gamethai/pic/menu/kidread4.png",
      icon: Icon(
        Icons.account_balance,
        color: Colors.black87,
      ),
      iconBackground: Colors.amber),
  Doodle(
      name: Lesson.lesson[4].toString(),
      time: Lesson.topic[4].toString(),
      content:
      "Avicenna (Ibn Sīnā) was a Persian polymath who is regarded as one of the most significant physicians, astronomers, thinkers and writers of the Islamic Golden Age. He has been described as the father of early modern medicine. Of the 450 works he is known to have written, around 240 have survived, including 150 on philosophy and 40 on medicine.\nHis most famous works are The Book of Healing, a philosophical and scientific encyclopedia, and The Canon of Medicine, a medical encyclopedia which became a standard medical text at many medieval universities and remained in use as late as 1650. In 1973, Avicenna's Canon Of Medicine was reprinted in New York.\nBesides philosophy and medicine, Avicenna's corpus includes writings on astronomy, alchemy, geography and geology, psychology, Islamic theology, logic, mathematics, physics and works of poetry.",
      doodle:
      "http://www.kidlovescode.com/gamethai/pic/menu/kidread5.jpg",
      icon: Icon(
        Icons.healing,
        color: Colors.white,
      ),
      iconBackground: Colors.green),
  Doodle(
      name: Lesson.lesson[5].toString(),
      time: Lesson.topic[5].toString(),
      content:
      "Averroes was an Andalusian philosopher and thinker who wrote about many subjects, including philosophy, theology, medicine, astronomy, physics, Islamic jurisprudence and law, and linguistics. His philosophical works include numerous commentaries on Aristotle, for which he was known in the West as The Commentator. He also served as a judge and a court physician for the Almohad Caliphate.",
      doodle:
      "http://www.kidlovescode.com/gamethai/pic/menu/kidread6.png",
      icon: Icon(
        Icons.blur_circular,
        color: Colors.white,
      ),
      iconBackground: Colors.indigo),
  Doodle(
      name: Lesson.lesson[6].toString(),
      time: Lesson.topic[6].toString(),
      content:
      "Tusi was a Persian polymath, architect, philosopher, physician, scientist, and theologian. He is often considered the creator of trigonometry as a mathematical discipline in its own right. Ibn Khaldun (1332–1406) considered Al-Tusi to be the greatest of the later Persian scholars.",
      doodle:
      "http://www.kidlovescode.com/gamethai/pic/menu/kidread7.jpg",
      icon: Icon(
        Icons.category,
        color: Colors.white,
      ),
      iconBackground: Colors.pinkAccent),
  Doodle(
      name: Lesson.lesson[7].toString(),
      time: Lesson.topic[7].toString(),
      content:
      "Over a period of thirty years, Ibn Battuta visited most of the Islamic world and many non-Muslim lands, including North Africa, the Horn of Africa, West Africa, the Middle East, Central Asia, Southeast Asia, South Asia and China. Near the end of his life, he dictated an account of his journeys, titled A Gift to Those Who Contemplate the Wonders of Cities and the Marvels of Travelling (Tuḥfat an-Nuẓẓār fī Gharāʾib al-Amṣār wa ʿAjāʾib al-Asfār), usually simply referred to as The Travels (Rihla). This account of his journeys provides a picture of a medieval civilisation that is still widely consulted today.",
      doodle:
      "http://www.kidlovescode.com/gamethai/pic/menu/kidread8.jpg",
      icon: Icon(
        Icons.navigation,
        color: Colors.white,
        size: 32.0,
      ),
      iconBackground: Colors.deepPurpleAccent),

];