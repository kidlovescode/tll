class Quiz {
  String question;
  String choice1,choice2,choice3,choice4;
  String answer;

  Quiz({this.question, this.choice1, this.choice2, this.choice3, this.choice4, this.answer});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return new Quiz(
      question: json['question'] as String,
      choice1: json['choice1'] as String,
      choice2: json['choice2'] as String,
      choice3: json['choice3'] as String,
      choice4: json['choice4'] as String,

      answer: json['answer'] as String,

      //capital: json['capital'] as String,
    );
  }
}
