class AssessmentResponse {
  String? id;
  List<SectionModel>? sections;

  AssessmentResponse({this.id, this.sections});

  factory AssessmentResponse.fromJson(Map<String, dynamic> json) {
    return AssessmentResponse(
      id: json['_id']?.toString(),
      sections: (json['sections'] as List<dynamic>?)
          ?.map((e) => SectionModel.fromJson(e))
          .toList(),
    );
  }
}

class SectionModel {
  String? sectionId;
  String? sectionName;
  List<QuestionModel>? questions;

  SectionModel({this.sectionId, this.sectionName, this.questions});

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      sectionId: json['sectionId']?.toString(),
      sectionName: json['sectionName']?.toString() ?? "",
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionModel.fromJson(e))
          .toList(),
    );
  }
}

class QuestionModel {
  String? questionId;
  String? question;
  List<String>? options;
  String? selectedAnswer;
  int? points;
  List<SubmissionModel>? submissions;

  QuestionModel({
    this.questionId,
    this.question,
    this.options,
    this.selectedAnswer,
    this.points,
    this.submissions,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      questionId: json['questionId']?.toString(),
      question: json['question']?.toString() ?? "",
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      selectedAnswer: json['selectedAnswer']?.toString(),
      points: json['points'] is int
          ? json['points']
          : int.tryParse(json['points'].toString() ?? "0"),
      submissions: (json['submissions'] as List<dynamic>?)
          ?.map((e) => SubmissionModel.fromJson(e))
          .toList(),
    );
  }
}

class SubmissionModel {
  String? staffId;
  String? selectedAnswer;
  String? submittedAt;
  String? id;

  SubmissionModel({
    this.staffId,
    this.selectedAnswer,
    this.submittedAt,
    this.id,
  });

  factory SubmissionModel.fromJson(Map<String, dynamic> json) {
    return SubmissionModel(
      staffId: json['staffId']?.toString(),
      selectedAnswer: json['selectedAnswer']?.toString(),
      submittedAt: json['submittedAt']?.toString(),
      id: json['_id']?.toString(),
    );
  }
}
