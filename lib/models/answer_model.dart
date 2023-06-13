class AnswerModel {
  String? text;
  bool? isCorrect;

  AnswerModel({this.isCorrect, this.text});

  AnswerModel.fromJson(Map<String, dynamic> data)
      : text = data["text"] ?? "",
        isCorrect = data["isCorrect"] ?? false;
}
