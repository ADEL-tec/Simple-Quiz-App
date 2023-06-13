import 'answer_model.dart';
import 'question_model.dart';

class QuizeModel {
  QuestionModel? question;
  List<AnswerModel>? answer;

  QuizeModel({this.answer, this.question});

  QuizeModel.fromJson(Map<String, dynamic> data)
      : answer = data["answers"]
                .map<AnswerModel>((e) => AnswerModel.fromJson(e))
                .toList() ??
            [],
        question = QuestionModel.fromJson(data["questionText"]);
}
