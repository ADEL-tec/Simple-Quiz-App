class QuestionModel {
  String? text;
  int? score;

  QuestionModel({this.score, this.text});

  QuestionModel.fromJson(Map<String, dynamic> data)
      : text = data["text"] ?? "",
        score = data["score"] ?? 0;
}
